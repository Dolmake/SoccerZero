#import "DLMKPhotoContainer.h"

@interface DLMKPhotoContainer ()

// Private interface goes here.

@end

@implementation DLMKPhotoContainer


#pragma mark - Class Methods
+(CGFloat)height{
    return 312.0f;
}
+(NSString*)cellId{
    return [self description];
}

#pragma mark - Properties
// Custom logic goes here.
-(UIImage*) image{
    return [UIImage imageWithData:self.photoData];
}

-(void) setImage:(UIImage *)image{
    
    self.photoData = UIImagePNGRepresentation(image);
}

@end
