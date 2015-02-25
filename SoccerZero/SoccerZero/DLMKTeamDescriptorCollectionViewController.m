//
//  DLMKTeamDescriptorCollectionViewController.m
//  SoccerZero
//
//  Created by Daniel on 24/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamDescriptorCollectionViewController.h"
#import "DLMKCustomCellTypeCollection.h"
#import "DLMKPlayerDescriptorCollectionViewCell.h"
#import "DLMKTeamNameCollectionViewCell.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKTeamCollectionViewCell.h"
#import "DLMKPlayerDescriptorTableViewController.h"
#import "DLMKDefaultCollectionLayout.h"

@interface DLMKTeamDescriptorCollectionViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;

@property (nonatomic,strong) DLMKDefaultCollectionLayout *layout;

@end

@implementation DLMKTeamDescriptorCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static int TEAM_NAME_SECTION = 0;
static int PLAYERS_SECTION = 1;

#pragma martk - Properties
-(DLMKDefaultCollectionLayout*) layout{
    if (!_layout)
        _layout = [DLMKDefaultCollectionLayout new];
    return _layout;
}

#pragma mark - Init
-(id) init{
    
    if (self = [super initWithCollectionViewLayout:self.layout]){
        
        _customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKTeamNameCollectionViewCell class],[DLMKPlayerDescriptorCollectionViewCell class]]];
       
    }
    return self;

}


#pragma  mark - Instance methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = YES;
    self.collectionView.backgroundColor = self.layout.backGroundColor;
    [self.customCells registerNibsForCollectionView:self.collectionView];
    self.layout.itemSize = [self.customCells sizeForIndex:1];
    
    UIBarButtonItem *addPlayerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer:)];
    self.navigationItem.rightBarButtonItem = addPlayerButton;
}

-(void) viewWillAppear:(BOOL)animated   {
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
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
    
    if (section == TEAM_NAME_SECTION)//TEAM's NAME Section
        return 1;
    else//PLAYERS_SECTION
        return [self.teamDescriptorModel countPlayers];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = nil;
    if (indexPath.section == TEAM_NAME_SECTION)
    {
        DLMKTeamNameCollectionViewCell *cellTeamName =(DLMKTeamNameCollectionViewCell*)[self.customCells cellForCollectionView:self.collectionView atIndexPath:indexPath];
        cellTeamName.teamDescriptorModel = self.teamDescriptorModel;
        cell = cellTeamName;
    }
    else//PLAYERS_SECTION
    {
        DLMKPlayerDescriptorCollectionViewCell *cellPlayerDescriptor = (DLMKPlayerDescriptorCollectionViewCell*)[self.customCells cellForCollectionView:self.collectionView atIndexPath:indexPath ];
        cellPlayerDescriptor.playerDescriptorModel = [self.teamDescriptorModel playerAtRow:indexPath.row];
        cell = cellPlayerDescriptor;
    }
    
    return cell;
}



#pragma mark <UICollectionViewDelegate>

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
            //Show the PhotoViewController
        DLMKPlayerDescriptorTableViewController *playerVC = [[DLMKPlayerDescriptorTableViewController alloc] initWithPlayerDescriptor:[self.teamDescriptorModel playerAtRow:indexPath.row]];
        
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



@end






