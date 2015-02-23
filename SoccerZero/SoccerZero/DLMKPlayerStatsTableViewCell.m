//
//  DLMKPlayerStatsTableViewCell.m
//  SoccerZero
//
//  Created by Daniel on 23/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerStatsTableViewCell.h"
#import "DLMKPlayerStats.h"
#import "DLMKTimeServer.h"

@implementation DLMKPlayerStatsTableViewCell


#pragma mark - Class Methods
+(CGFloat)height{
    return 73.0f;
}
+(NSString*)cellId{
    return [self description];
}

#pragma mark - Properties
-(void) setPlayerStatsModel:(DLMKPlayerStats *)playerStatsModel{
    _playerStatsModel = playerStatsModel;
    [self syncModel];
}

-(void) setIsPlaying:(BOOL)isPlaying{
    _isPlaying = isPlaying;
    if (_isPlaying){
        [[DLMKTimeServer SINGLETON] addObserver:self ];
    }
    else [[DLMKTimeServer SINGLETON] removeObserver:self];
}

-(void) setTimeInSeconds:(CGFloat)timeInSeconds{
    _timeInSeconds = timeInSeconds;
     self.tbPlayingTime.text = [DLMKTimeServer formatTime:_timeInSeconds];
}

#pragma mark - UITableViewCell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Actions

-(IBAction)goal:(id)sender{
    [self.delegate onGoal:self.playerStatsModel];
}
-(IBAction)mistake:(id)sender{
    [self.delegate onMistake:self.playerStatsModel];
}

-(IBAction)inOut:(id)sender{
    if (self.swInOut.on)
        [self.delegate onPlay:self.playerStatsModel];
    else
        [self.delegate onBench:self.playerStatsModel];
}

#pragma mark - Update
-(void) update{
    if (self.isPlaying){
        self.timeInSeconds = self.timeInSeconds + [DLMKTimeServer SINGLETON].deltaTime;
        self.playerStatsModel.seconds_playedValue = (NSUInteger)self.timeInSeconds;
    }
}




#pragma mark - Misc
-(void) syncModel{
    self.tbName.text = self.playerStatsModel.name;
    self.tbNumber.text = [self.playerStatsModel.number stringValue];
}



@end