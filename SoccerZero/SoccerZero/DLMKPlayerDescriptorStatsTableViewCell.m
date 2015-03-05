//
//  DLMKPlayerDescriptorStatsTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 05/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerDescriptorStatsTableViewCell.h"
#import "DLMKPlayerDescriptor.h"
#import "AksStraightPieChart.h"
#import "DLMKTimeServer.h"

@implementation DLMKPlayerDescriptorStatsTableViewCell


#pragma mark - Class Methods
+(CGFloat)height{
    return 174.0f;
}
+(NSString*)cellId{
    return [self description];
}
+(NSString*)cellSectionTitle{
    return @"Player's Stats";
}


#pragma mark - Properties
-(void) setPlayerDescriptorModel:(DLMKPlayerDescriptor *)playerDescriptorModel{
    _playerDescriptorModel = playerDescriptorModel;
    [self updateControls];
}

#pragma mark - UIView
- (void)awakeFromNib {
 // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Misc
-(void) updateControls{
    
    [self.vwMatches fillWithPercent:self.playerDescriptorModel.wonPercent WithColor:[self barColor] BackColor: [UIColor blackColor] ];
    [self.vwGoals fillWithPercent: self.playerDescriptorModel.goalsPercent WithColor:[self barColor] BackColor: [UIColor blackColor] ];
    [self.vwErrors fillWithPercent: self.playerDescriptorModel.errorsPercent WithColor:[self barColor] BackColor: [UIColor blackColor] ];
    [self.vwTotalTime fillWithPercent:self.playerDescriptorModel.timePlayedPercent WithColor:[self barColor] BackColor: [UIColor blackColor] ];
    self.lbTimePlayed.text =[DLMKTimeServer formatTime:self.playerDescriptorModel.totalPlayedTimeInSeconds];

    self.lbErrors.text = [self.playerDescriptorModel.errorsForPlayer stringValue];
    self.lbGoals.text = [self.playerDescriptorModel.goalsForPlayer stringValue];
    self.lbMatches.text = [@(self.playerDescriptorModel.matchesForPlayer.count) stringValue];
}

-(UIColor*) barColor{
    CGFloat inv = 1.0f / 256.0f;
    return [UIColor colorWithRed:56.0f*inv green:189.0f*inv blue:42.0f*inv alpha:1.0f];
}

@end








