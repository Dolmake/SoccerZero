//
//  DLMKTeamDescriptorViewController.h
//  SoccerZero
//
//  Created by Daniel on 25/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamDescriptor;
@protocol DLMKOnTakePhotoDelegate;

@interface DLMKEditTeamDescriptorViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, DLMKOnTakePhotoDelegate>

@property (weak,nonatomic) IBOutlet UICollectionView* collectionView;
@property (weak,nonatomic) IBOutlet UITextField* txtName;
@property (strong,nonatomic) DLMKTeamDescriptor* teamDescriptorModel;

-(IBAction)onTouchUp:(id)sender;
-(IBAction)didTxtNameChanged:(id)sender;
-(void)onTakePhoto:(id)sender;
@end
