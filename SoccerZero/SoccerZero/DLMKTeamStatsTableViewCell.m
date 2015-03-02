//
//  DLMKTeamStatsTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 02/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamStatsTableViewCell.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKPhotoContainer.h"

@implementation DLMKTeamStatsTableViewCell

#pragma mark - Class methods


+(CGFloat)height{
    return 72.0f;
}
+(NSString*)cellId{
    return [self description];
}

#pragma mark - Properties

-(void) setTeamDescriptorModel:(DLMKTeamDescriptor *)teamDescriptorModel{
    _teamDescriptorModel = teamDescriptorModel;
    [self updateControls];
}

#pragma mark - UITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Misc
-(void) updateControls{
    self.imgShield.image = self.teamDescriptorModel.photoContainer.image;
    self.lbName.text = self.teamDescriptorModel.name;
    self.lbWin.text = [@([[self.teamDescriptorModel winningMatches] count]) stringValue];
    self.lbLost.text = [@([[self.teamDescriptorModel lossingMatches] count]) stringValue];
}

@end
