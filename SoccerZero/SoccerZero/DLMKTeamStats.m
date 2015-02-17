#import "DLMKTeamStats.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKPlayerStats.h"

@interface DLMKTeamStats ()

// Private interface goes here.


@end

@implementation DLMKTeamStats

// Custom logic goes here.
#pragma - mark Class methods

+(instancetype) teamStatsWithName: (NSString*) aName context:(NSManagedObjectContext*) aContext{
   
    return [self teamStatsWithTeamDescriptor:nil context:aContext];
}

+(instancetype) teamStatsWithTeamDescriptor: (DLMKTeamDescriptor*) aTeamDescriptor context:(NSManagedObjectContext*) aContext{
    
    DLMKTeamStats *teamStats = [self insertInManagedObjectContext:aContext];
    
    teamStats.teamDescriptor = aTeamDescriptor;
    if (teamStats.teamDescriptor){
        teamStats.name = aTeamDescriptor.name;
    }
    else{
        teamStats.name = @"Unnamed team";
    }
    //TODO: ini playersStats with the TeamDescriptor
    teamStats.playersStats = nil;
    
    return teamStats;
}

+(NSArray*) playersStatsWithTeamStats: (DLMKTeamStats*) aTeamStats context:(NSManagedObjectContext*) aContext{
    
    //If no descriptor...
    if (!aTeamStats.teamDescriptor) //...return an array with the FAKE player.
        return @[[DLMKPlayerStats playerStatsWithTeamStats:aTeamStats context:aContext]];
    
    //Else: Initialize the array getting the info from the Team Descriptor
    NSMutableArray *result =[NSMutableArray arrayWithCapacity:10];
    NSArray* playerDescriptors = [aTeamStats.teamDescriptor.players allObjects];
    for (DLMKPlayerDescriptor* player in playerDescriptors) {
        DLMKPlayerStats *newPlayerStats = [DLMKPlayerStats playerStatsWithTeamStats:aTeamStats playerDescriptor:player context:aContext];
        [result addObject:newPlayerStats];
    }
    return result;
}



#pragma mark - Public interface
-(NSUInteger) countPlayers{
    return [self.playersStats count];
}

@end





















