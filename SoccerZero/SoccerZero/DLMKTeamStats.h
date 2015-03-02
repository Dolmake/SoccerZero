#import "_DLMKTeamStats.h"

@interface DLMKTeamStats : _DLMKTeamStats {}
// Custom logic goes here.

@property (strong, nonatomic) NSString* name;
@property (nonatomic, readonly) NSUInteger goals;

+(instancetype) teamStatsWithName: (NSString*) aName context:(NSManagedObjectContext*) aContext;
+(instancetype) teamStatsWithTeamDescriptor: (DLMKTeamDescriptor*) aTeamDescriptor context:(NSManagedObjectContext*) aContext;

-(NSArray*) players;
-(NSUInteger) countPlayers;


@end
