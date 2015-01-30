//
//  DLMKMatchModel.m
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMatchModel.h"
#import "DLMKTeamModel.h"

@implementation DLMKMatchModel


-(id) initWithRivalName:(NSString*)name
{
    if (self == [super init]){
        _rivalGoals = 0;
        _playTime = 0;
        _teamGoals = 0;
        _half = 0;
        _teamModel = [[DLMKTeamModel SINGLETON] clone];
    }
    return self;
}
@end
