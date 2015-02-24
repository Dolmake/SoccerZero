#import "_DLMKRivalStats.h"
@class DLMKMatchStats;

@interface DLMKRivalStats : _DLMKRivalStats {}
// Custom logic goes here.

+(instancetype) rivalStatsWithName:rivalName matchStats:(DLMKMatchStats*)matchStats context:(NSManagedObjectContext*)aContext;
@end
