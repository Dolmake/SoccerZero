//
//  DLMKMatchViewController.h
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;


@interface DLMKMatchViewController : UIViewController

@property (weak, nonatomic) IBOutlet id lbTime;
@property (weak, nonatomic) IBOutlet id lbResult;

-(IBAction)onStartTimer:(id)sender;

@end
