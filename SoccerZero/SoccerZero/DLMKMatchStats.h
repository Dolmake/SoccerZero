#import "_DLMKMatchStats.h"
@class DLMKTeamStats;
@class DLMKRivalStats;
@class DLMKTeamDescriptor;

@interface DLMKMatchStats : _DLMKMatchStats {}
// Custom logic goes here.

//Class method

+(instancetype) matchStatsWithDate:(NSDate*) aDate forTeam:(DLMKTeamDescriptor*)localTeam versus:(NSString*)rivalName context:(NSManagedObjectContext*)aContext;
+(instancetype) matchStatsWithDate: (NSDate*) aDate localTeam:(DLMKTeamStats*) aLocalTeam versus:(NSString*)rivalName context:(NSManagedObjectContext*)aContext;

@end
