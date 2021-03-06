#import "_DLMKTeamStats.h"
@class DLMKPlayerDescriptor;

@interface DLMKTeamStats : _DLMKTeamStats {}
// Custom logic goes here.

@property (strong, nonatomic) NSString* name;
@property (nonatomic, readonly) NSUInteger goals;
@property (nonatomic, readonly) NSUInteger errors;

+(instancetype) teamStatsWithName: (NSString*) aName context:(NSManagedObjectContext*) aContext;
+(instancetype) teamStatsWithTeamDescriptor: (DLMKTeamDescriptor*) aTeamDescriptor context:(NSManagedObjectContext*) aContext;

-(NSArray*) players;
-(NSUInteger) countPlayers;

-(BOOL) playerWasPlaying:(DLMKPlayerDescriptor*)player;
-(DLMKPlayerStats*) playerStatForPlayerDescriptor:(DLMKPlayerDescriptor*) player;
-(DLMKPlayerStats*) playerStatForPlayerNumber:(NSUInteger)number;

@end
