//
//  DLMKTeamCollectionViewCell.m
//  SoccerZero
//
//  Created by Daniel on 25/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKEditTeamCollectionViewCell.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKPhotoContainer.h"
#import "DLMKOnTakePhotoDelegate.h"

@implementation DLMKEditTeamCollectionViewCell

#pragma mark - Class Methods
+(CGFloat)height{
    return 175.0f;
}
+(NSString*)cellId{
    return [self description];
}
+(CGSize)cellSize{
    //return CGSizeMake(175.0f, 175.0f);
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return CGSizeMake(screenRect.size.width * 0.45f,screenRect.size.width  * 0.45f);
}

#pragma mark - Properties

-(void) setTeamDescriptorModel:(DLMKTeamDescriptor *)teamDescriptorModel{
    _teamDescriptorModel = teamDescriptorModel;
    self.lbTeamName.text = _teamDescriptorModel.name;
    self.imgShield.image = _teamDescriptorModel.photoContainer.image;
}

#pragma mark - Instance methods
- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - Actions
-(void) takePhoto:(id)sender{
    [self.delegate onTakePhoto:self];
}

@end
