//
//  DLMKPlayerNameTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerNameTableViewCell.h"
#import "DLMKPlayerDescriptor.h"
#import "MACROS.h"

@implementation DLMKPlayerNameTableViewCell




#pragma mark - Class Methods
+(CGFloat)height{
    return 44.0f;
}
+(NSString*)cellId{
    return [self description];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) prepareForReuse{
    
    //Is invoked everty time the cell disappear
    [super prepareForReuse];
    
    if (!isEmpty(self.txNameField.text)){
        //Synchonize the note with the view
        self.playerDescriptorModel.name = self.txNameField.text;
    }
}

#pragma mark - Properties
-(void) setPlayerDescriptorModel:(DLMKPlayerDescriptor *)playerDescriptorModel{
    _playerDescriptorModel = playerDescriptorModel;
    self.txNameField.text = _playerDescriptorModel.name;
}

@end
