//
//  DLMKTeamDescriptorCollectionViewController.h
//  SoccerZero
//
//  Created by Daniel on 24/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@import Foundation;
@class DLMKTeamDescriptor;

@interface DLMKTeamDescriptorCollectionViewController : UICollectionViewController

@property (nonatomic,strong) DLMKTeamDescriptor* teamDescriptorModel;

@end
