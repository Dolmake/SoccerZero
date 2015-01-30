//
//  DLMKMatchModel.h
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@class DLMKTeamModel;

typedef NS_ENUM(NSUInteger, MatchHalf) {
    FirstHalf,
    SecondHalf
};


@interface DLMKMatchModel : NSObject

@property (strong, nonatomic) DLMKTeamModel* teamModel;
@property (nonatomic) NSUInteger playTime;
@property (nonatomic) NSUInteger rivalGoals;
@property (nonatomic) NSUInteger teamGoals;
@property (nonatomic) MatchHalf half;


-(id) initWithRivalName:(NSString*)name;

@end
