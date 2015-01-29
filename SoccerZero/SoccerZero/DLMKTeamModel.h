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

-(NSUInteger) count;
-(NSArray*) players;
-(DLMKPlayerModel*) getPlayerByIndex: (NSUInteger) index;
-(DLMKPlayerModel*) getPlayerByName:(NSString*)name;
-(DLMKPlayerModel*) getPlayerByNumber:(NSUInteger) number;


@end
