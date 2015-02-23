#import "_DLMKPlayerStats.h"

@interface DLMKPlayerStats : _DLMKPlayerStats {}
// Custom logic goes here.

+(instancetype) playerStatsWithTeamStats:(DLMKTeamStats*) teamStats  playerDescriptor:(DLMKPlayerDescriptor*)aPlayerDescriptor context: (NSManagedObjectContext*) aContext;
+(instancetype) playerStatsWithTeamStats:(DLMKTeamStats*) teamStats context: (NSManagedObjectContext*) aContext;

@property (nonatomic,strong,readonly) NSString* name;
@property (nonatomic,readonly) NSUInteger number;


-(void) resetValues;
@end
