#import "DLMKPlayerDescriptor.h"
#import "DLMKPhotoContainer.h"
#import "DLMKModelServer.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"

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
    return (CGFloat)matchesWon.count / (CGFloat)matchesPlayed.count;
}
-(CGFloat) lostPercent{
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSArray* matchesLost = [[DLMKModelServer SINGLETON] lostMatchesForTeamDescriptor:matchesPlayed ];
    return (CGFloat)matchesLost.count / (CGFloat)matchesPlayed.count;
}
-(CGFloat) tiePercent{
    NSArray* matchesPlayed = [self matchesForPlayer];
    NSArray* matchesTied = [[DLMKModelServer SINGLETON] tieMatchesForTeamDescriptor:matchesPlayed ];
    return (CGFloat)matchesTied.count / (CGFloat)matchesPlayed.count;
}
-(CGFloat) errorPerMatch{
    //TODO:
    return 0;
}
-(CGFloat) goalPerMatch{
    //TODO:
    return 0;
}
-(NSUInteger) totalPlayedTimeInSeconds{
    //TODO:
    return 0;
}
-(CGFloat) timePlayedPercent{
    //TODO:
    return 0;
}


@end
























