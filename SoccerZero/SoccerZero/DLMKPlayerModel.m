//
//  DLMKPlayerModel.m
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerModel.h"

@implementation DLMKPlayerModel

static NSUInteger NUMBER = 0;

-(id) initWithName:(NSString*)name{
    
    if (self = [super init]){
        _name = name;
        _number = ++NUMBER;
        _goals = 0;
        _faults = 0;
        _secondsPlayed = 0;
    }
    return self;
}

@end
