//
//  DLMKPlayerDescriptorTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerDescriptorTableViewController.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKPlayerTableViewCell.h"
#import "DLMKPlayerNameTableViewCell.h"
#import "DLMKCustomCellTypeCollection.h"

@interface DLMKPlayerDescriptorTableViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;

@end



@implementation DLMKPlayerDescriptorTableViewController




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
    
    self.customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[                                                                                         [DLMKPlayerNameTableViewCell class],                                                                                                        [DLMKPlayerTableViewCell class]
                                                                                         ]];
    
    [self.customCells registerNibsForTableView:self.tableView ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return [_customCellCollection count];
    return [self.customCells.arrayOfClasses count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [ self.customCells heightForIndex:indexPath.section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell = [self.customCells cellForTableView:tableView atIndex:indexPath.section];
    [cell setValue:self.playerDescriptorModel forKey:@"playerDescriptorModel"];
    return cell;
    
}

@end
















