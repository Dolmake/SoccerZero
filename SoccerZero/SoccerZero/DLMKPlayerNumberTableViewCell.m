//
//  DLMKPlayerNumberTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 19/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerNumberTableViewCell.h"
#import "DLMKPlayerDescriptor.h"

@implementation DLMKPlayerNumberTableViewCell


#pragma mark - Class Methods
+(CGFloat)height{
    return 44.0f;
}
+(NSString*)cellId{
    return [self description];
}
+(NSString*)cellSectionTitle{
    return @"Player's Number";
}

#pragma mark - Properties
-(void) setPlayerDescriptorModel:(DLMKPlayerDescriptor *)playerDescriptorModel{
    _playerDescriptorModel = playerDescriptorModel;
    self.lbNumber.text = [_playerDescriptorModel.number stringValue ];
}

#pragma mark - UIView
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
