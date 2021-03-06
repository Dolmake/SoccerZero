//
//  DLMKTeamCollectionViewCell.h
//  SoccerZero
//
//  Created by Daniel on 25/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamDescriptor;
@protocol DLMKOnTakePhotoDelegate;


@interface DLMKEditTeamCollectionViewCell : UICollectionViewCell

+(CGFloat)height;
+(NSString*)cellId;
+(CGSize)cellSize;

@property(weak,nonatomic) IBOutlet UILabel* lbTeamName;
@property(weak,nonatomic) IBOutlet UIImageView* imgShield;
@property(weak, nonatomic) id<DLMKOnTakePhotoDelegate> delegate;

@property (strong,nonatomic) DLMKTeamDescriptor* teamDescriptorModel;

-(IBAction)takePhoto:(id)sender;



@end
