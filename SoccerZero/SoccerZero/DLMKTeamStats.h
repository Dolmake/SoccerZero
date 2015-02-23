#import "_DLMKTeamStats.h"

@interface DLMKTeamStats : _DLMKTeamStats {}
// Custom logic goes here.

+(instancetype) teamStatsWithName: (NSString*) aName context:(NSManagedObjectContext*) aContext;
+(instancetype) teamStatsWithTeamDescriptor: (DLMKTeamDescriptor*) aTeamDescriptor context:(NSManagedObjectContext*) aContext;

-(NSArray*) players;
-(NSUInteger) countPlayers;
@end
