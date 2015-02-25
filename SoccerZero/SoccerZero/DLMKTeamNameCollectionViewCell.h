//
//  DLMKTeamNameCollectionViewCell.h
//  SoccerZero
//
//  Created by Daniel on 25/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKTeamDescriptor;

@interface DLMKTeamNameCollectionViewCell : UICollectionViewCell
+(CGFloat)height;
+(NSString*)cellId;
+(CGSize)cellSize;

@property(weak,nonatomic) IBOutlet UITextField* txNameField;
@property (strong,nonatomic) DLMKTeamDescriptor* teamDescriptorModel;

-(IBAction)didFinishTexting:(id)sender;

@end
