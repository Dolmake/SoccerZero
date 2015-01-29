//
//  DLMKTeamTableViewController.h
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamModel;

@interface DLMKTeamTableViewController : UITableViewController

@property (weak, nonatomic) DLMKTeamModel* teamModel;

-(id) initWithTeamModel:(DLMKTeamModel*)model;

@end
