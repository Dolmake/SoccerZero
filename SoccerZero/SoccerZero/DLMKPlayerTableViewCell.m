//
//  DLMKPlayerTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerTableViewCell.h"
#import "DLMKPlayerDescriptor.h"

@implementation DLMKPlayerTableViewCell



#pragma mark - Class Methods
+(CGFloat)height{
    return 44.0f;
}
+(NSString*)cellId{
    return [self description];
}




- (void)awakeFromNib {
    // Initialization code
    
    if (self.playerDescriptorModel){
        self.lbName.text = self.playerDescriptorModel.name;
        
    }
    else{
        self.lbName.text = @"Unnamed player";
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

//    // Configure the view for the selected state
//    if (self.playerModel){
//        self.lbName.text = self.playerModel.name;
//        self.lbGoal.text =  [NSString stringWithFormat:@"%ld",(long)self.playerModel.goals ];
//    }
//    else{
//        self.lbName.text = @"No Player";
//        self.lbGoal.text = @"0";
//    }
}


@end
