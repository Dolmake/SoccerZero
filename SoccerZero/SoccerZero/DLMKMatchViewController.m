//
//  DLMKMatchViewController.m
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKMatchViewController.h"
#import "DLMKTimeServer.h"

@interface DLMKMatchViewController ()

@end

@implementation DLMKMatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[DLMKTimeServer SINGLETON ] addObserver:self];
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

#pragma mark - On Start Timer
-(IBAction)onStartTimer:(id)sender{
    
}

#pragma mark - Update:(id)sender

-(void) update:(id)sender{
    UILabel* label = self.lbResult;
    label.text =  @"Frame"; //[[DLMKTimeServer SINGLETON] deltaTime ];
}

@end
