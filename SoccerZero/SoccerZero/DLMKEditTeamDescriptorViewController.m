//
//  DLMKTeamDescriptorViewController.m
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//


#import "DLMKEditTeamDescriptorViewController.h"
#import "DLMKCustomCellTypeCollection.h"
#import "DLMKPlayerDescriptorCollectionViewCell.h"
#import "DLMKTeamNameCollectionViewCell.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKTeamCollectionViewCell.h"
#import "DLMKEditPlayerDescriptorTableViewController.h"
#import "DLMKDefaultCollectionLayout.h"
#import "MACROS.h"

@interface DLMKEditTeamDescriptorViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;

@property (nonatomic,strong) DLMKDefaultCollectionLayout *layout;

@end

@implementation DLMKEditTeamDescriptorViewController

#pragma martk - Properties
-(DLMKDefaultCollectionLayout*) layout{
    if (!_layout)
        _layout = [DLMKDefaultCollectionLayout new];
    return _layout;
}

-(void) setTeamDescriptorModel:(DLMKTeamDescriptor *)teamDescriptorModel{
    _teamDescriptorModel = teamDescriptorModel;
    self.txtName.text = _teamDescriptorModel.name;
}

#pragma mark - Init
-(id) init{
    
    if (self = [super init]){
        
        _customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKPlayerDescriptorCollectionViewCell class]]];
    }
    return self;
    
}


#pragma  mark - Instance methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.collectionViewLayout = self.layout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.backgroundColor = self.layout.backGroundColor;
    [self.customCells registerNibsForCollectionView:self.collectionView];
    self.layout.itemSize = [self.customCells sizeForIndex:0];
    
    UIBarButtonItem *addPlayerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer:)];
    self.navigationItem.rightBarButtonItem = addPlayerButton;
}

-(void) viewWillAppear:(BOOL)animated   {
    [super viewWillAppear:animated];
    self.txtName.text = _teamDescriptorModel.name;
    [self.collectionView reloadData];
    __DLMK_NSLOG_DESCRIPTION__
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [[self.customCells arrayOfClasses]count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.teamDescriptorModel countPlayers];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = nil;
    DLMKPlayerDescriptorCollectionViewCell *cellPlayerDescriptor = (DLMKPlayerDescriptorCollectionViewCell*)[self.customCells cellForCollectionView:self.collectionView atIndexPath:indexPath ];
        cellPlayerDescriptor.playerDescriptorModel = [self.teamDescriptorModel playerAtRow:indexPath.row];
        cell = cellPlayerDescriptor;
    return cell;
}



#pragma mark <UICollectionViewDelegate>

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Show the PhotoViewController
    DLMKEditPlayerDescriptorTableViewController *playerVC = [[DLMKEditPlayerDescriptorTableViewController alloc] initWithPlayerDescriptor:[self.teamDescriptorModel playerAtRow:indexPath.row]];
    
    [self.navigationController pushViewController:playerVC animated:YES];
    
}

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

#pragma - mark Actions
-(void)addPlayer:(id)sender{
    [self.teamDescriptorModel addPlayerWithName:@"Unnamed" number:0 ];
    [self.collectionView reloadData];
}

-(void) didTxtNameChanged:(id)sender{
    self.teamDescriptorModel.name = self.txtName.text;
}





@end






