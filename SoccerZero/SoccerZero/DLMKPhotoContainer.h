

@import UIKit;
#import "_DLMKPhotoContainer.h"

@interface DLMKPhotoContainer : _DLMKPhotoContainer {}
// Custom logic goes here.

@property (nonatomic, strong) UIImage *image;

+(CGFloat)height;
+(NSString*)cellId;

+(instancetype) photoContainerWithPhoto:(UIImage*)photo context:(NSManagedObjectContext*)aContext;

@end
