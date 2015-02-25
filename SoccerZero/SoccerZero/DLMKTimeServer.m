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

+(NSString*) formatTime:(NSUInteger)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}

+(NSString*) formatTimeShort:(NSUInteger)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d",minutes, seconds];
}

CADisplayLink* displayLink;
double frameTimestamp;

#pragma mark - Init
-(id) init{
    if(self = [super init]){
        _frames = 0;
        _deltaTime = 0;
        _observers = [[NSMutableArray alloc] initWithCapacity:10 ];
        [self setupDisplayLink];
    }
    return self;
}

#pragma mark- Public

-(void) addObserver:(NSObject*) observer{
    
    if (![self.observers containsObject:observer])
        [(NSMutableArray*)self.observers addObject:observer ];
    
}
-(void) removeObserver:(NSObject*) observer{
    [(NSMutableArray*)self.observers removeObject:observer];
    
}

#pragma mark - Misc

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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATION_UPDATE" object:nil ];
    for (int i= 0; i < self.observers.count; ++i) {
        
        [self.observers[i] update:self];
    }
}

@end
