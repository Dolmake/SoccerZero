#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"

@interface DLMKMatchStats ()

// Private interface goes here.

@end

@implementation DLMKMatchStats

// Custom logic goes here.

#pragma mark - Class methods

+(instancetype) matchStatsWithDate:(NSDate*) aDate forTeam:(DLMKTeamDescriptor*)localTeam versus:(NSString*)rivalName
context:(NSManagedObjectContext*)aContext{
    
    DLMKTeamStats* localTeamStats = [DLMKTeamStats teamStatsWithTeamDescriptor:localTeam context:aContext];
    DLMKTeamStats* visitantTeamStats = [DLMKTeamStats teamStatsWithName:rivalName context:aContext];

    return [DLMKMatchStats matchStatsWithDate:aDate localTeam:localTeamStats visitanTeam:visitantTeamStats context:aContext];
}


+(instancetype) matchStatsWithDate: (NSDate*) aDate localTeam:(DLMKTeamStats*) aLocalTeam visitanTeam:(DLMKTeamStats*) aVisitantTeam context:(NSManagedObjectContext*)aContext{
    
    DLMKMatchStats* matchStats = [self insertInManagedObjectContext:aContext];
    matchStats.date = aDate;
    
    aLocalTeam.isLocalValue = YES;
    aLocalTeam.matchStats = matchStats;
    
    aVisitantTeam.isLocalValue = NO;
    aVisitantTeam.matchStats = matchStats;
    
    matchStats.teamsStats = [NSSet setWithArray:@[aLocalTeam, aVisitantTeam]];
    
    return matchStats;
}



#pragma mark - Properties

-(DLMKTeamStats*) localTeamStats{
    DLMKTeamStats* result = nil;
    int i =0;
    NSArray* array = [[self teamsStats] allObjects];
    while (result == nil && i < array.count){
        result = [array[i] isLocalValue ] ? array[i] : nil;
        i++;
    }
    return result;
}

-(DLMKTeamStats*) visitantTeamStats{
    DLMKTeamStats* result = nil;
    int i =0;
    NSArray* array = [[self teamsStats] allObjects];
    while (result == nil && i < array.count){
        result = ![array[i] isLocalValue ] ? array[i] : nil;
        i++;
    }
    return result;
}

@end
