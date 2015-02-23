//
//  DLMKPlayerTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerDescriptor;

@interface DLMKPlayerTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString*)cellId;

@property (strong, nonatomic) DLMKPlayerDescriptor* playerDescriptorModel;
@property (weak,nonatomic) IBOutlet UILabel* lbName;
@property (weak,nonatomic) IBOutlet UILabel* lbGoal;



@end
