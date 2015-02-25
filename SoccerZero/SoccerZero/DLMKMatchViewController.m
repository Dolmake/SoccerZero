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
#import "DLMKRivalStats.h"
#import "DLMKTimeServer.h"
#import "DLMKModelServer.h"
#import "DLMKCustomCellTypeCollection.h"

#import "DLMKPlayerStats.h"
#import "DLMKPlayerStatsTableViewCell.h"

@interface DLMKMatchViewController ()

@property (nonatomic, strong) DLMKCustomCellTypeCollection* cellCollection;
@property (nonatomic, strong, readonly) NSArray *playersStatsCache;

@end

@implementation DLMKMatchViewController

//Private variables just for internal purposes
CGFloat _accumTime = 0;

#pragma mark - Properties

-(void) setTimeIsRunning:(BOOL)timeIsRunning{
    _timeIsRunning = timeIsRunning;
    self.bPlay.hidden = _timeIsRunning;
    self.bPause.hidden = !_timeIsRunning;
}
-(void) setTimeInSeconds:(CGFloat)timeInSeconds{
    _timeInSeconds = timeInSeconds;
}


#pragma mark - Init

-(id) initWithTeamDescriptor:(DLMKTeamDescriptor*)team{
    return [self initWithMatch:[[DLMKModelServer SINGLETON] newMatchForTeam:team ]];
}
-(id) initWithMatch:(DLMKMatchStats*)match{
    if (self = [super init]){
        _model = match;
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
    _accumTime = 0.0f;
    _playersStatsCache = self.model.teamStats.players;
    self.timeInSeconds = self.model.seconds_playedValue;
    self.lbTeam.text = self.model.teamStats.name;
    self.lbRival.text = self.model.rivalStats.name;
    [self updateResult];
    [[DLMKTimeServer SINGLETON] addObserver:self];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.lbRival.text = self.model.rivalStats.name;
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
    DLMKPlayerStats* playerStats = [[self.model.teamStats players ] objectAtIndex:indexPath.row ];
    
    DLMKPlayerStatsTableViewCell* cell = (DLMKPlayerStatsTableViewCell*)[self.cellCollection cellForTableView:self.tbPlayers atIndex:0];
    cell.playerStatsModel = playerStats;
    cell.delegate = self;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.model.teamStats countPlayers];
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

-(IBAction)onRivalGoal:(id)sender{
    if (self.timeIsRunning){
        self.model.rivalStats.goalsValue += 1;
        [self updateResult];
    }
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
    sender.last_seconds_playedValue  = 0;
    
}
-(void) onBench:(DLMKPlayerStats*)sender{
    NSLog(@"Player %@ bench" , sender.name);
    sender.is_playingValue = NO;
    
}
-(void) onGoal:(DLMKPlayerStats*)sender{
    if (self.timeIsRunning){
        NSLog(@"Player %@ goal" , sender.name);
        sender.goalsValue += 1;
        [self updateResult];
    }
    
}
-(void) onMistake:(DLMKPlayerStats*)sender{
    if (self.timeIsRunning){
        NSLog(@"Player %@ Mistake" , sender.name);
        sender.errorsValue += 1;
    }
}

#pragma mark - MISC
-(void) setupControls{
     self.bPause.center = self.bPlay.center;
    [self.cellCollection registerNibsForTableView:self.tbPlayers];
}

-(void) updatePlayersStats{
        for (DLMKPlayerStats *playerStats in self.playersStatsCache) {
        if (playerStats.is_playingValue)
        {
            playerStats.seconds_playedValue += 1;
            playerStats.last_seconds_playedValue += 1;
        }
    }
}

-(void) updateResult{
    NSUInteger localGoals = 0;
    for (DLMKPlayerStats *playerStats in self.playersStatsCache) {
        localGoals += playerStats.goalsValue;
    }
    
    NSUInteger rivalGoals = self.model.rivalStats.goalsValue;
    
    self.lbResult.text = [NSString stringWithFormat:@" %lu : %lu" , localGoals, rivalGoals];


}



@end












