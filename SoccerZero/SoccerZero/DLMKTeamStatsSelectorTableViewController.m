//
//  DLMKTeamStatsSelectorTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 21/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamStatsSelectorTableViewController.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKTeamStats.h"
#import "DLMKMatchViewController.h"

#import "DLMKModelServer.h"

@interface DLMKTeamStatsSelectorTableViewController ()

@property (nonatomic, strong) NSArray* teamsModel;

@end

@implementation DLMKTeamStatsSelectorTableViewController


NSString* CELL_ID = @"CELL_ID_TEAMS_FOR_MATCH";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_ID];
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Get all the available teams
    self.teamsModel = [[DLMKModelServer SINGLETON] fetchTeams ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.teamsModel count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the proper team
    DLMKTeamDescriptor* teamDescriptor = [self.teamsModel objectAtIndex:indexPath.row];
    
    //Build the Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID ];
    }
    
    //Configure the Cell
    cell.textLabel.text = teamDescriptor.name;
    cell.detailTextLabel.text = @"Ready for the Match!!!!";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Get the proper team
    DLMKTeamDescriptor* teamDescriptor = [self.teamsModel objectAtIndex:indexPath.row];
    
     //Create the Table Controller
    DLMKMatchViewController* matchVC = [[DLMKMatchViewController alloc]initWithTeamDescriptor:teamDescriptor];
     
     [self.navigationController pushViewController:matchVC
     animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
