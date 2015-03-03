//
//  DLMKTeamStatsTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 02/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamDescriptor;

@interface DLMKTeamStatsTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString*)cellId;

@property (weak, nonatomic) IBOutlet UILabel* lbName;
@property (weak, nonatomic) IBOutlet UILabel* lbWin;
@property (weak, nonatomic) IBOutlet UILabel* lbLost;
@property (weak, nonatomic) IBOutlet UIImageView* imgShield;
@property (weak, nonatomic) IBOutlet UILabel *lbTie;

@property (strong, nonatomic) DLMKTeamDescriptor* teamDescriptorModel;




@end
