//
//  DLMKPlayerDescriptorTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKEditPlayerDescriptorTableViewController.h"
#import "DLMKPlayerDescriptor.h"

#import "DLMKPlayerNameTableViewCell.h"
#import "DLMKPlayerNumberTableViewCell.h"
#import "DLMKPhotoTableViewCell.h"
#import "DLMKPlayerDescriptorStatsTableViewCell.h"

#import "DLMKCustomCellTypeCollection.h"

#import "LCNumberInputControl.h"

#import "MACROS.h"

#define PLAYERS_NUMBER_SECTION 1

@interface DLMKEditPlayerDescriptorTableViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;
@property (nonatomic) BOOL keyBoardShown;

@end



@implementation DLMKEditPlayerDescriptorTableViewController



#pragma mark - Init

-(id) initWithPlayerDescriptor: (DLMKPlayerDescriptor*) playerDescriptor{
    if (self = [super init]){
        _playerDescriptorModel = playerDescriptor;
        self.title = playerDescriptor.name;
    }
    return self;
}
#pragma mark - UIView
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* cells = @[[DLMKPlayerNameTableViewCell class],[DLMKPlayerNumberTableViewCell class],[DLMKPhotoTableViewCell class], [DLMKPlayerDescriptorStatsTableViewCell class]];
    self.customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:cells];
    
    [self.customCells registerNibsForTableView:self.tableView ];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.keyBoardShown = NO;

    //Subscribe KVO just to play with it
    [self.playerDescriptorModel addObserver:self forKeyPath:@"number" options:0 context:nil];
    
    [self.tableView reloadData];
    __DLMK_NSLOG_DESCRIPTION__
}
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //Remove KVO subscription
    [self.playerDescriptorModel removeObserver:self forKeyPath:@"number"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.customCells.arrayOfClasses count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [ self.customCells heightForIndex:indexPath.section];
}

/*
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.customCells cellSectionTitleForIndex:section];
}
 */

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Background color
    view.tintColor = [UIColor blackColor];
    
    // Text Color
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor whiteColor]];
    
    // Another way to set the background color
    // Note: does not preserve gradient effect of original header
    // header.contentView.backgroundColor = [UIColor blackColor];
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 16.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell = [self.customCells cellForTableView:tableView atIndex:indexPath.section];
    [cell setValue:self.playerDescriptorModel forKey:@"playerDescriptorModel"];
    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == PLAYERS_NUMBER_SECTION){
        [self show:self.playerDescriptorModel];
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if ([keyPath isEqual:@"number"]) {
        [self.tableView reloadData];
        
    }
}

#pragma mark - NumberPicker
- (void)show:(id)sender
{
    if (self.keyBoardShown) return;
    
    LCNumberInputControl *inputView = [[[NSBundle mainBundle] loadNibNamed:@"LCNumberInputControl" owner:self options:nil] objectAtIndex:0];
    [inputView setFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, kNumberControlHeight)];
    [inputView setDelegate:self];
    [inputView setTag:11];
    [inputView setInputType:numberInputTypeInteger];
    //current pick value
    [inputView setInputResult: ((DLMKPlayerDescriptor*)sender).number];//[NSNumber numberWithInteger:[self.title integerValue]]];
    [inputView.titleBar.topItem setTitle:[NSString stringWithFormat:@"Please input a number"]];
    [inputView.numberField setPlaceholder:[NSString stringWithFormat:@"Input you number"]];
    
    //Set playerDescriptor as UserInfo
    inputView.userInfo = sender;
    
    [self.view addSubview:inputView];
    
    /*
     if your parent controller has a tableview , then your need tableview contentoffset
     
     eg. self.tableView.contentoffset
     */
    [inputView showWithOffset:CGPointMake(0, 0) inView:self.view];
    self.keyBoardShown = YES;
}

#pragma mark - LCNumberInputDelegate
- (void)numberControl:(LCNumberInputControl*)view didInputWithNumber:(NSNumber*)number{
    
    DLMKPlayerDescriptor *playerDescriptor = (DLMKPlayerDescriptor*)view.userInfo;
    playerDescriptor.number = number;
    view.inputResult = number;
    [self dismissPickerControl:view];
    [self.tableView reloadData];
}
- (void)numberControl:(LCNumberInputControl *)view didCancelWithNumber:(NSNumber *)number{
    [self dismissPickerControl:view];
}

-(void)numberControl:(LCNumberInputControl *)view didValueChangedWithNumber:(NSNumber *)number{
    self.playerDescriptorModel.number = number;
}

- (void)dismissPickerControl:(LCNumberInputControl*)view
{
    /*
     if your parent controller has a tableview , then your need tableview contentoffset
     
     eg. self.tableView.contentoffset
     */
    [view dismissWithOffset:CGPointMake(0, 0)];
    self.keyBoardShown = NO;
}


@end
















