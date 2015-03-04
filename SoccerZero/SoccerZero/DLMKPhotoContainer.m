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
    
    if (image)
        self.photoData = UIImagePNGRepresentation(image);
}

#pragma mark - Class Methods
+(instancetype) photoContainerWithPhoto:(UIImage *)photo context:(NSManagedObjectContext*)aContext{
    DLMKPhotoContainer *photoContainer = [DLMKPhotoContainer insertInManagedObjectContext:aContext];
    photoContainer.image = photo;
    return photoContainer;
}

@end
