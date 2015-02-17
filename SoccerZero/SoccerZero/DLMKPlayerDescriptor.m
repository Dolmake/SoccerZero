#import "DLMKPlayerDescriptor.h"

@interface DLMKPlayerDescriptor ()

// Private interface goes here.

@end

@implementation DLMKPlayerDescriptor

// Custom logic goes here.
+(instancetype) playerDescriptorWithName:(NSString*) name number:(NSUInteger)number teamDescriptor:(DLMKTeamDescriptor*)aTeamDescriptor context:(NSManagedObjectContext*) aContext{
    
    DLMKPlayerDescriptor* playerDescriptor = [self insertInManagedObjectContext:aContext];
    playerDescriptor.team = aTeamDescriptor;
    playerDescriptor.name = name;
    playerDescriptor.numberValue = number;
    playerDescriptor.playerStats = nil;
    
    return playerDescriptor;
}

@end
