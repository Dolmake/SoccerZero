//
//  DLMKCustomCellType.m
//  SoccerZero
//
//  Created by Daniel on 19/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKCustomCellType.h"
@implementation DLMKCustomCellType

+(instancetype) customCellTypeWith: (id) cellClass{
    DLMKCustomCellType* cell = [[self alloc]init];
    if (cell ){
        [cell setCellClass:cellClass];
    }
    return cell;
}

-(CGFloat) height{
    return [self.cellClass height];
}
-(NSString*) cellSectionTitle{
    return  [self.cellClass cellSectionTitle];
}
-(NSString*) cellId{
    return [self.cellClass cellId];
}
-(CGSize) cellSize{
    return [self.cellClass cellSize];
}

-(NSString*) description{
    return [NSString stringWithFormat:@"cellClass Type: %@", _cellClass];
}

@end

