//
//  DLMKMatchStatsTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 23/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKMatchStats;

@interface DLMKMatchStatsTableViewCell : UITableViewCell<UITextFieldDelegate>

+(CGFloat)height;
+(NSString*)cellId;

@property (strong, nonatomic) DLMKMatchStats* matchStatsModel;

@property (weak,nonatomic) IBOutlet UILabel* lbLocalTeam;
@property (weak,nonatomic) IBOutlet UILabel* lbVisitanTeam;
@property (weak,nonatomic) IBOutlet UILabel* lbResult;
@property (weak,nonatomic) IBOutlet UILabel* lbDate;
@property (weak,nonatomic) IBOutlet UITextField* tfVisitantTeamName;

@end
