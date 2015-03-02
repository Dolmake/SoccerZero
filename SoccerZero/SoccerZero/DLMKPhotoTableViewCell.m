//
//  DLMKPhotoTableViewCell.m
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPhotoTableViewCell.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKPhotoContainer.h"

@implementation DLMKPhotoTableViewCell

#pragma mark - Properties
-(void) setPlayerDescriptorModel:(DLMKPlayerDescriptor *)playerDescriptorModel{
    
    //Save the note
    _playerDescriptorModel = playerDescriptorModel;
    
    //Synchronize the view with the note
    self.photoView.image = self.playerDescriptorModel.photoContainer.image;
    
}


#pragma mark - Class methods
+(CGFloat)height{
    return 232.0f;
}
+(NSString*)cellId{
    return [self description];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
