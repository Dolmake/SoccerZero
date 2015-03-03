//
//  DLMKMatchViewController.h
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKMatchStats;
@class DLMKTeamDescriptor;
@class DLMKPlayerStats;
@protocol DLMKPlayerStatsProtocol;

@interface DLMKMatchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,DLMKPlayerStatsProtocol >

@property (strong, nonatomic) DLMKMatchStats* model;

@property (weak, nonatomic) IBOutlet UILabel* lbTime;
@property (weak, nonatomic) IBOutlet UILabel* lbResult;
@property (weak, nonatomic) IBOutlet UIButton* bPlay;
@property (weak, nonatomic) IBOutlet UIButton* bPause;
@property (weak, nonatomic) IBOutlet UITableView* tbPlayers;
@property (weak, nonatomic) IBOutlet UILabel* lbTeam;
@property (weak, nonatomic) IBOutlet UILabel* lbRival;
@property (weak, nonatomic) IBOutlet UIButton* bFirstHalf;
@property (weak, nonatomic) IBOutlet UIButton* bSecondHalf;
@property (weak, nonatomic) IBOutlet UILabel* lbFirstHalf;
@property (weak, nonatomic) IBOutlet UILabel* lbSecondHalf;

@property (nonatomic) BOOL timeIsRunning;
@property (nonatomic, readonly) CGFloat timeInSeconds;
@property (nonatomic) CGFloat timeInSecondsFirstHalf;
@property (nonatomic) CGFloat timeInSecondsSecondHalf;

-(id) initWithTeamDescriptor:(DLMKTeamDescriptor*)team;
-(id) initWithMatch:(DLMKMatchStats*)match;

-(IBAction)onStartTimer:(id)sender;
-(IBAction)onPauseTimer:(id)sender;
-(IBAction)onRivalGoal:(id)sender;
-(IBAction)onFirstHalf:(id)sender;
-(IBAction)onSecondHalf:(id)sender;


-(void) update:(id)sender;

//DLMKPlayerStatsProtocol
-(BOOL) timeIsRunning:(DLMKPlayerStats*)sender;
-(void) onPlay:(DLMKPlayerStats*)sender;
-(void) onBench:(DLMKPlayerStats*)sender;
-(void) onGoal:(DLMKPlayerStats*)sender;
-(void) onMistake:(DLMKPlayerStats*)sender;

@end
