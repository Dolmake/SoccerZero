//
//  DLMKTeamsTableViewController.h
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;


@interface DLMKTeamsTableViewController : UITableViewController

@property (nonatomic, strong) NSArray* teamsModels;

-(id) initWithTeamsArray: (NSArray*) teams;

@end
