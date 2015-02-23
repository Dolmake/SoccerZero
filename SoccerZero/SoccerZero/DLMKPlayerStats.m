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
    [playerStats resetValues];
    return playerStats;
    
}
+(instancetype) playerStatsWithTeamStats:(DLMKTeamStats*) teamStats context: (NSManagedObjectContext*) aContext{
    return [self playerStatsWithTeamStats:teamStats playerDescriptor:nil context:aContext];
}

#pragma mark - Properties


-(NSString*) name{
    if (self.playerDescriptor)
        return self.playerDescriptor.name;
    else
        return @"Unamed";
}
-(NSUInteger) number{
    if (self.playerDescriptor)
        return self.playerDescriptor.numberValue;
    else
        return 0;
}

#pragma mark - Instance methods
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
