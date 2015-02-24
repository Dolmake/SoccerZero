//
//  DLMKMatchStatsSelectorTableViewController.h
//  SoccerZero
//
//  Created by Daniel on 23/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamDescriptor;

@interface DLMKMatchStatsSelectorTableViewController : UITableViewController

@property (nonatomic, strong) DLMKTeamDescriptor* teamDescriptorModel;


-(void) addMatch:(id) sender;

@end
