//
//  DLMKTeamTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamDescriptorTableViewController.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKPlayerTableViewCell.h"
#import "DLMKTimeServer.h"
#import "DLMKPlayerDescriptorTableViewController.h"

@interface DLMKTeamDescriptorTableViewController ()

@end

@implementation DLMKTeamDescriptorTableViewController



#pragma mark - InitWith
-(id) initWithTeamModel:(DLMKTeamDescriptor*)model{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //Add the "addButton"
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    self.title = self.model.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model countPlayers];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    DLMKPlayerDescriptor *playerDescriptor = [self.model playerAtRow:indexPath.row];
    
    //Create the cell
    static NSString* CELL_ID =  @"CELL_PLAYER_ID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID ];
    }
    
    //Setup the cell
    cell.textLabel.text = playerDescriptor.name;
    //cell.imageView.image = note.photo.image;
    
    NSDateFormatter * fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    //cell.detailTextLabel.text = [ NSString stringWithFormat:@"%@",[fmt stringFromDate:note.modificationDate]];
    
    return cell;
}


#pragma mark - AddPlayer
-(void) addPlayer:(id)sender{
    [self.model addPlayerWithName:@"Select a name: 0" number:0 ];
    [self.tableView reloadData];
}


#pragma mark - Table view delegate

// didSelectRowAtIndexPath
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLMKPlayerDescriptor *playerDescriptor = [self.model playerAtRow:indexPath.row];
    DLMKPlayerDescriptorTableViewController *playerVC = [[DLMKPlayerDescriptorTableViewController alloc] initWithPlayerDescriptor:playerDescriptor];
    
    // Push the view controller.
    [self.navigationController pushViewController:playerVC animated:YES];
}


@end










