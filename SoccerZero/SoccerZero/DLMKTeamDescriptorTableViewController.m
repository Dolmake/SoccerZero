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
#import "DLMKTeamNameTableViewCell.h"
#import "DLMKTimeServer.h"
#import "DLMKPlayerDescriptorTableViewController.h"
#import "DLMKModelServer.h"

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
    
      //Add the "addButton"
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    self.title = self.model.name;
    
    //Register the proper cells
    [self registerNib:[DLMKTeamNameTableViewCell class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
     if (section == 0)//Team name
        return 1;
     if (section > 0)//Players
        return [self.model countPlayers];
     else return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = nil;
    if (indexPath.section == 0)//Team Name
    {
        //Create the Team cell
        cell = [self buildCell:[DLMKTeamNameTableViewCell class] tableView:tableView];
    }
    else//Players
    {
        DLMKPlayerDescriptor *playerDescriptor = [self.model playerAtRow:indexPath.row];
        //Create the cell
        static NSString* CELL_ID =  @"CELL_PLAYER_ID";
        cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
        if (!cell)
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID ];
        
        cell.textLabel.text = playerDescriptor.name;
    }
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
    
    //If player is selected....
    if (indexPath.section == 1)
    {
        DLMKPlayerDescriptor *playerDescriptor = [self.model playerAtRow:indexPath.row];
        DLMKPlayerDescriptorTableViewController *playerVC = [[DLMKPlayerDescriptorTableViewController alloc] initWithPlayerDescriptor:playerDescriptor];
    
        // Push the view controller.
        [self.navigationController pushViewController:playerVC animated:YES];
    }
}


-(NSString*) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"Remove Player?";
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Look up if the chicken wants to remove
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        DLMKPlayerDescriptor *playerDescriptor = [self.model playerAtRow:indexPath.row];

        //[[[DLMKModelServer SINGLETON] context ] deleteObject:playerDescriptor ];
        [self.model removePlayer:playerDescriptor];
        
        [self.tableView reloadData];
    }
    
}


#pragma mark -Misc
-(void) registerNib: (id)type{
    
    NSString* typeName = NSStringFromClass(type);
    //NSString* typeName =NSStringize(type);
    UINib *nameNib = [ UINib nibWithNibName:typeName bundle:[NSBundle mainBundle] ];
    
    NSString* reusableId = [type performSelector:@selector(cellId)];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:reusableId];
}

-(UITableViewCell*) buildCell:(id)cellClass tableView:( UITableView*) tableView {
    
    NSString* reusableId = [cellClass performSelector:@selector(cellId)];
    UITableViewCell* result = [tableView dequeueReusableCellWithIdentifier:reusableId];
    
    [result setValue:self.model forKey:@"teamDescriptorModel"];
    
    return result;
}



@end










