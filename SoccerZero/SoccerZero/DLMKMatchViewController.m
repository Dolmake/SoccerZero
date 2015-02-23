//
//  DLMKMatchViewController.m
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMatchViewController.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"
#import "DLMKTimeServer.h"
#import "DLMKModelServer.h"
#import "DLMKCustomCellTypeCollection.h"

#import "DLMKPlayerStats.h"
#import "DLMKPlayerStatsTableViewCell.h"

@interface DLMKMatchViewController ()

@property (nonatomic, strong) DLMKCustomCellTypeCollection* cellCollection;

@end

@implementation DLMKMatchViewController

CGFloat _accumTime = 0;

#pragma mark - Properties

-(void) setTimeIsRunning:(BOOL)timeIsRunning{
    _timeIsRunning = timeIsRunning;
    self.bPlay.hidden = _timeIsRunning;
    self.bPause.hidden = !_timeIsRunning;
}
-(void) setTimeInSeconds:(CGFloat)timeInSeconds{
    _timeInSeconds = timeInSeconds;
//    self.lbTime.text = [DLMKTimeServer formatTime:_timeInSeconds];
}


#pragma mark - Init

-(id) initWithTeamDescriptor:(DLMKTeamDescriptor*)team{
    if (self = [super init]){
        _model = [[DLMKModelServer SINGLETON] newMatchForTeam:team ];
        _cellCollection = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKPlayerStatsTableViewCell class]]];
        
    }
    return self;
}

#pragma mark - UIView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupControls];
    
    self.tbPlayers.delegate = self;
    self.tbPlayers.dataSource = self;
    
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

#pragma mark - UITableViewDataSource delegate


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the proper player
    DLMKPlayerStats* playerStats = [[self.model.localTeamStats players ] objectAtIndex:indexPath.row ];
    
    DLMKPlayerStatsTableViewCell* cell = (DLMKPlayerStatsTableViewCell*)[self.cellCollection cellForTableView:self.tbPlayers atIndex:0];
    cell.playerStatsModel = playerStats;
    cell.delegate = self;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.model.localTeamStats countPlayers];
}

#pragma mark - UITableView delegate
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.cellCollection heightForIndex:0];
}



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
        self.model.seconds_playedValue = self.timeInSeconds;
        _accumTime +=[DLMKTimeServer SINGLETON].deltaTime;
        
        if (_accumTime > 1.0f) //ONE second has passed
        {
            _accumTime -= 1.0f;
            [self updatePlayersStats];
        }
       
    }
    
    self.lbTime.text = [DLMKTimeServer formatTime:self.model.seconds_playedValue];
}

#pragma mark - DLMKPlayerStatsProtocol

-(BOOL) timeIsRunning:(DLMKPlayerStats*)sender{
    return self.timeIsRunning;
}

-(void) onPlay:(DLMKPlayerStats*)sender{
    NSLog(@"Player %@ play" , sender.name);
    sender.is_playingValue = YES;
    
}
-(void) onBench:(DLMKPlayerStats*)sender{
        NSLog(@"Player %@ bench" , sender.name);
    sender.is_playingValue = NO;
    
}
-(void) onGoal:(DLMKPlayerStats*)sender{
        NSLog(@"Player %@ goal" , sender.name);
    sender.goalsValue += 1;
    
}
-(void) onMistake:(DLMKPlayerStats*)sender{
        NSLog(@"Player %@ Mistake" , sender.name);
    sender.errorsValue += 1;
    
}

#pragma mark - MISC
-(void) setupControls{
     self.bPause.center = self.bPlay.center;
    [self.cellCollection registerNibsForTableView:self.tbPlayers];
}

-(void) updatePlayersStats{
    NSArray* playersStats = self.model.localTeamStats.players;
    for (DLMKPlayerStats *playerStats in playersStats) {
        if (playerStats.is_playingValue)
            playerStats.seconds_playedValue += 1;
    }
}



@end












