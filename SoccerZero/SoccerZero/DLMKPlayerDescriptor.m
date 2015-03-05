#import "DLMKPlayerDescriptor.h"
#import "DLMKPhotoContainer.h"
#import "DLMKModelServer.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"
#import "DLMKPlayerStats.h"

@interface DLMKPlayerDescriptor ()

// Private interface goes here.

@end

@implementation DLMKPlayerDescriptor

#pragma mark - Class Methods
// Custom logic goes here.
+(instancetype) playerDescriptorWithName:(NSString*) name number:(NSUInteger)number photo:(UIImage*)aPhoto teamDescriptor:(DLMKTeamDescriptor*)aTeamDescriptor context:(NSManagedObjectContext*) aContext{
    
    DLMKPlayerDescriptor* playerDescriptor = [self insertInManagedObjectContext:aContext];
    playerDescriptor.teamDescriptor = aTeamDescriptor;
    playerDescriptor.name = name;
    playerDescriptor.numberValue = number;
    playerDescriptor.playerStats = nil;
    //playerDescriptor.photoContainer = [DLMKPhotoContainer insertInManagedObjectContext:aContext ];
    playerDescriptor.photoContainer = [DLMKPhotoContainer photoContainerWithPhoto:aPhoto context:aContext ];
    
    return playerDescriptor;
}

#pragma mark - Instance Methods

-(NSArray*) matchesForPlayer{
    NSMutableArray *result= [NSMutableArray arrayWithCapacity:4];
    NSArray* matchesForTeam = [[DLMKModelServer SINGLETON] fetchMatchesForTeamDescriptor:self.teamDescriptor];
    
    for (DLMKMatchStats *match in matchesForTeam) {
        if ([match.teamStats playerWasPlaying:self])
        {
            [result addObject:match];
        }
    }
    return result;
}
-(NSNumber*) goalsForPlayer{
    return [[DLMKModelServer SINGLETON] fetchGoalsForPlayerDescriptor:self];
}
-(NSNumber*) errorsForPlayer{
    return [[DLMKModelServer SINGLETON] fetchErrorsForPlayerDescriptor:self ];
}

-(CGFloat) wonPercent{
    
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSArray* matchesWon = [[DLMKModelServer SINGLETON] wonMatchesForTeamDescriptor:matchesPlayed ];
    return (CGFloat)matchesWon.count / ((CGFloat)matchesPlayed.count + 0.001f);
}
-(CGFloat) lostPercent{
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSArray* matchesLost = [[DLMKModelServer SINGLETON] lostMatchesForTeamDescriptor:matchesPlayed ];
    return (CGFloat)matchesLost.count / ((CGFloat)matchesPlayed.count + 0.001f);
}
-(CGFloat) tiePercent{
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSArray* matchesTied = [[DLMKModelServer SINGLETON] tieMatchesForTeamDescriptor:matchesPlayed ];
    return (CGFloat)matchesTied.count / ((CGFloat)matchesPlayed.count  + 0.001f);
}
-(CGFloat) errorsPercent{
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSUInteger errorsForPlayer = 0;
    NSUInteger totalErrors = 0;
    for (DLMKMatchStats *match in matchesPlayed) {
        totalErrors += match.teamStats.errors;
        DLMKPlayerStats *playerStats = [match.teamStats playerStatForPlayerDescriptor:self ];
        if (playerStats)
            errorsForPlayer += playerStats.errorsValue;
    }
    return (CGFloat)errorsForPlayer / ((CGFloat)totalErrors + 0.001f);
}
-(CGFloat) goalsPercent{
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSUInteger goalsForPlayer = 0;
    NSUInteger totalGoals = 0;
    for (DLMKMatchStats *match in matchesPlayed) {
        totalGoals += match.teamStats.goals;
        DLMKPlayerStats *playerStats = [match.teamStats playerStatForPlayerDescriptor:self ];
        if (playerStats)
            goalsForPlayer += playerStats.goalsValue;
    }
    return (CGFloat)goalsForPlayer / ((CGFloat)totalGoals  + 0.001f);
}
-(NSUInteger) totalPlayedTimeInSeconds{
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSUInteger totalTime = 0;
    for (DLMKMatchStats *match in matchesPlayed) {
        DLMKPlayerStats *playerStats = [match.teamStats playerStatForPlayerDescriptor:self ];
        if (playerStats)
        {
            totalTime += playerStats.seconds_playedValue;
        }
    }
    return totalTime;
}
-(CGFloat) timePlayedPercent{
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSUInteger totalTime = 0;
    NSUInteger timePlayed = 0;
    for (DLMKMatchStats *match in matchesPlayed) {        
        DLMKPlayerStats *playerStats = [match.teamStats playerStatForPlayerDescriptor:self ];
        if (playerStats)
        {
            totalTime += match.seconds_played;
            timePlayed += playerStats.seconds_playedValue;
        }
    }
    return (CGFloat)timePlayed / ((CGFloat)totalTime + 0.001f);
}
//-(CGFloat) timePlayedPerMatchPercent{
//    NSArray* matchesPlayed = [self matchesForPlayer];
//    
//    CGFloat accumPercent = 0;
//    for (DLMKMatchStats *match in matchesPlayed) {
//        DLMKPlayerStats *playerStats = [match.teamStats playerStatForPlayerDescriptor:self ];
//        if (playerStats)
//        {
//            accumPercent += (CGFloat)playerStats.seconds_playedValue / (CGFloat)match.seconds_played;
//            
//        }
//    }
//    return accumPercent/ (CGFloat)[matchesPlayed count];
//}


@end
























