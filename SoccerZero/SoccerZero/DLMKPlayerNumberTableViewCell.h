//
//  DLMKPlayerNumberTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 19/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerDescriptor;

@interface DLMKPlayerNumberTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString*)cellId;
+(NSString*)cellSectionTitle;

@property (strong,nonatomic) DLMKPlayerDescriptor* playerDescriptorModel;
@property (weak, nonatomic) IBOutlet UILabel* lbNumber;


@end
