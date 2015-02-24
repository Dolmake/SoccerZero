#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"
#import "DLMKRivalStats.h"

@interface DLMKMatchStats ()

// Private interface goes here.

@end

@implementation DLMKMatchStats

// Custom logic goes here.

#pragma mark - Class methods

+(instancetype) matchStatsWithDate:(NSDate*) aDate forTeam:(DLMKTeamDescriptor*)localTeam versus:(NSString*)rivalName
context:(NSManagedObjectContext*)aContext{
    
    DLMKTeamStats* localTeamStats = [DLMKTeamStats teamStatsWithTeamDescriptor:localTeam context:aContext];
   

    return [DLMKMatchStats matchStatsWithDate:aDate localTeam:localTeamStats versus:rivalName context:aContext];
}


+(instancetype) matchStatsWithDate: (NSDate*) aDate localTeam:(DLMKTeamStats*) aLocalTeam versus:(NSString*)rivalName context:(NSManagedObjectContext*)aContext{
    
    DLMKMatchStats* matchStats = [self insertInManagedObjectContext:aContext];
    matchStats.date = aDate;
    aLocalTeam.isLocalValue = YES;
    aLocalTeam.matchStats = matchStats;
    matchStats.teamStats = aLocalTeam;
    
    matchStats.rivalStats =  [DLMKRivalStats rivalStatsWithName:rivalName matchStats:matchStats context:aContext];;
    
    return matchStats;
}

@end
