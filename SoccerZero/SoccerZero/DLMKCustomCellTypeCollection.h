//
//  DLMKCustomCellTypeCollection.h
//  SoccerZero
//
//  Created by Daniel on 19/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface DLMKCustomCellTypeCollection : NSObject

@property (strong, nonatomic, readonly) NSArray* arrayOfClasses;
+(instancetype) customCellTypeCollectionWithArray:(NSArray*) arrayOfClasses;

-(CGFloat) height;
-(NSString*) cellSectionTitle;
-(NSString*) cellId;
-(CGSize) cellSize;

-(NSString*) cellSectionTitleForIndex: (NSUInteger)index;
-(NSString*) cellIdForIndex: (NSUInteger) index;

//TableView Cells
-(CGFloat) heightForIndex:(NSUInteger) index;
-(void) registerNibsForTableView:(UITableView*) tableView;
-(UITableViewCell*) cellForTableView:(UITableView*) tableView atIndex:(NSUInteger) index;

//CollectionView Cells
-(CGSize) cellSizeForIndex:(NSUInteger) index;
-(void) registerNibsForCollectionView:(UICollectionView*) collectionView;
-(UICollectionViewCell*) cellForCollectionView:(UICollectionView*) collectionView atIndexPath:(NSIndexPath*) indexPath;

@end
