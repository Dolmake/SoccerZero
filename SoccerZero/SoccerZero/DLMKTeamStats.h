#import "_DLMKTeamStats.h"

@interface DLMKTeamStats : _DLMKTeamStats {}
// Custom logic goes here.

@property (strong, nonatomic,readonly) NSString* name;

+(instancetype) teamStatsWithName: (NSString*) aName context:(NSManagedObjectContext*) aContext;
+(instancetype) teamStatsWithTeamDescriptor: (DLMKTeamDescriptor*) aTeamDescriptor context:(NSManagedObjectContext*) aContext;

-(NSArray*) players;
-(NSUInteger) countPlayers;
@end
