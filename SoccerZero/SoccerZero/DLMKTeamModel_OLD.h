//
//  DLMKTeamModel.h
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@class DLMKPlayerModel_OLD;

@interface DLMKTeamModel_OLD  : NSObject


+(instancetype) SINGLETON;

@property (copy, nonatomic) NSString* name;
@property (nonatomic) NSUInteger frames;

-(NSUInteger) count;
-(NSArray*) players;
-(DLMKPlayerModel_OLD*) getPlayerByIndex: (NSUInteger) index;
-(DLMKPlayerModel_OLD*) getPlayerByName:(NSString*)name;
-(DLMKPlayerModel_OLD*) getPlayerByNumber:(NSUInteger) number;

-(DLMKTeamModel_OLD*) clone;


@end
