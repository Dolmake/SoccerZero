//
//  DLMKTimeServer.h
//  SoccerZero
//
//  Created by Daniel on 30/01/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;

@interface DLMKTimeServer : NSObject

@property (nonatomic) NSArray* observers;
@property (nonatomic) NSUInteger frames;

+(instancetype) SINGLETON;

@property (nonatomic) double deltaTime;

-(void) addObserver:(NSObject*) observer;
-(void) removeObserver:(NSObject*) observer;

@end
