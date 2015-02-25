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

//-(id) initWithArrayOfClasses: (NSArray*)arrayOfClasses;
//-(id) initWithArrayOfCells: (NSArray*)arrayOfCells;

-(CGFloat) height;
-(NSString*) cellId;
-(CGSize) cellSize;
-(CGFloat) heightForIndex:(NSUInteger) index;
-(CGSize) sizeForIndex:(NSUInteger) index;
-(NSString*) cellIdForIndex: (NSUInteger) cellId;
-(void) registerNibsForTableView:(UITableView*) tableView;
-(void) registerNibsForCollectionView:(UICollectionView*) collectionView;

-(UITableViewCell*) cellForTableView:(UITableView*) tableView atIndex:(NSUInteger) index;
-(UICollectionViewCell*) cellForCollectionView:(UICollectionView*) collectionView atIndexPath:(NSIndexPath*) indexPath;
@end
