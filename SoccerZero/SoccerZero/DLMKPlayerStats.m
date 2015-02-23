#import "DLMKPlayerStats.h"
#import "DLMKPlayerDescriptor.h"

@interface DLMKPlayerStats ()

// Private interface goes here.

@end

@implementation DLMKPlayerStats

// Custom logic goes here.

#pragma mark - Class methods
+(instancetype) playerStatsWithTeamStats:(DLMKTeamStats*) teamStats  playerDescriptor:(DLMKPlayerDescriptor*)aPlayerDescriptor context: (NSManagedObjectContext*) aContext{
    
    DLMKPlayerStats* playerStats = [self insertInManagedObjectContext:aContext];
    playerStats.teamStats = teamStats;
    playerStats.playerDescriptor = aPlayerDescriptor;
    if (playerStats.playerDescriptor)
    {
        playerStats.name = playerStats.playerDescriptor.name;
        playerStats.number = playerStats.playerDescriptor.number;
    }
    else{
        playerStats.name = @"Unamed";
        playerStats.number = 0;
    }
    [playerStats resetValues];
    return playerStats;
    
}
+(instancetype) playerStatsWithTeamStats:(DLMKTeamStats*) teamStats context: (NSManagedObjectContext*) aContext{
    return [self playerStatsWithTeamStats:teamStats playerDescriptor:nil context:aContext];
}


-(void)resetValues{
    
    self.assistances = 0;
    self.goals = 0;
    self.faults_done = 0;
    self.faults_received = 0;
    self.shots = 0;
    self.seconds_played = 0;
    self.notes = nil;
}

@end
