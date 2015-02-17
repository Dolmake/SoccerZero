#import "_DLMKMatchStats.h"
@class DLMKTeamStats;
@class DLMKTeamDescriptor;

@interface DLMKMatchStats : _DLMKMatchStats {}
// Custom logic goes here.

//Class method

+(instancetype) matchStatsWithDate:(NSDate*) aDate forTeam:(DLMKTeamDescriptor*)localTeam versus:(NSString*)rivalName context:(NSManagedObjectContext*)aContext;
+(instancetype) matchStatsWithDate: (NSDate*) aDate localTeam:(DLMKTeamStats*) aLocalTeam visitanTeam:(DLMKTeamStats*) aVisitantTeam context:(NSManagedObjectContext*)aContext;

//Properties
@property (strong,nonatomic, readonly) DLMKTeamStats* localTeamStats;
@property (strong,nonatomic, readonly) DLMKTeamStats* visitantTeamStats;

@end
