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
        BOOL hasSampleData = NO;
        

        hasSampleData = [[NSUserDefaults standardUserDefaults] boolForKey:@"SAMPLE_DATA_LOADED"];
        
        if (!hasSampleData)
        {
            [self loadSampleData];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SAMPLE_DATA_LOADED" ];
        }
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



-(void)loadSampleData{
    DLMKTeamDescriptor *teamDescriptor = [DLMKTeamDescriptor teamDescriptorWithName:@"Nankatsu" photo:[UIImage imageNamed:@"Nankatsu.jpg"] context:[self.stack context]];
    
    DLMKPlayerDescriptor *player= nil;
    player = [teamDescriptor addPlayerWithName:@"Yuzo Morisaki" number:12 photo:[UIImage imageNamed:@"Yuzo_Morisaki.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Tsubasa Ozora" number:10 photo:[UIImage imageNamed:@"Tsubasa_Ozora.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Teppei Kisugi" number:9 photo:[UIImage imageNamed:@"Teppei_Kisugi.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Hajime Taki" number:7 photo:[UIImage imageNamed:@"Hajime_Taki.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Taro Misaki" number:11 photo:[UIImage imageNamed:@"Taro_Misaki.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Mamoru Izawa" number:8 photo:[UIImage imageNamed:@"Mamoru_Izawa.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Hanji Urabe" number:5 photo:[UIImage imageNamed:@"Hanji_Urabe.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Ryo Ishizaki" number:4 photo:[UIImage imageNamed:@"Ryo_Ishizaki.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Shingo Takasugi" number:6 photo:[UIImage imageNamed:@"Shingo_Takasugi.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Genzo Wakabayashi" number:1 photo:[UIImage imageNamed:@"Genzo_Wakabayashi.jpg"]];
    player = [teamDescriptor addPlayerWithName:@"Koji Nishio" number:3 photo:[UIImage imageNamed:@"Koji_Nishio.png"]];
    player = [teamDescriptor addPlayerWithName:@"Masao Nakayama" number:2 photo:[UIImage imageNamed:@"Masao_Nakayama.png"]];
    
    DLMKMatchStats* match = [DLMKMatchStats matchStatsWithDate:[[NSDate alloc] init] forTeam:teamDescriptor versus:@"Mambo" context:self.context];
    
    match.seconds_first_halfValue = 60 * 25;
    match.seconds_second_halfValue = 60 * 27.2f;
    match.rivalStats.goalsValue = 2;
    
    [match.teamStats playerStatForPlayerNumber:10].goalsValue = 3;
    [match.teamStats playerStatForPlayerNumber:10].errorsValue = 10;
    
    [match.teamStats playerStatForPlayerNumber:8].errorsValue = 2;
    [match.teamStats playerStatForPlayerNumber:11].goalsValue = 1;
    
    [match.teamStats playerStatForPlayerNumber:1].errorsValue = 1;

    [match.teamStats playerStatForPlayerNumber:4].goalsValue = 3;
    [match.teamStats playerStatForPlayerNumber:4].errorsValue = 3;
}


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




















