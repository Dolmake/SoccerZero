//
//  DLMKTeamCollectionViewController.m
//  SoccerZero
//
//  Created by Daniel on 25/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamCollectionViewController.h"
#import "DLMKModelServer.h"
#import "DLMKCustomCellTypeCollection.h"
#import "DLMKEditTeamCollectionViewCell.h"
#import "DLMKDefaultCollectionLayout.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKEditTeamDescriptorViewController.h"
#import "MACROS.h"

@interface DLMKTeamCollectionViewController ()

@property (nonatomic,strong, readonly) DLMKCustomCellTypeCollection* customCells;
@property (nonatomic,strong) DLMKDefaultCollectionLayout* layout;
@property (nonatomic, strong) NSArray* teamsModel;

@end

@implementation DLMKTeamCollectionViewController

#pragma martk - Properties
-(DLMKDefaultCollectionLayout*) layout{
    if (!_layout)
        _layout = [DLMKDefaultCollectionLayout new];
    return _layout;
}

#pragma mark - Init
-(id) init{
    
    if (self = [super initWithCollectionViewLayout:self.layout]){
        
        _customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKEditTeamCollectionViewCell class]]];
        
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = YES;
    self.collectionView.backgroundColor = self.layout.backGroundColor;
    [self.customCells registerNibsForCollectionView:self.collectionView];
    self.layout.itemSize = [self.customCells cellSizeForIndex:0];
    
    UIBarButtonItem *addTeamButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTeam:) ];
    
    self.navigationItem.rightBarButtonItem = addTeamButton;
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self syncModel];
    [self.collectionView reloadData];
    __DLMK_NSLOG_DESCRIPTION__
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return [[self.customCells arrayOfClasses] count ];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.teamsModel count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the proper team
    DLMKTeamDescriptor* teamDescriptor = [self.teamsModel objectAtIndex:indexPath.row];
    
    DLMKEditTeamCollectionViewCell* teamCell = (DLMKEditTeamCollectionViewCell*) [self.customCells cellForCollectionView:self.collectionView atIndexPath:indexPath];
    teamCell.teamDescriptorModel = teamDescriptor;
    
    return teamCell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DLMKEditTeamDescriptorViewController *teamDescriptorVC = [[DLMKEditTeamDescriptorViewController alloc]init ];
    teamDescriptorVC.teamDescriptorModel = [self.teamsModel objectAtIndex:indexPath.row ];
    [self.navigationController pushViewController:teamDescriptorVC animated:YES];
}

#pragma mark - Actions
-(void) addTeam:(id)sender{
    
    [DLMKTeamDescriptor teamDescriptorWithName:@"Unnamed" context: [[DLMKModelServer SINGLETON]context]];
    [self syncModel];
    [self.collectionView reloadData];
}
#pragma mark - Misc
-(void) syncModel{
    self.teamsModel = [[DLMKModelServer SINGLETON] fetchTeams ];
}

@end


























