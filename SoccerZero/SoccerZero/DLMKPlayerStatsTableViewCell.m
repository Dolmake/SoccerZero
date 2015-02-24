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
    [[DLMKTimeServer SINGLETON] addObserver:self ];
    [self syncModel];
}

/*
-(void) setIsPlaying:(BOOL)isPlaying{
    _isPlaying = isPlaying;
    if (_isPlaying){
        [[DLMKTimeServer SINGLETON] addObserver:self ];
    }
    else [[DLMKTimeServer SINGLETON] removeObserver:self];
}
 */

-(void) prepareForReuse{
    [[DLMKTimeServer SINGLETON] removeObserver:self];
    [self syncModel];
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
    if (self.playerStatsModel.is_playingValue)
    {
        [self.delegate onGoal:self.playerStatsModel];
         self.lbGoals.text = [[self.playerStatsModel goals] stringValue ];
    }
}
-(IBAction)mistake:(id)sender{
    if (self.playerStatsModel.is_playingValue)
    {
        [self.delegate onMistake:self.playerStatsModel];
        self.lbMistakes.text = [[self.playerStatsModel errors ] stringValue ];
    }
}

-(IBAction)inOut:(id)sender{
    if (self.swInOut.on)
        [self.delegate onPlay:self.playerStatsModel];
    else
        [self.delegate onBench:self.playerStatsModel];
}

#pragma mark - Update
-(void) update:(id)sender{
    /*
    if ([self.delegate timeIsRunning:self.playerStatsModel ]){
        
        if (self.playerStatsModel.is_playingValue){
            //self.timeInSeconds = self.timeInSeconds + [DLMKTimeServer SINGLETON].deltaTime;
            //self.playerStatsModel.seconds_playedValue = (NSUInteger)self.timeInSeconds;
        }
    }
     */
    self.tbPlayingTime.text = [DLMKTimeServer formatTime:self.playerStatsModel.seconds_playedValue];
   
}




#pragma mark - Misc
-(void) syncModel{
    self.tbName.text = self.playerStatsModel.name;
    self.tbNumber.text = [NSString stringWithFormat:@"%lu" , self.playerStatsModel.number];
    self.swInOut.on = self.playerStatsModel.is_playingValue;
    self.timeInSeconds = self.playerStatsModel.seconds_playedValue;
    self.lbGoals.text = self.playerStatsModel.goalsValue > 0 ? [[self.playerStatsModel goals] stringValue ] : nil;
    self.lbMistakes.text = self.playerStatsModel.errorsValue > 0 ? [[self.playerStatsModel errors] stringValue ] : nil;
}



@end
