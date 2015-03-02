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
#import "DLMKCustomCellTypeCollection.h"

#import "LCNumberInputControl.h"

#import "MACROS.h"

#define PLAYERS_NUMBER_SECTION 1

@interface DLMKEditPlayerDescriptorTableViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* cells = @[[DLMKPlayerNameTableViewCell class],[DLMKPlayerNumberTableViewCell class]];
    self.customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:cells];
    
    [self.customCells registerNibsForTableView:self.tableView ];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    __DLMK_NSLOG_DESCRIPTION__
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

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.customCells cellSectionTitleForIndex:section];
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

#pragma mark - NumberPicker
- (void)show:(id)sender
{
    LCNumberInputControl *inputView = [[[NSBundle mainBundle] loadNibNamed:@"LCNumberInputControl" owner:self options:nil] objectAtIndex:0];
    [inputView setFrame:CGRectMake(0, self.view.frame.size.height, kNumberControlWidth, kNumberControlHeight)];
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
}

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

- (void)dismissPickerControl:(LCNumberInputControl*)view
{
    /*
     if your parent controller has a tableview , then your need tableview contentoffset
     
     eg. self.tableView.contentoffset
     */
    [view dismissWithOffset:CGPointMake(0, 0)];
}


@end
















