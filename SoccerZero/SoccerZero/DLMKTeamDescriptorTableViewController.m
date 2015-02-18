//
//  DLMKTeamTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamDescriptorTableViewController.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKPlayerTableViewCell.h"
#import "DLMKTimeServer.h"
#import "DLMKPlayerDescriptorTableViewController.h"

@interface DLMKTeamDescriptorTableViewController ()

@end

@implementation DLMKTeamDescriptorTableViewController



#pragma mark - InitWith
-(id) initWithTeamModel:(DLMKTeamDescriptor*)model{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _model = model;
        [self syncModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //Add the "addButton"
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    
    //[self.tableView registerClass:[DLMKPlayerTableViewCell class] forCellReuseIdentifier:PLAYER_CELL];
    self.title = self.model.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    return [self.model countPlayers];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
        //Custom Cell
        DLMKPlayerTableViewCell *cell = (DLMKPlayerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:PLAYER_CELL];
    
        if (!cell){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DLMKPlayerTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
    
        DLMKPlayerDescriptor* playerDescriptorAtRow =[self.teamModel getPlayerByIndex:indexPath.row];
        if (playerAtRow)
        {
            cell.playerModel = playerAtRow;
        }
     */
    
    
    
    DLMKPlayerDescriptor *playerDescriptor = [self.model playerAtRow:indexPath.row];
    
    //Create the cell
    static NSString* CELL_ID =  @"CELL_PLAYER_ID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID ];
    }
    
    //Setup the cell
    cell.textLabel.text = playerDescriptor.name;
    //cell.imageView.image = note.photo.image;
    
    NSDateFormatter * fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    //cell.detailTextLabel.text = [ NSString stringWithFormat:@"%@",[fmt stringFromDate:note.modificationDate]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - AddPlayer
-(void) addPlayer:(id)sender{
    [self.model addPlayerWithName:@"Select a name: 0" number:0 ];
    [self.tableView reloadData];
}


#pragma mark - Table view delegate

// didSelectRowAtIndexPath
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLMKPlayerDescriptor *playerDescriptor = [self.model playerAtRow:indexPath.row];
//    
//    NSArray* players = [[self.model.players allObjects] sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
//        
//        NSInteger diff = ((DLMKPlayerDescriptor*)a).numberValue - ((DLMKPlayerDescriptor*)b).numberValue;
//        return (NSComparisonResult)diff;
//        
//    } ];
//    
//    playerDescriptor = players[indexPath.row];
    
    
    
    DLMKPlayerDescriptorTableViewController *playerVC = [[DLMKPlayerDescriptorTableViewController alloc] initWithPlayerDescriptor:playerDescriptor];
    
    // Push the view controller.
    [self.navigationController pushViewController:playerVC animated:YES];
}


#pragma mark - Misc
-(void) syncModel{
    
}

@end










