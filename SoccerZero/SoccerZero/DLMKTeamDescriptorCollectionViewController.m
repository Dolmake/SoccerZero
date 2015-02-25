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
#import "DLMKTeamDescriptor.h"
#import "DLMKPlayersDescriptorLayout.h"

@interface DLMKTeamDescriptorCollectionViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;

@property (nonatomic,strong) DLMKPlayersDescriptorLayout *layout;

@end

@implementation DLMKTeamDescriptorCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma martk - Properties
-(DLMKPlayersDescriptorLayout*) layout{
    if (!_layout)
        _layout = [DLMKPlayersDescriptorLayout new];
    return _layout;
}

#pragma mark - Init
-(id) init{
    
    if (self = [super initWithCollectionViewLayout:self.layout]){
        
        _customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKPlayerDescriptorCollectionViewCell class]]];
       
    }
    return self;

}


#pragma  mark - Instance methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = YES;
    self.collectionView.backgroundColor = self.layout.backGroundColor;
    [self.customCells registerNibsForCollectionView:self.collectionView];
    self.layout.itemSize = [self.customCells sizeForIndex:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete method implementation -- Return the number of items in the section
    return [self.teamDescriptorModel countPlayers];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Configure the cell
    
    DLMKPlayerDescriptorCollectionViewCell* cell = (DLMKPlayerDescriptorCollectionViewCell*)[self.customCells cellForCollectionView:self.collectionView atIndexPath:indexPath ];
    cell.playerDescriptorModel = [self.teamDescriptorModel playerAtRow:indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Player pressed");
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

@end
