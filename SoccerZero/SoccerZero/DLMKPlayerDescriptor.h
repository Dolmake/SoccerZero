
@import UIKit;
#import "_DLMKPlayerDescriptor.h"

@interface DLMKPlayerDescriptor : _DLMKPlayerDescriptor {}
// Custom logic goes here.


//Should not be invoked by other than a DLMKTeamDescriptor
+(instancetype) playerDescriptorWithName:(NSString*) name number:(NSUInteger)number photo:(UIImage*)aPhoto teamDescriptor:(DLMKTeamDescriptor*)aTeamDescriptor context:(NSManagedObjectContext*) aContext;


-(NSArray*) matchesForPlayer;
-(NSNumber*) goalsForPlayer;
-(NSNumber*) errorsForPlayer;
-(CGFloat) wonPercent;
-(CGFloat) lostPercent;
-(CGFloat) tiePercent;
-(CGFloat) errorsPercent;
-(CGFloat) goalsPercent;
-(NSUInteger) totalPlayedTimeInSeconds;
-(CGFloat) timePlayedPercent;
//-(CGFloat) timePlayedPerMatchPercent;
@end
