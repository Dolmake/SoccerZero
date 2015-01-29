//
//  DLMKPlayerTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerModel;

@interface DLMKPlayerTableViewCell : UITableViewCell

@property (weak, nonatomic) DLMKPlayerModel* playerModel;
@property (weak,nonatomic) IBOutlet UILabel* lbName;
@property (weak,nonatomic) IBOutlet UILabel* lbGoal;

@end
