//
//  DLMKCustomCellType.h
//  SoccerZero
//
//  Created by Daniel on 19/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface DLMKCustomCellType : NSObject

@property (nonatomic, strong) id cellClass;

+(instancetype) customCellTypeWith: (id) cellClass;
-(NSString*) cellSectionTitle;
-(CGFloat) height;
-(NSString*) cellId;
-(CGSize) cellSize;
@end


