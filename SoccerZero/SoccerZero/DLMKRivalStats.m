#import "DLMKRivalStats.h"

@interface DLMKRivalStats ()

// Private interface goes here.

@end

@implementation DLMKRivalStats

// Custom logic goes here.

+(instancetype) rivalStatsWithName:rivalName matchStats:(DLMKMatchStats*)matchStats context:(NSManagedObjectContext*)aContext{
    
    DLMKRivalStats *rival = [DLMKRivalStats insertInManagedObjectContext:aContext ];
    rival.matchStats = matchStats;
    rival.name = rivalName;
    return rival;
}


@end
