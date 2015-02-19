//
//  DLMKPlayerNameTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerDescriptor;

@interface DLMKPlayerNameTableViewCell : UITableViewCell<UITextFieldDelegate>


+(CGFloat)height;
+(NSString*)cellId;

@property (strong, nonatomic) DLMKPlayerDescriptor* playerDescriptorModel;
@property (weak, nonatomic) IBOutlet UITextField* txNameField;


@end
