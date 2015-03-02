//
//  DLMKTeamStatsSelectorTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 21/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamStatsSelectorTableViewController.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKTeamStats.h"
#import "DLMKMatchStatsSelectorTableViewController.h"
#import "DLMKTeamStatsTableViewCell.h"
#import "DLMKCustomCellTypeCollection.h"
#import "DLMKModelServer.h"
#import "MACROS.h"

@interface DLMKTeamStatsSelectorTableViewController ()

@property (nonatomic, strong) NSArray* teamsModel;
@property (nonatomic, strong) DLMKCustomCellTypeCollection* customCells;

@end

@implementation DLMKTeamStatsSelectorTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Select a team";
    NSArray* cells = @[[DLMKTeamStatsTableViewCell class]];
    self.customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:cells];
    
    [self.customCells registerNibsForTableView:self.tableView ];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Get all the available teams
    self.teamsModel = [[DLMKModelServer SINGLETON] fetchTeams ];
   __DLMK_NSLOG_DESCRIPTION__
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.customCells arrayOfClasses] count ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.teamsModel count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.customCells heightForIndex:indexPath.section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the proper team
    DLMKTeamDescriptor* teamDescriptor = [self.teamsModel objectAtIndex:indexPath.row];
    
    //Build the Cell
    UITableViewCell *cell = nil;
    cell = [self.customCells cellForTableView:tableView atIndex:0];
    
    [cell setValue:teamDescriptor forKey:@"teamDescriptorModel"];
    
    return cell;
}



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Get the proper team
    DLMKTeamDescriptor* teamDescriptor = [self.teamsModel objectAtIndex:indexPath.row];

    DLMKMatchStatsSelectorTableViewController *matchesVC = [[DLMKMatchStatsSelectorTableViewController alloc] init ];
    matchesVC.teamDescriptorModel = teamDescriptor;
    [self.navigationController pushViewController: matchesVC animated:YES];
}



@end
