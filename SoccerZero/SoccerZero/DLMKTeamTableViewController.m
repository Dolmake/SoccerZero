//
//  DLMKTeamTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamTableViewController.h"
#import "DLMKTeamModel.h"
#import "DLMKPlayerModel.h"
#import "DLMKPlayerTableViewCell.h"
#import "DLMKTimeServer.h"

@interface DLMKTeamTableViewController ()

@end

@implementation DLMKTeamTableViewController

static NSString* PLAYER_CELL = @"PLAYER_CELL";

#pragma mark - InitWith
-(id) initWithTeamModel:(DLMKTeamModel*)model{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _teamModel = model;
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
    
    //[self.tableView registerClass:[DLMKPlayerTableViewCell class] forCellReuseIdentifier:PLAYER_CELL];
    [[DLMKTimeServer SINGLETON]addObserver:self ];
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
    
    return [self.teamModel count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        //Custom Cell
        DLMKPlayerTableViewCell *cell = (DLMKPlayerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:PLAYER_CELL];
    
        if (!cell){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DLMKPlayerTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
    
        DLMKPlayerModel* playerAtRow =[self.teamModel getPlayerByIndex:indexPath.row];
        if (playerAtRow)
        {
            cell.playerModel = playerAtRow;
        }
    
    return cell;
}


#pragma mark - Update:(id)sender

-(void) update:(id)sender{
    
    double delta =[[DLMKTimeServer SINGLETON] deltaTime ];
    self.title = [NSString stringWithFormat: @"frame %f",delta  ];
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Misc
-(void) syncModel{
    
}

@end










