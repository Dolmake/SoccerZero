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
#import "DLMKRivalStats.h"
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
    self.lbLocalTeam.text = [_matchStatsModel teamStats].name;
    self.lbVisitanTeam.text = [_matchStatsModel rivalStats ].name;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"dd/MM/YY HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:_matchStatsModel.date];
    
    self.lbDate.text = dateString;
    self.lbResult.text = [ NSString stringWithFormat:@"%lu : %hd",[_matchStatsModel.teamStats goals ], [_matchStatsModel.rivalStats goalsValue]];
    
    self.tfVisitantTeamName.delegate = nil;
    self.tfVisitantTeamName.text = _matchStatsModel.rivalStats.name;
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
        self.matchStatsModel.rivalStats.name = textField.text;
    }
}


@end

























