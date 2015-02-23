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
#import "DLMKPlayerTableViewCell.h"
#import "DLMKPlayerStats.h"

@interface DLMKMatchViewController ()

@property (nonatomic, strong) DLMKCustomCellTypeCollection* cellCollection;

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


#pragma mark - Init

-(id) initWithTeamDescriptor:(DLMKTeamDescriptor*)team{
    if (self = [super init]){
        _model = [[DLMKModelServer SINGLETON] newMatchForTeam:team ];
        _cellCollection = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKPlayerTableViewCell class]]];
        
    }
    return self;
}

#pragma mark - UIView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupControls];
    
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

#pragma mark - UITableView delegate


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the proper player
    DLMKPlayerStats* playerStats = [[self.model.localTeamStats players ] objectAtIndex:indexPath.row ];
    
    DLMKPlayerTableViewCell* cell = (DLMKPlayerTableViewCell*)[self.cellCollection cellForTableView:self.tbPlayers atIndex:0];
    cell.playerDescriptorModel = playerStats.playerDescriptor;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.model.localTeamStats countPlayers];
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
    }
}

#pragma mark - MISC
-(void) setupControls{
     self.bPause.center = self.bPlay.center;
    [self.cellCollection registerNibsForTableView:self.tbPlayers];
}



@end












