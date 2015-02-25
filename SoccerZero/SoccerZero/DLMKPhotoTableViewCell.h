//
//  DLMKPhotoTableViewCell.h
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerDescriptor;

@interface DLMKPhotoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView* photoView;
@property (strong, nonatomic) DLMKPlayerDescriptor* playerDescriptorModel;

+(CGFloat)height;
+(NSString*)cellId;

@end
