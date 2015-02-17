//
//  DLMKMainMenuViewController.m
//  SoccerZero
//
//  Created by Daniel on 28/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMainMenuViewController.h"
#import "DLMKTeamDescriptorTableViewController.h"

#import "DLMKMatchStats.h"
#import "DLMKModelServer.h"

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBActions
-(IBAction)onPressPlay:(id)sender{
    
    NSLog(@"Play pressed");
    
    
    //Create the Table Controller
    DLMKTeamDescriptorTableViewController* teamVC = [[DLMKTeamDescriptorTableViewController alloc] initWithTeamModel:[[ DLMKModelServer SINGLETON ] firstTeam ] ];
    
    [self.navigationController pushViewController:teamVC
                                         animated:YES];
    
    
    
    /*
    //Create the Table Controller
    DLMKMatchViewController* matchVC = [[DLMKMatchViewController alloc]initWithNibName:nil bundle:nil];
    
    //TODO: create a match
    matchVC.model = nil;
    
    [self.navigationController pushViewController:matchVC
                                         animated:YES];

    */
}

-(IBAction)onPressStatistics:(id)sender{
    NSLog(@"Statistics pressed");
    
}
-(IBAction)onPressConfiguration:(id)sender{
    NSLog(@"Configuration pressed");
    
}

@end




















