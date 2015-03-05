//
//  DLMKPlayerDescriptorStatsTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 05/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerDescriptor;
@class AksStraightPieChart;



@interface DLMKPlayerDescriptorStatsTableViewCell : UITableViewCell


+(CGFloat)height;
+(NSString*)cellId;
+(NSString*)cellSectionTitle;

@property (weak, nonatomic) IBOutlet UILabel *lbMatches;
@property (weak, nonatomic) IBOutlet UILabel *lbGoals;
@property (weak, nonatomic) IBOutlet UILabel *lbErrors;
@property (weak, nonatomic) IBOutlet AksStraightPieChart *vwMatches;
@property (weak, nonatomic) IBOutlet AksStraightPieChart *vwGoals;
@property (weak, nonatomic) IBOutlet AksStraightPieChart *vwErrors;
@property (weak, nonatomic) IBOutlet AksStraightPieChart *vwTotalTime;
@property (weak, nonatomic) IBOutlet UILabel *lbTimePlayed;

@property (strong, nonatomic) DLMKPlayerDescriptor* playerDescriptorModel;

@end
