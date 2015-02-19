//
//  DLMKTeamNameTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 19/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamDescriptor;

@interface DLMKTeamNameTableViewCell : UITableViewCell<UITextFieldDelegate>


+(CGFloat)height;
+(NSString*)cellId;

@property (strong, nonatomic) DLMKTeamDescriptor* teamDescriptorModel;

@property (nonatomic, strong) IBOutlet UITextField* txNameField;


@end
