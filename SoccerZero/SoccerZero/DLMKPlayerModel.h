//
//  DLMKPlayerModel.h
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;

@interface DLMKPlayerModel : NSObject

@property (copy) NSString* name;
@property (nonatomic) NSUInteger number;
@property (nonatomic) NSInteger goals;
@property (nonatomic) NSInteger faults;
@property (nonatomic) NSInteger secondsPlayed;

-(id) initWithName:(NSString*)name;

@end
