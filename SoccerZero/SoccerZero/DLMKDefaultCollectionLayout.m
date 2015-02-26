//
//  DLMKPlayersDescriptorLayout.m
//  SoccerZero
//
//  Created by Daniel on 25/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKDefaultCollectionLayout.h"

@implementation DLMKDefaultCollectionLayout

-(id) init
{
    if (self = [super init]){
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.itemSize =  CGSizeMake(44,44);
        self.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        //self.headerReferenceSize = CGSizeMake(200, 30);
        _backGroundColor = [UIColor greenColor];

    }
    return self;
}


 @end
