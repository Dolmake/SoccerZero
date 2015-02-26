//
//  DLMKPhotoViewController.m
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import CoreImage;

#import "DLMKPhotoViewController.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKPhotoContainer.h"
#import "UIImage+Resize.h"

@interface DLMKPhotoViewController ()

@property (strong, nonatomic) DLMKPlayerDescriptor* playerDescriptorModel;

@end

@implementation DLMKPhotoViewController

-(id) initWithModel:(DLMKPlayerDescriptor*) model{
    if (self = [super initWithNibName:nil bundle:nil]){
        _playerDescriptorModel = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(self.description);
    
    //Deactivate the default option of fullfill the whole screen(IOS7)
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    //Add a border
//    self.photoView.layer.borderWidth = 10;
//    self.photoView.layer.borderColor = [[UIColor redColor] CGColor ];
//    CGSize size =self.photoView.layer.bounds.size;
//    self.photoView.layer.cornerRadius = fmin(size.width, size.height) * 0.5;
    self.photoView.clipsToBounds = YES;
    
    //Set the photo
    self.photoView.image = self.playerDescriptorModel.photoContainer.image;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.playerDescriptorModel.photoContainer.image = self.photoView.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)deletePhoto:(id)sender{
    
    
    CGRect oldRect = self.photoView.bounds;
    
    //Animation scale
    [UIView animateWithDuration:0.8
                          delay:0
                        options:0
                     animations:^{
                         
                         self.photoView.bounds =CGRectZero;
                         self.photoView.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         self.playerDescriptorModel.photoContainer.image = nil;
                         self.photoView.image = nil;
                         self.photoView.bounds =oldRect;
                         self.photoView.alpha = 1;
                     }];
    
    
    //Animation rotation
    [UIView animateWithDuration:0.8
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:1.0
                        options:0
                     animations:^(void){
                         self.photoView.transform = CGAffineTransformMakeRotation(M_PI_2);
                     }
                     completion:^(BOOL finished){
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];
    
    
   
    
    //self.note.photo.image = nil;
    //self.photoView.image = nil;

}

-(IBAction)takePhoto:(id)sender{

    UIImagePickerController* picker = [UIImagePickerController new];
    
    //Config
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:picker animated:YES completion: ^(void){
    
        NSLog(@"Picture done!!!!");
    
    }];
}

-(IBAction)ventigify:(id)sender{
    
    //Create a context
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //Create the original CGImage
    CIImage *original = [CIImage imageWithCGImage:self.playerDescriptorModel.photoContainer.image.CGImage];
    
    //Create and config a filter
    CIFilter *falseColor= [CIFilter filterWithName:@"CIFalseColor"];
    [falseColor setDefaults];
    [falseColor setValue:original forKey:@"InputImage"];
    
    //Get the output image
    CIImage *output = falseColor.outputImage;
    
    //Vignette filter
    CIFilter *vignnete = [CIFilter filterWithName:@"CIVignette"];
    [vignnete setDefaults];
    [vignnete setValue:@8 forKey:@"InputIntensity"];
    
    //Chain the filters
    [vignnete setValue:output forKey:@"InputImage"];
    
    output = vignnete.outputImage;
    
    //Apply the filter
    CGImageRef final = [context createCGImage:output fromRect:[output extent]];
    
    //Transform the image into UIImage
    UIImage *finalImg = [UIImage imageWithCGImage:final];
    
    //Free the resources
    CGImageRelease(final);
    
    //Infucked page into UIImageView
    self.photoView.image = finalImg;
    self.playerDescriptorModel.photoContainer.image = finalImg;
}


#pragma mark - Delegate UIImagePickerController
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    //Watch out!!!! Memory warning?
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //Resize
    CGSize newSize = CGSizeMake(image.size.width * 0.2, image.size.height * 0.2);
    
    image = [image resizedImage:newSize interpolationQuality:kCGInterpolationHigh];

    
       self.playerDescriptorModel.photoContainer.image = image;//[info objectForKey:UIImagePickerControllerOriginalImage];
    
    //Hide the picker
    //[self dismissViewControllerAnimated:NO completion:^(void){ }];
    
    //Hide the picker
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end




































