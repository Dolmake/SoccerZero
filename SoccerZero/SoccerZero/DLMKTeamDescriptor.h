
@import UIKit;
#import "_DLMKTeamDescriptor.h"

@interface DLMKTeamDescriptor : _DLMKTeamDescriptor {}
// Custom logic goes here.


+(instancetype) teamDescriptorWithName:(NSString*) aName photo:(UIImage*)aPhoto context:(NSManagedObjectContext*) aContext;



-(DLMKPlayerDescriptor*) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber;
-(DLMKPlayerDescriptor*) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber photo:(UIImage*)aPhoto;
-(void) removePlayer:(DLMKPlayerDescriptor*) player;
-(NSUInteger) countPlayers;
-(DLMKPlayerDescriptor*) playerAtRow:(NSInteger) row;
-(NSArray*) winningMatches;
-(NSArray*) lossingMatches;
-(NSArray*) tieMatches;


@end
