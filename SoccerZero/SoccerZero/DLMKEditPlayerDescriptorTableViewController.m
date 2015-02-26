//
//  DLMKPlayerDescriptorTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKEditPlayerDescriptorTableViewController.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKPhotoTableViewCell.h"
#import "DLMKPlayerNameTableViewCell.h"
#import "DLMKCustomCellTypeCollection.h"
#import "DLMKPhotoViewController.h"
#import "MACROS.h"

@interface DLMKEditPlayerDescriptorTableViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;

@end



@implementation DLMKEditPlayerDescriptorTableViewController

#define DLMK_PHOTO_SECTION 1

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
    
    self.customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[                                                                                         [DLMKPlayerNameTableViewCell class],                                                                                                        [DLMKPhotoTableViewCell class]
                                                                                         ]];
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell = [self.customCells cellForTableView:tableView atIndex:indexPath.section];
    [cell setValue:self.playerDescriptorModel forKey:@"playerDescriptorModel"];
    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == DLMK_PHOTO_SECTION){
        DLMKPhotoViewController *photoVC = [[DLMKPhotoViewController alloc] initWithModel:self.playerDescriptorModel.photoContainer];
        [self.navigationController pushViewController:photoVC animated:YES];
    }
}

@end
















