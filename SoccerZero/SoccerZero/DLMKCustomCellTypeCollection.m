//
//  DLMKCustomCellTypeCollection.m
//  SoccerZero
//
//  Created by Daniel on 19/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKCustomCellTypeCollection.h"
#import "DLMKCustomCellType.h"


@implementation DLMKCustomCellTypeCollection

#pragma mark -  Class Methods
+(instancetype) customCellTypeCollectionWithArray:(NSArray*) arrayOfCells{
    
    return [[self alloc] initWithArrayOfCells:arrayOfCells ];
}

#pragma mark - Init
-(id) initWithArrayOfClasses: (NSArray*)arrayOfClasses{
    
    if (self = [super init]){
        _arrayOfClasses = arrayOfClasses;
    }
    return self;
}

-(id) initWithArrayOfCells: (NSArray*)arrayOfCells{
    NSMutableArray* arrayMutable = [NSMutableArray arrayWithCapacity:arrayOfCells.count];
    for (id cell in arrayOfCells) {
        [arrayMutable addObject:[DLMKCustomCellType customCellTypeWith:cell] ];
    }
    return [self initWithArrayOfClasses:arrayMutable];
}

#pragma mark - Instance Methods

-(CGFloat) height{return 44;}
-(NSString*) cellId {return @"CELL_ID_DEFAULT";}
-(NSString*) cellSectionTitle{ return @"CELL_SECTION_TITLE";}
-(CGSize) cellSize {return CGSizeMake(self.height,self.height);}

-(CGFloat) heightForIndex:(NSUInteger) index{
    return [self.arrayOfClasses[index] height];
}

-(CGSize) cellSizeForIndex: (NSUInteger) index{
    return [self.arrayOfClasses[index] cellSize];
}
-(NSString*) cellSectionTitleForIndex: (NSUInteger)index{
    return [self.arrayOfClasses[index] cellSectionTitle];
}

-(NSString*) cellIdForIndex: (NSUInteger) index{
    return [self.arrayOfClasses[index] cellId];

}

-(void) registerNibsForTableView:(UITableView*) tableView{
    for (DLMKCustomCellType *cell in self.arrayOfClasses) {
        [self registerNib:[cell cellClass] forTableView:tableView];
    }
}


-(void) registerNibsForCollectionView:(UICollectionView*) collectionView{
    for (DLMKCustomCellType *cell in self.arrayOfClasses) {
        [self registerNib:[cell cellClass] forCollectionView:collectionView];
    }
}

-(UITableViewCell*) cellForTableView:(UITableView*) tableView atIndex:(NSUInteger) index{
    
    id cellClass = self.arrayOfClasses[index];
    NSString* reusableId = [cellClass performSelector:@selector(cellId)];
    //[result setValue:self.playerDescriptorModel forKey:@"playerDescriptorModel"];
    return [tableView dequeueReusableCellWithIdentifier:reusableId];
}

-(UICollectionViewCell*) cellForCollectionView:(UICollectionView*) collectionView atIndexPath:(NSIndexPath*) indexPath{
    id cellClass = self.arrayOfClasses[indexPath.section];
    NSString* reusableId = [cellClass performSelector:@selector(cellId)];
    //[result setValue:self.playerDescriptorModel forKey:@"playerDescriptorModel"];
    return [collectionView dequeueReusableCellWithReuseIdentifier:reusableId forIndexPath:indexPath];
}


#pragma mark - Misc


-(void) registerNib: (id)type forTableView: (UITableView*) tableView{
    
    NSString* typeName = NSStringFromClass(type);
    //NSString* typeName =NSStringize(type);
    UINib *nameNib = [ UINib nibWithNibName:typeName bundle:[NSBundle mainBundle] ];
    
    NSString* reusableId = [type performSelector:@selector(cellId)];
    [tableView registerNib:nameNib forCellReuseIdentifier:reusableId];
}


-(void) registerNib: (id)type forCollectionView: (UICollectionView*) collectionView{
    
    NSString* typeName = NSStringFromClass(type);
    //NSString* typeName =NSStringize(type);
    UINib *nameNib = [ UINib nibWithNibName:typeName bundle:[NSBundle mainBundle] ];
    
    NSString* reusableId = [type performSelector:@selector(cellId)];
    [collectionView registerNib:nameNib forCellWithReuseIdentifier:reusableId];
}


@end
