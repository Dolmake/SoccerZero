//
//  DLMKPlayerTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerTableViewCell.h"
#import "DLMKPlayerModel.h"

@implementation DLMKPlayerTableViewCell





- (void)awakeFromNib {
    // Initialization code
    
    if (self.playerModel){
        self.lbName.text = self.playerModel.name;
    }
    else{
        self.lbName.text = @"awaked";
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (self.playerModel){
        self.lbName.text = self.playerModel.name;
        self.lbGoal.text =  [NSString stringWithFormat:@"%ld",(long)self.playerModel.goals ];
    }
    else{
        self.lbName.text = @"No Player";
        self.lbGoal.text = @"0";
    }
}


@end
