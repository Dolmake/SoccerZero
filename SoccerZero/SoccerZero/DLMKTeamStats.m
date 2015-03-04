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
        
        //Create the playerStats
        for (DLMKPlayerDescriptor* playerDescriptor in teamStats.teamDescriptor.players) {
            DLMKPlayerStats* playerStats = [DLMKPlayerStats playerStatsWithTeamStats:teamStats playerDescriptor:playerDescriptor context:aContext];
           [teamStats addPlayersStatsObject:playerStats ];
        }
    }
    else{
        teamStats.name = @"Unnamed team";
        DLMKPlayerStats* playerStats = [DLMKPlayerStats playerStatsWithTeamStats:teamStats playerDescriptor:nil context:aContext];
          [teamStats addPlayersStatsObject:playerStats ];
        
    }
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

#pragma mark - Properties
-(NSString*) name{
    if (self.teamDescriptor) return self.teamDescriptor.name;
    else return @"Unnamed";
}
-(void) setName:(NSString *)name{
    if (self.teamDescriptor) self.teamDescriptor.name = name;
    
}
-(NSUInteger) goals{
    NSUInteger result= 0;
    NSArray* players = [self.playersStats allObjects];
    for (DLMKPlayerStats *player in players) {
        result += player.goalsValue;
    }
    return result;
}



#pragma mark - Public interface


-(NSArray*) players{
    
    NSArray* result = [[self.playersStats allObjects] sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        
        NSInteger diff = ((DLMKPlayerStats*)a).number - ((DLMKPlayerStats*)b).number;
        return (NSComparisonResult)diff;
        
    } ];
    return result;

}
-(NSUInteger) countPlayers{
    return [self.playersStats count];
}

-(DLMKPlayerStats*) playerStatForPlayerDescriptor:(DLMKPlayerDescriptor*) player{
    DLMKPlayerStats* result = nil;
    for (DLMKPlayerStats *playerStat in self.playersStats) {
        if (playerStat.playerDescriptor == player)
            result = playerStat;
    }
    return result;
}
-(DLMKPlayerStats*) playerStatForPlayerNumber:(NSUInteger)number{
    DLMKPlayerStats* result = nil;
    for (DLMKPlayerStats *playerStat in self.playersStats) {
        if (playerStat.number == number)
            result = playerStat;
    }
    return result;
}


@end





















