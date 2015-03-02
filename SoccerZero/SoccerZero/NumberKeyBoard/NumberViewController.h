//
//  ViewController.h
//  LCPickerViewSample
//
//  Created by Leo Chang on 10/21/13.
//  Copyright (c) 2013 MountainStar Inc. All rights reserved.
//

@import UIKit;

@interface NumberViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *resultLabel;

- (IBAction)show:(id)sender;

- (IBAction)showFloat:(id)sender;

@end
