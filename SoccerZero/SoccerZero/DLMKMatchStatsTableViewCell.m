//
//  DLMKMatchStatsTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 23/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMatchStatsTableViewCell.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"
#import "MACROS.h"

@implementation DLMKMatchStatsTableViewCell



#pragma mark - Class Methods
+(CGFloat)height{
    return 66.0f;
}
+(NSString*)cellId{
    return [self description];
}

#pragma mark - Properties
-(void) setMatchStatsModel:(DLMKMatchStats *)matchStatsModel{
    _matchStatsModel = matchStatsModel;
    
    //self.lbDate.text = [NSString stringWithFormat:@"%@",_matchStatsModel.date];
    self.lbLocalTeam.text = _matchStatsModel.localTeamStats.name;
    self.lbVisitanTeam.text = _matchStatsModel.visitantTeamStats.name;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSString *dateString = [dateFormatter stringFromDate:_matchStatsModel.date];
    
    self.lbDate.text = dateString;
    self.lbResult.text = [ NSString stringWithFormat:@"%lu : %lu",[_matchStatsModel.localTeamStats goals ], [_matchStatsModel.visitantTeamStats goals]];
    
    self.tfVisitantTeamName.delegate = nil;
    self.tfVisitantTeamName.text = _matchStatsModel.visitantTeamStats.name;
    self.tfVisitantTeamName.delegate = self;
}



#pragma mark - UITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (!isEmpty(textField.text)){
        self.matchStatsModel.visitantTeamStats.name = textField.text;
    }
}


@end

























