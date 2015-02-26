//
//  DLMKTeamDescriptorViewController.h
//  SoccerZero
//
//  Created by Daniel on 25/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamDescriptor;

@interface DLMKEditTeamDescriptorViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate>

@property (weak,nonatomic) IBOutlet UICollectionView* collectionView;
@property (weak,nonatomic) IBOutlet UITextField* txtName;
@property (strong,nonatomic) DLMKTeamDescriptor* teamDescriptorModel;

-(IBAction)onTouchUp:(id)sender;
-(IBAction)didTxtNameChanged:(id)sender;


@end
