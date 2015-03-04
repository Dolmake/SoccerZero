//
//  DLMKMainMenuViewController.m
//  SoccerZero
//
//  Created by Daniel on 28/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMainMenuViewController.h"
#import "DLMKTeamStatsSelectorTableViewController.h"
#import "DLMKMatchStats.h"
#import "DLMKModelServer.h"
#import "DLMKMatchStatsSelectorTableViewController.h"
#import "DLMKTeamCollectionViewController.h"

@interface DLMKMainMenuViewController ()

@end

@implementation DLMKMainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions
-(IBAction)onPressPlay:(id)sender{
    
    NSLog(@"Play pressed");
    
    /*
    DLMKMatchStatsSelectorTableViewController* matchVC = [[DLMKMatchStatsSelectorTableViewController alloc]init];
    matchVC.teamDescriptorModel = [[DLMKModelServer SINGLETON]firstTeam ];
    
    [self.navigationController pushViewController:matchVC
                                         animated:YES];
    */
    
    
    DLMKTeamStatsSelectorTableViewController* teamVC = [[DLMKTeamStatsSelectorTableViewController alloc]init];
    
        [self.navigationController pushViewController:teamVC
                                             animated:YES];
}


-(IBAction)onPressConfiguration:(id)sender{
    NSLog(@"Configuration pressed");
    
    DLMKTeamCollectionViewController* teamsVC = [[DLMKTeamCollectionViewController alloc] init];
    [self.navigationController pushViewController:teamsVC
                                         animated:YES];
    
}

@end




















