//
//  DLMKPlayerDescriptorCollectionViewCell.h
//  SoccerZero
//
//  Created by Daniel on 24/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKPlayerDescriptor;
@protocol DLMKOnTakePhotoDelegate;

@interface DLMKPlayerDescriptorCollectionViewCell : UICollectionViewCell

+(CGFloat)height;
+(NSString*)cellId;
+(CGSize)cellSize;

@property (weak, nonatomic) IBOutlet UILabel* lbName;
@property (weak, nonatomic) IBOutlet UILabel* lbNumber;
@property (weak, nonatomic) IBOutlet UILabel* lbGoals;
@property (weak, nonatomic) IBOutlet UILabel* lbMistakes;
@property (weak, nonatomic) IBOutlet UIImageView* imgPhoto;
@property (strong, nonatomic) id<DLMKOnTakePhotoDelegate> delegate;

-(IBAction)takePhoto:(id)sender;

@property (strong,nonatomic) DLMKPlayerDescriptor* playerDescriptorModel;

@end
