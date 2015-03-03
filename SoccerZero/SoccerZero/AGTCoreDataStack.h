//
//  AGTCoreDataStack.h
//
//  Created by Fernando Rodríguez Romero on 1/24/13.
//  Copyright (c) 2013 Agbo. All rights reserved.
//

@import Foundation;
@class NSManagedObjectContext;
@class NSFetchRequest;

@interface AGTCoreDataStack : NSObject

@property (strong, nonatomic, readonly) NSManagedObjectContext *context;
@property (nonatomic) BOOL hasContext;

+(NSString *) persistentStoreCoordinatorErrorNotificationName;

+(AGTCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName
                               databaseFilename:(NSString*) aDBName;

+(AGTCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName;

+(AGTCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName
                                    databaseURL:(NSURL*) aDBURL;

-(id) initWithModelName:(NSString *)aModelName
            databaseURL:(NSURL*) aDBURL;

-(void) zapAllData;

-(void) saveWithErrorBlock: (void(^)(NSError *error))errorBlock;

-(NSArray*) executeSearchWithRequest:(NSFetchRequest*)req
                           errorBlock:(void(^)(NSError *error))errorBlock;

@end
