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
+(instancetype) customCellTypeCollectionWithArray:(NSArray*) arrayOfClasses{
    
    return [[self alloc] initWithArrayOfClasses:arrayOfClasses ];
}

#pragma mark - Init
-(id) initWithArrayOfClasses: (NSArray*)arrayOfClasses{
    
    if (self = [super init]){
        _arrayOfClasses = arrayOfClasses;
    }
    return self;
}

#pragma mark - Instance Methods

-(CGFloat) height{return 44;}
-(NSString*) cellId {return @"CELL_ID_DEFAULT";}

-(CGFloat) heightForIndex:(NSUInteger) index{
    return [self.arrayOfClasses[index] height];
}

-(NSString*) cellIdForIndex: (NSUInteger) index{
    return [self.arrayOfClasses[index] cellId];

}

-(void) registerNibsForTableView:(UITableView*) tableView{
    for (DLMKCustomCellType *cell in self.arrayOfClasses) {
        [self registerNib:[cell cellClass] forTableView:tableView];
    }
}
-(UITableViewCell*) cellForTableView:(UITableView*) tableView atIndex:(NSUInteger) index{
    
    id cellClass = self.arrayOfClasses[index];
    NSString* reusableId = [cellClass performSelector:@selector(cellId)];
    //[result setValue:self.playerDescriptorModel forKey:@"playerDescriptorModel"];
    return [tableView dequeueReusableCellWithIdentifier:reusableId];
}


#pragma mark - Misc


-(void) registerNib: (id)type forTableView: (UITableView*) tableView{
    
    NSString* typeName = NSStringFromClass(type);
    //NSString* typeName =NSStringize(type);
    UINib *nameNib = [ UINib nibWithNibName:typeName bundle:[NSBundle mainBundle] ];
    
    NSString* reusableId = [type performSelector:@selector(cellId)];
    [tableView registerNib:nameNib forCellReuseIdentifier:reusableId];
}


@end
