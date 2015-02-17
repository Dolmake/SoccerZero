#import "_DLMKPlayerStats.h"

@interface DLMKPlayerStats : _DLMKPlayerStats {}
// Custom logic goes here.

+(instancetype) playerStatsWithTeamStats:(DLMKTeamStats*) teamStats  playerDescriptor:(DLMKPlayerDescriptor*)aPlayerDescriptor context: (NSManagedObjectContext*) aContext;
+(instancetype) playerStatsWithTeamStats:(DLMKTeamStats*) teamStats context: (NSManagedObjectContext*) aContext;


-(void) resetValues;
@end
