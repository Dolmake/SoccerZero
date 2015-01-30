//
//  DLMKTimeServer.m
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTimeServer.h"
#import <QuartzCore/QuartzCore.h>

@implementation DLMKTimeServer

static DLMKTimeServer* s_instance;

+(instancetype) SINGLETON{
    if (!s_instance)
        s_instance = [[DLMKTimeServer alloc] init];
    return s_instance;
}

-(id) init{
    if(self = [super init]){
        _frames = 0;
        [self setupDisplayLink];
    }
    return self;
}

-(void) render:(id)sender{
    self.frames = self.frames + 1;
    NSLog(@"TimeServer: Frames %lu" , (unsigned long)self.frames);
}

- (void)setupDisplayLink {
    CADisplayLink* displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(render:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

@end
