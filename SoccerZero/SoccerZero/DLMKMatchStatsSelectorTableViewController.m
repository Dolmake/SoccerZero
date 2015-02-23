//
//  DLMKMatchStatsSelectorTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 23/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMatchStatsSelectorTableViewController.h"
#import "DLMKModelServer.h"
#import "DLMKMatchStats.h"
#import "DLMKTeamStats.h"
#import "DLMKMatchViewController.h"

@interface DLMKMatchStatsSelectorTableViewController ()

@end

@implementation DLMKMatchStatsSelectorTableViewController

-(NSString*) CELL_ID{ return @"CELL_ID_MATCHES";}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL_ID_MATCHES"];
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.matchesModel = [[ DLMKModelServer SINGLETON ] fetchMatches ];
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

    return [self.matchesModel count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the proper team
    DLMKMatchStats* matchStats = [self.matchesModel objectAtIndex:indexPath.row];
    
    //Build the Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self CELL_ID] forIndexPath:indexPath];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[self CELL_ID]];
    }
    
    //Configure the Cell
    cell.textLabel.text = [NSString stringWithFormat:@"%@:%@", matchStats.localTeamStats.name,matchStats.visitantTeamStats.name ];
    cell.detailTextLabel.text = @"Ready for the Match!!!!";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;

}




#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLMKMatchViewController *matchVC = [[DLMKMatchViewController alloc] initWithMatch:self.matchesModel[indexPath.row] ];
    [self.navigationController pushViewController:matchVC animated:YES];
}



@end
