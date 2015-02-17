//
//  DLMKTeamTableViewController.h
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamDescriptor;

@interface DLMKTeamDescriptorTableViewController : UITableViewController

@property (weak, nonatomic) DLMKTeamDescriptor* model;

-(id) initWithTeamModel:(DLMKTeamDescriptor*)model;

@end
