//
//  DLMKTeamModel.h
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@class DLMKPlayerModel;

@interface DLMKTeamModel : NSObject


+(instancetype) SINGLETON;

@property (copy, nonatomic) NSString* name;
@property (nonatomic) NSUInteger frames;

-(NSUInteger) count;
-(NSArray*) players;
-(DLMKPlayerModel*) getPlayerByIndex: (NSUInteger) index;
-(DLMKPlayerModel*) getPlayerByName:(NSString*)name;
-(DLMKPlayerModel*) getPlayerByNumber:(NSUInteger) number;

-(DLMKTeamModel*) clone;


@end
