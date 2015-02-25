//
//  DLMKTeamNameCollectionViewCell.m
//  SoccerZero
//
//  Created by Daniel on 25/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTeamNameCollectionViewCell.h"
#import "DLMKTeamDescriptor.h"

@implementation DLMKTeamNameCollectionViewCell

#pragma mark - Class Methods
+(CGFloat)height{
    return 175.0f;
}
+(NSString*)cellId{
    return [self description];
}
+(CGSize)cellSize{
    //return CGSizeMake(175.0f, 175.0f);
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return CGSizeMake(screenRect.size.width,30.f);
}

#pragma mark - Properties

-(void) setTeamDescriptorModel:(DLMKTeamDescriptor *)teamDescriptorModel{
    _teamDescriptorModel = teamDescriptorModel;
    self.txNameField.text = _teamDescriptorModel.name;
}


- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - Action
-(IBAction)didFinishTexting:(id)sender{
    self.teamDescriptorModel.name = self.txNameField.text;
}

@end
