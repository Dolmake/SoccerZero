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

@interface DLMKTeamDescriptorCollectionViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;

@end

@implementation DLMKTeamDescriptorCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

-(id) init{

    // Layout
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    if (self = [super initWithCollectionViewLayout:layout]){
        
        _customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKPlayerDescriptorCollectionViewCell class]]];
        
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.itemSize =  [_customCells sizeForIndex:0];
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.headerReferenceSize = CGSizeMake(200, 30);
       
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self.customCells registerNibsForCollectionView:self.collectionView];
    
//    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    cell.tintColor = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    
    return cell;
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

@end
