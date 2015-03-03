//
//  DLMKMatchStatsSelectorTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 23/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMatchStatsSelectorTableViewController.h"
#import "DLMKModelServer.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"
#import "DLMKMatchViewController.h"
#import "DLMKCustomCellTypeCollection.h"
#import "DLMKMatchStatsTableViewCell.h"
#import "DLMKTeamDescriptor.h"
#import "MACROS.h"

@interface DLMKMatchStatsSelectorTableViewController ()

@property (nonatomic,strong, readonly) DLMKCustomCellTypeCollection* customCells;
@property (nonatomic, strong) NSArray* matchesModel;

@end

@implementation DLMKMatchStatsSelectorTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Select/Add match";
    
    _customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKMatchStatsTableViewCell class  ]]];
    
    [self.customCells registerNibsForTableView:self.tableView];
    
    UIBarButtonItem *addButton = nil;
    
    addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMatch:) ];
    
    //addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pause_256x256.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addMatch:) ];
    
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshMatchesView];
    __DLMK_NSLOG_DESCRIPTION__
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.matchesModel count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the proper team
    DLMKMatchStats* matchStats = [self.matchesModel objectAtIndex:indexPath.row];
    
    DLMKMatchStatsTableViewCell *cell = (DLMKMatchStatsTableViewCell*)[self.customCells cellForTableView:self.tableView atIndex:0];
    
    cell.matchStatsModel = matchStats;
    
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLMKMatchViewController *matchVC = [[DLMKMatchViewController alloc] initWithMatch:self.matchesModel[indexPath.row] ];
    [self.navigationController pushViewController:matchVC animated:YES];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.customCells heightForIndex:0];
}
-(CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.customCells heightForIndex:0];
}

#pragma mark - Instance Methods
-(void) addMatch:(id) sender{
    [[DLMKModelServer SINGLETON] newMatchForTeam:self.teamDescriptorModel ];
    [self refreshMatchesView];
}


#pragma mark - Misc
-(void) refreshMatchesView{
    if (self.teamDescriptorModel)
    {
        self.matchesModel = [[ DLMKModelServer SINGLETON ] fetchMatchesForTeamDescriptor:self.teamDescriptorModel ];
    }
    else
    {
        self.matchesModel = [[ DLMKModelServer SINGLETON ] fetchMatches ];
        //Deactive the ADD_BUTTON
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    
    [self.tableView reloadData];
}



@end
