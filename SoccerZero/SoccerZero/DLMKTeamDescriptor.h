#import "_DLMKTeamDescriptor.h"

@interface DLMKTeamDescriptor : _DLMKTeamDescriptor {}
// Custom logic goes here.


+(instancetype) teamDescriptorWithName:(NSString*) aName context:(NSManagedObjectContext*) aContext;
+(instancetype) teamDescriptorWithName:(NSString*) aName players:(NSArray*)players context:(NSManagedObjectContext*) aContext;


-(void) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber;
-(NSUInteger) countPlayers;


@end
