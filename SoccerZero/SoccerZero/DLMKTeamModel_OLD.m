//
//  DLMKTeamModel.m
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamModel_OLD.h"
#import "DLMKPlayerModel_OLD.h"



@implementation DLMKTeamModel_OLD 

static DLMKTeamModel_OLD * _instance = nil;

NSArray* playersArray;

#pragma mark - SINGLETON
+(instancetype) SINGLETON{
    if (!_instance){
        _instance = [[DLMKTeamModel_OLD  alloc] init ];
    }
    return _instance;
}

#pragma mark - Init
-(id) init{
    
    if (self = [super init]){
        
        //TODO: read players from file or SQL
        _name = @"Edulcorados";
        _frames = 0;
        playersArray = [self createSamplePlayers];       
    }
    return self;
}




-(NSArray*) players{
    return playersArray;
}

-(NSUInteger) count{
    return [playersArray count];
}

-(DLMKPlayerModel_OLD*) getPlayerByIndex: (NSUInteger) index{
    if (index < playersArray.count)
        return playersArray[index];
    else return nil;
}

-(DLMKPlayerModel_OLD*) getPlayerByName:(NSString*)name{
    DLMKPlayerModel_OLD* player = nil;
    NSUInteger count = [self count];
    for(int i = 0; player == nil && i < count;++i){
         DLMKPlayerModel_OLD* currentPlayer = playersArray[i];
        if ([name isEqualToString:currentPlayer.name]){
            player = playersArray[i];
        }
    }
    return player;
    
}
-(DLMKPlayerModel_OLD*) getPlayerByNumber:(NSUInteger) number{
    DLMKPlayerModel_OLD* player = nil;
    NSUInteger count = [self count];
    for(int i = 0; player == nil && i < count;++i){
        DLMKPlayerModel_OLD* currentPlayer = playersArray[i];
        if (number == currentPlayer.number ){
            player = playersArray[i];
        }
    }
    return player;
}

-(DLMKTeamModel_OLD*) clone{
    //TODO:Return a clean copy
    DLMKTeamModel_OLD* cloned = [[DLMKTeamModel_OLD alloc] init];
    return cloned;
}

#pragma mark - MISC
-(NSArray*) createSamplePlayers{
     NSMutableArray* auxPlayers = [[NSMutableArray alloc] initWithCapacity:5];
    for(int i= 0; i < 10; ++i){
        
        DLMKPlayerModel_OLD* player = [[DLMKPlayerModel_OLD alloc] initWithName: [NSString stringWithFormat:@"Player{%d}",i ] ];
        [auxPlayers addObject:player ];
    }
    return auxPlayers;
}
@end
