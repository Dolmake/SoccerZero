//
//  DLMKPlayerDescriptorTableViewController.h
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerDescriptor;
@protocol  LCNumberInputDelegate;

@interface DLMKEditPlayerDescriptorTableViewController : UITableViewController<LCNumberInputDelegate>

@property (nonatomic, strong) DLMKPlayerDescriptor* playerDescriptorModel;

-(id) initWithPlayerDescriptor: (DLMKPlayerDescriptor*) playerDescriptor;

@end
