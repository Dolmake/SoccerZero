#import "_DLMKTeamDescriptor.h"

@interface DLMKTeamDescriptor : _DLMKTeamDescriptor {}
// Custom logic goes here.


+(instancetype) teamDescriptorWithName:(NSString*) aName context:(NSManagedObjectContext*) aContext;



-(void) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber;
-(void) removePlayer:(DLMKPlayerDescriptor*) player;
-(NSUInteger) countPlayers;
-(DLMKPlayerDescriptor*) playerAtRow:(NSInteger) row;
-(NSArray*) winningMatches;
-(NSArray*) lossingMatches;
-(NSArray*) tieMatches;


@end
