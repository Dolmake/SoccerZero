//
//  DLMKTeamTableViewController.h
//  SoccerZero
//
//  Created by Daniel on 29/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamModel_OLD;

@interface DLMKTeamTableViewController : UITableViewController

@property (weak, nonatomic) DLMKTeamModel_OLD* teamModel;

-(id) initWithTeamModel:(DLMKTeamModel_OLD*)model;

@end
