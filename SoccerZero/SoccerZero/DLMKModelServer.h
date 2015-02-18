//
//  DLMKModel.h
//  SoccerZero
//
//  Created by Daniel on 16/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@class AGTCoreDataStack;
@class DLMKTeamDescriptor;

@interface DLMKModelServer : NSObject

+(instancetype) SINGLETON;

@property (nonatomic, strong) AGTCoreDataStack* stack;

-(DLMKTeamDescriptor*) firstTeam;
-(NSArray*) fetchTeams;
-(NSArray*) fetchPlayersForTeam:(DLMKTeamDescriptor*) team;


@end
