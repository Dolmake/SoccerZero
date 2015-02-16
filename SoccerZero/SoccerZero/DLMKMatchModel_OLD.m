//
//  DLMKMatchModel.m
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMatchModel_OLD.h"
#import "DLMKTeamModel_OLD.h"

@implementation DLMKMatchModel_OLD


-(id) initWithRivalName:(NSString*)name
{
    if (self == [super init]){
        _rivalGoals = 0;
        _playTime = 0;
        _teamGoals = 0;
        _half = 0;
        _teamModel = [[DLMKTeamModel_OLD SINGLETON] clone];
    }
    return self;
}
@end
