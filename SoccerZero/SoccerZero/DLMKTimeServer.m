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

CADisplayLink* displayLink;
double frameTimestamp;


-(id) init{
    if(self = [super init]){
        _frames = 0;
        _deltaTime = 0;
        [self setupDisplayLink];
    }
    return self;
}


- (void)setupDisplayLink {
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}


-(void) update:(id)sender{
    self.frames = self.frames + 1;
    //NSLog(@"TimeServer: Frames %lu, DeltaTime %f" , (unsigned long)self.frames, deltaTime);
    double currentTime = [displayLink timestamp];
    self.deltaTime = currentTime - frameTimestamp;
    frameTimestamp = currentTime;
}

@end
