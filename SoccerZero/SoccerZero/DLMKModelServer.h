//
//  DLMKModel.h
//  SoccerZero
//
//  Created by Daniel on 16/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@import CoreData;
@class AGTCoreDataStack;
@class DLMKTeamDescriptor;
@class DLMKMatchStats;
@class DLMKPlayerDescriptor;


@interface DLMKModelServer : NSObject

+(instancetype) SINGLETON;

@property (nonatomic, strong) AGTCoreDataStack* stack;
@property (nonatomic, strong, readonly) NSManagedObjectContext* context;

-(DLMKTeamDescriptor*) firstTeam;
-(NSArray*) fetchTeams;
-(NSArray*) fetchPlayersForTeam:(DLMKTeamDescriptor*) team;
-(DLMKMatchStats*) newMatchForTeam: (DLMKTeamDescriptor*) team;
-(NSArray*) fetchMatches;
-(NSArray*) fetchMatchesForTeamDescriptor:(DLMKTeamDescriptor*) team;
-(NSNumber*) fetchErrorsForPlayerDescriptor:(DLMKPlayerDescriptor*) player;
-(NSNumber*) fetchGoalsForPlayerDescriptor:(DLMKPlayerDescriptor*) player;


@end
