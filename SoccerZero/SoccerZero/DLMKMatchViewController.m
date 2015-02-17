//
//  DLMKMatchViewController.m
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMatchViewController.h"
#import "DLMKTimeServer.h"


@interface DLMKMatchViewController ()



@end

@implementation DLMKMatchViewController

#pragma mark - Properties

-(void) setTimeIsRunning:(BOOL)timeIsRunning{
    _timeIsRunning = timeIsRunning;
    self.bPlay.hidden = _timeIsRunning;
    self.bPause.hidden = !_timeIsRunning;
}
-(void) setTimeInSeconds:(CGFloat)timeInSeconds{
    _timeInSeconds = timeInSeconds;
    self.lbTime.text = [DLMKTimeServer formatTime:_timeInSeconds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupControls];
    
    self.tbPlayers.delegate = self;
    
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.timeIsRunning = false;
    [[DLMKTimeServer SINGLETON] addObserver:self];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[DLMKTimeServer SINGLETON] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions
-(IBAction)onStartTimer:(id)sender{
    self.timeIsRunning = YES;
}

-(IBAction)onPauseTimer:(id)sender{
    self.timeIsRunning = NO;
    }

#pragma mark - Update
-(void) update:(id)sender{
    
    if (self.timeIsRunning){
        self.timeInSeconds = self.timeInSeconds + [DLMKTimeServer SINGLETON].deltaTime;
    }
}

#pragma mark - MISC
-(void) setupControls{
     self.bPause.center = self.bPlay.center;
}



@end












