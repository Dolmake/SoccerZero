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
#import "DLMKTeamDescriptorCollectionViewController.h"
#import "DLMKModelServer.h"

@interface DLMKTeamsTableViewController ()

@end

@implementation DLMKTeamsTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Add the "addButton"
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTeam:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self syncModel];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.teamsModels count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLMKTeamDescriptor *teamDescriptor = [self.teamsModels objectAtIndex:indexPath.row ];
    
    //Create the cell
    static NSString* CELL_ID =  @"CELL_TEAM_ID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID ];
    }
    
    //Setup the cell
    cell.textLabel.text = teamDescriptor.name;
    return cell;
}




#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    
    DLMKTeamDescriptor* teamDescriptor = [self.teamsModels objectAtIndex:indexPath.row ];
    
    //Table view
    DLMKTeamDescriptorTableViewController* teamVC = [[DLMKTeamDescriptorTableViewController alloc] initWithTeamModel:teamDescriptor ];
    
    //Collection view
    DLMKTeamDescriptorCollectionViewController* teamCollectionVC = [[DLMKTeamDescriptorCollectionViewController alloc] init];
    
    teamCollectionVC.teamDescriptorModel = teamDescriptor;
    
    // Push the view controller.
    [self.navigationController pushViewController:teamCollectionVC animated:YES];
}

#pragma mark - Actions
-(void) addTeam:(id)sender{
    
    [DLMKTeamDescriptor teamDescriptorWithName:@"Unnamed" context: [[DLMKModelServer SINGLETON]context]];
    [self syncModel];
    [self.tableView reloadData];
}

#pragma mark - Misc
-(void) syncModel{    
    self.teamsModels = [[DLMKModelServer SINGLETON] fetchTeams ];
}

@end



















