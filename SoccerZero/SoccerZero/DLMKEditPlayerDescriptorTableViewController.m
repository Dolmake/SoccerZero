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

#import "MACROS.h"

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
    
}

@end
















