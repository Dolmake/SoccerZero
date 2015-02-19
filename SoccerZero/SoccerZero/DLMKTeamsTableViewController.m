//
//  DLMKTeamsTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamsTableViewController.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKTeamDescriptorTableViewController.h"

@interface DLMKTeamsTableViewController ()

@end

@implementation DLMKTeamsTableViewController

#pragma mark - Init
-(id) initWithTeamsArray: (NSArray*) teams{
    
    if (self = [super init]){
        _teamsModels = teams;
        self.title = @"Teams";
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.teamsModels count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Standard Cell
    
    //TODO: get the proper player
    DLMKTeamDescriptor *teamDescriptor = [self.teamsModels objectAtIndex:indexPath.row ];
    
    //Create the cell
    static NSString* CELL_ID =  @"CELL_TEAM_ID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID ];
    }
    
    //Setup the cell
    cell.textLabel.text = teamDescriptor.name;
    //cell.imageView.image = note.photo.image;
    
    //NSDateFormatter * fmt = [NSDateFormatter new];
    //fmt.dateStyle = NSDateFormatterShortStyle;
    //cell.detailTextLabel.text = [ NSString stringWithFormat:@"%@",[fmt stringFromDate:note.modificationDate]];
    
    return cell;
}




#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    
    DLMKTeamDescriptor* teamDescriptor = [self.teamsModels objectAtIndex:indexPath.row ];
    DLMKTeamDescriptorTableViewController* teamVC = [[DLMKTeamDescriptorTableViewController alloc] initWithTeamModel:teamDescriptor ];
    
    // Push the view controller.
    [self.navigationController pushViewController:teamVC animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
