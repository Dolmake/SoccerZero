#import "DLMKPlayerDescriptor.h"
#import "DLMKPhotoContainer.h"

@interface DLMKPlayerDescriptor ()

// Private interface goes here.

@end

@implementation DLMKPlayerDescriptor

// Custom logic goes here.
+(instancetype) playerDescriptorWithName:(NSString*) name number:(NSUInteger)number photo:(UIImage*)aPhoto teamDescriptor:(DLMKTeamDescriptor*)aTeamDescriptor context:(NSManagedObjectContext*) aContext{
    
    DLMKPlayerDescriptor* playerDescriptor = [self insertInManagedObjectContext:aContext];
    playerDescriptor.teamDescriptor = aTeamDescriptor;
    playerDescriptor.name = name;
    playerDescriptor.numberValue = number;
    playerDescriptor.playerStats = nil;
    //playerDescriptor.photoContainer = [DLMKPhotoContainer insertInManagedObjectContext:aContext ];
    playerDescriptor.photoContainer = [DLMKPhotoContainer photoContainerWithPhoto:aPhoto context:aContext ];
    
    return playerDescriptor;
}

@end
