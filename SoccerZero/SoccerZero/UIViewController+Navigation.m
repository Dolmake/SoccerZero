//
//  UIViewController+Navigation.m
//  EverPoor
//
//  Created by Daniel on 04/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController*) dlmkWrappedInNavigation{
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:self animated:NO];
    return nav;
}

@end
