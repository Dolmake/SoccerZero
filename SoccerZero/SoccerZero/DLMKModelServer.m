//
//  DLMKModel.m
//  SoccerZero
//
//  Created by Daniel on 16/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKModelServer.h"
#import "AGTCoreDataStack.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"
#import "DLMKRivalStats.h"
#import "DLMKPlayerStats.h"
#import "DLMKPlayerDescriptor.h"
#import "MACROS.h"

@implementation DLMKModelServer


static DLMKModelServer* s_instance;

+(instancetype) SINGLETON{
    if (!s_instance)
        s_instance = [[DLMKModelServer alloc] init];
    return s_instance;
}

#pragma mark -Properties
-(NSManagedObjectContext*) context{
    return [[self stack] context ];
}


-(id) init{
    
    if (self = [super init]){
        
        _stack = [AGTCoreDataStack coreDataStackWithModelName:COREDATA_MODEL_NAME];
#ifdef DUMMY_DATA
        [self createDummyData];
        [self workWithData];
#endif
        [self autoSave];
        
    }
    return self;
}





#pragma mark - Instance methods

-(DLMKTeamDescriptor*) firstTeam{
    
    DLMKTeamDescriptor* result = nil;
    
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKTeamDescriptor entityName]];
    
    req.fetchBatchSize = 1;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:NO]
                            ];
    
    //req.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", allies ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        result = [res firstObject];
    }
    
    return result;
}

-(NSArray*) fetchTeams{
    
    NSArray* result = nil;
    
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKTeamDescriptor entityName]];
    
    req.fetchBatchSize = 1;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:NO]
                            ];
    
    //req.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", allies ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        result = res;
    }
    
    return result;
}

-(NSArray*) fetchPlayersForTeam:(DLMKTeamDescriptor*) team{
    NSArray* result = nil;
    
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKPlayerDescriptor entityName]];
    
    req.fetchBatchSize = 20;
    req.sortDescriptors = @[
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:NO]
                            ];
    
    req.predicate = [NSPredicate predicateWithFormat:@"team == %@", team ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        
        NSArray* players = [res sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            
            NSInteger diff = ((DLMKPlayerDescriptor*)a).numberValue - ((DLMKPlayerDescriptor*)b).numberValue;
            return (NSComparisonResult)diff;
            
        } ];
        result = players;
    }
    return result;
}

-(DLMKMatchStats*) newMatchForTeam: (DLMKTeamDescriptor*) team{
    
    return [DLMKMatchStats matchStatsWithDate:[[NSDate alloc] init] forTeam:team versus:@"Unnamed" context:self.context];
}

-(NSArray*) fetchMatches{
    NSArray* result = nil;
    
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKMatchStats entityName]];
    
    req.fetchBatchSize = 20;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKMatchStatsAttributes.date ascending:YES selector:@selector(caseInsensitiveCompare:)]
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:NO]
                            ];
    
    //req.predicate = [NSPredicate predicateWithFormat:@"team == %@", team ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        result = res;
    }
    return result;
}

-(NSArray*) fetchMatchesForTeamDescriptor:(DLMKTeamDescriptor*) team{
    NSArray* result = nil;
    
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKMatchStats entityName]];
    
    req.fetchBatchSize = 20;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKMatchStatsAttributes.date ascending:YES]
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:NO]
                            ];
    
    req.predicate = [NSPredicate predicateWithFormat:@"teamStats.teamDescriptor == %@", team ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        result = res;
    }
    return result;

}

-(NSArray*) fetchWonMatchesForTeamDescriptor:(DLMKTeamDescriptor*) team{
    NSArray* matches = [self fetchMatchesForTeamDescriptor:team];
    NSMutableArray *wonMatches = [NSMutableArray arrayWithCapacity:5];
    for (DLMKMatchStats *match in matches) {
        if (match.teamStats.goals > match.rivalStats.goalsValue){
            [wonMatches addObject:match ];
        }
    }
    return wonMatches;
}


-(NSArray*) fetchLostMatchesForTeamDescriptor:(DLMKTeamDescriptor*) team{
    NSArray* matches = [self fetchMatchesForTeamDescriptor:team];
    NSMutableArray *lostMatches = [NSMutableArray arrayWithCapacity:5];
    for (DLMKMatchStats *match in matches) {
        if (match.teamStats.goals < match.rivalStats.goalsValue){
            [lostMatches addObject:match ];
        }
    }
    return lostMatches;
}

-(NSArray*) fetchTieMatchesForTeamDescriptor:(DLMKTeamDescriptor*) team{
    NSArray* matches = [self fetchMatchesForTeamDescriptor:team];
    NSMutableArray *tieMatches = [NSMutableArray arrayWithCapacity:5];
    for (DLMKMatchStats *match in matches) {
        if (match.teamStats.goals == match.rivalStats.goalsValue){
            [tieMatches addObject:match ];
        }
    }
    return tieMatches;
}




-(NSNumber*) fetchErrorsForPlayerDescriptor:(DLMKPlayerDescriptor*) player{
    
    NSUInteger playerErrors = 0;
       //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKPlayerStats entityName]];
    req.fetchBatchSize = 20;
    req.predicate = [NSPredicate predicateWithFormat:@"playerDescriptor == %@", player ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        for (DLMKPlayerStats *playerStats in res) {
            playerErrors += [playerStats errorsValue ];
        }
    }
    return [NSNumber numberWithUnsignedLong:playerErrors];

}
-(NSNumber*) fetchGoalsForPlayerDescriptor:(DLMKPlayerDescriptor*) player{
    NSUInteger playerGoals = 0;
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKPlayerStats entityName]];
    req.fetchBatchSize = 20;
    req.predicate = [NSPredicate predicateWithFormat:@"playerDescriptor == %@", player ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        for (DLMKPlayerStats *playerStats in res) {
            playerGoals += [playerStats goalsValue ];
        }
    }
    return [NSNumber numberWithUnsignedLong:playerGoals];
}



#ifdef DUMMY_DATA
-(void) createDummyData{
    
    DLMKTeamDescriptor* teamDescriptor = [DLMKTeamDescriptor teamDescriptorWithName:@"NewTeam" context:[self.stack context]];
    
    for(int i =0 ; i < 10;++i){
        NSString *name = [NSString stringWithFormat:@"Player:%lu", (unsigned long)i];
        [teamDescriptor addPlayerWithName:name number:i];
    }
    
    [self newMatchForTeam:teamDescriptor];
    
}

-(void) workWithData{
    
    
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKTeamDescriptor entityName]];
    
    req.fetchBatchSize = 20;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:NO]
                            ];
    
    //req.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", allies ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        NSLog(@"Teams count %lu", (unsigned long) [res count]);
        //NSLog(@"Teams: %@", res);
        
        NSLog(@"Class Type: %@", [res class]);
        
        DLMKTeamDescriptor* team = res[0];
        NSLog(@"Players %lu",(unsigned long)team.countPlayers );
        
    }
    
    /*
    //Delete a note
    [self.stack.context deleteObject:allies];//Delete a notebook
    req.predicate = nil;
    res = [self.stack.context executeFetchRequest:req error:&err];
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        NSLog(@"Notebooks: %@", res);
    }
    
    
    //Save data
    [self.stack saveWithErrorBlock:^(NSError* error){
        NSLog(@"Error on save: %@", error);
    }];
     */
}





#endif

#pragma mark - Autosave
-(void) autoSave{
    
    if (AUTO_SAVE){
        NSLog(@"Autosaving...");
        
        [self saveData];
        
        [self performSelector:@selector(autoSave) withObject:self afterDelay:AUTO_SAVE_DELAY];
    }
}

-(void) saveData{
    if (self.stack.hasContext){
        [self.stack saveWithErrorBlock:^(NSError *error){
            NSLog(@"Error at save! %@" , error);
        }];
    }
}


@end




















