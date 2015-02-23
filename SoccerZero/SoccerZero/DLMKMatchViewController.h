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

@interface DLMKMatchViewController : UIViewController<UITableViewDataSource>

@property (strong, nonatomic) DLMKMatchStats* model;

@property (weak, nonatomic) IBOutlet UILabel* lbTime;
@property (weak, nonatomic) IBOutlet UILabel* lbResult;
@property (weak, nonatomic) IBOutlet UIButton* bPlay;
@property (weak, nonatomic) IBOutlet UIButton* bPause;
@property (weak, nonatomic) IBOutlet UITableView* tbPlayers;

@property (nonatomic) BOOL timeIsRunning;
@property (nonatomic) CGFloat timeInSeconds;

-(id) initWithTeamDescriptor:(DLMKTeamDescriptor*)team;

-(IBAction)onStartTimer:(id)sender;
-(IBAction)onPauseTimer:(id)sender;


-(void) update:(id)sender;

@end
