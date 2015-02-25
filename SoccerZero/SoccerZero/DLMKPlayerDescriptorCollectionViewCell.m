//
//  DLMKPlayerDescriptorCollectionViewCell.m
//  SoccerZero
//
//  Created by Daniel on 24/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerDescriptorCollectionViewCell.h"

@implementation DLMKPlayerDescriptorCollectionViewCell

#pragma mark - Class Methods
+(CGFloat)height{
    return 175.0f;
}
+(NSString*)cellId{
    return [self description];
}
+(CGSize)cellSize{
    return CGSizeMake(175.0f, 175.0f);
}

- (void)awakeFromNib {
    // Initialization code
}

@end
