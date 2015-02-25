//
//  DLMKTeamNameTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 19/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamNameTableViewCell.h"
#import "DLMKTeamDescriptor.h"
#import "MACROS.h"

@implementation DLMKTeamNameTableViewCell


#pragma mark - Class Methods
+(CGFloat)height{
    return 44.0f;
}
+(NSString*)cellId{
    return [self description];
}
+(CGSize)cellSize{
    return CGSizeMake(175.0f, 44.0f);
}


#pragma mark - Properties
-(void) setTeamDescriptorModel:(DLMKTeamDescriptor *)teamDescriptorModel{
    _teamDescriptorModel = teamDescriptorModel;
    self.txNameField.text = _teamDescriptorModel.name;
}


- (void)awakeFromNib {
    // Initialization code
    self.txNameField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - UITextFieldDelegate

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    
}
-(void) textFieldDidEndEditing:(UITextField *)textField{
    if (!isEmpty(self.txNameField.text)){
        //Synchonize the note with the view
        self.teamDescriptorModel.name = self.txNameField.text;
    }
    
}

@end
