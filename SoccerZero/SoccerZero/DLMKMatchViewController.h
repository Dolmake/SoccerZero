//
//  DLMKMatchViewController.h
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;


@interface DLMKMatchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel* lbTime;
@property (weak, nonatomic) IBOutlet UILabel* lbResult;
@property (weak, nonatomic) IBOutlet UIButton* bPlay;
@property (weak, nonatomic) IBOutlet UIButton* bPause;

@property (nonatomic) BOOL timeIsRunning;
@property (nonatomic) CGFloat timeInSeconds;

-(IBAction)onStartTimer:(id)sender;
-(IBAction)onPauseTimer:(id)sender;


-(void) update:(id)sender;

@end
