//
//  DLMKAppearenceServer.m
//  SoccerZero
//
//  Created by Daniel on 02/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKAppearenceServer.h"
@import UIKit;

@implementation DLMKAppearenceServer


static DLMKAppearenceServer* s_instance;

+(instancetype) SINGLETON{
    if (!s_instance)
        s_instance = [[DLMKAppearenceServer alloc] init];
    return s_instance;
}

#pragma mark - Init

-(id) init{
    if (self = [super init]){
        [self initAppearence];
    }
    return self;
}

#pragma mark - Misc
-(void) initAppearence{
    
    
    [[UINavigationBar appearance] setTintColor:[UIColor lightGrayColor] ];
    //[[UINavigationBar appearance] setBackgroundColor:[UIColor blackColor] ];
    
    //[[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance]setBarTintColor:[UIColor blackColor ] ];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bar_256x128.png"] forBarMetrics:UIBarMetricsDefault ];
    //[[UINavigationBar appearance] setTranslucent:NO ];
    //[[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]} ];
    //[NSForegroundColorAttributeName: UIColor.orangeColor()]
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end
