//
//  DLMKPlayerStatsTableViewCell.h
//  SoccerZero
//
//  Created by Daniel on 23/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerStats;

@protocol DLMKPlayerStatsProtocol <NSObject>

-(void) onPlay:(DLMKPlayerStats*)sender;
-(void) onBench:(DLMKPlayerStats*)sender;
-(void) onGoal:(DLMKPlayerStats*)sender;
-(void) onMistake:(DLMKPlayerStats*)sender;

@end

@interface DLMKPlayerStatsTableViewCell : UITableViewCell


+(CGFloat)height;
+(NSString*)cellId;

@property (weak, nonatomic) id<DLMKPlayerStatsProtocol> delegate;
@property (strong, nonatomic) DLMKPlayerStats* playerStatsModel;
@property (nonatomic) BOOL isPlaying;
@property (nonatomic) CGFloat timeInSeconds;

@property (weak , nonatomic) IBOutlet UILabel* tbName;
@property (weak , nonatomic) IBOutlet UILabel* tbNumber;
@property (weak, nonatomic) IBOutlet UILabel* tbPlayingTime;
@property (weak ,nonatomic) IBOutlet UISwitch* swInOut;


-(IBAction)goal:(id)sender;
-(IBAction)mistake:(id)sender;
-(IBAction)inOut:(id)sender;

@end
