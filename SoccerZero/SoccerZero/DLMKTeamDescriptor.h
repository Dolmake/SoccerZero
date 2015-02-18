#import "_DLMKTeamDescriptor.h"

@interface DLMKTeamDescriptor : _DLMKTeamDescriptor {}
// Custom logic goes here.


+(instancetype) teamDescriptorWithName:(NSString*) aName context:(NSManagedObjectContext*) aContext;



-(void) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber;
-(NSUInteger) countPlayers;
-(DLMKPlayerDescriptor*) playerAtRow:(NSInteger) row;


@end
