//
//  DLMKModel.m
//  SoccerZero
//
//  Created by Daniel on 16/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKModelServer.h"
#import "AGTCoreDataStack.h"
#import "SETTINGS.h"
#import "DLMKTeamDescriptor.h"

#ifdef DUMMY_DATA

    #import "DLMKPlayerDescriptor.h"

#endif



@implementation DLMKModelServer


static DLMKModelServer* s_instance;

+(instancetype) SINGLETON{
    if (!s_instance)
        s_instance = [[DLMKModelServer alloc] init];
    return s_instance;
}


-(id) init{
    
    if (self = [super init]){
        
        _stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
#ifdef DUMMY_DATA
        [self createDummyData];
        [self workWithData];
#endif
        
    }
    return self;
}





#pragma mark - Instance methods

-(DLMKTeamDescriptor*) firstTeam{
    
    DLMKTeamDescriptor* result = nil;
    
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKTeamDescriptor entityName]];
    
    req.fetchBatchSize = 1;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:NO]
                            ];
    
    //req.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", allies ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        result = [res firstObject];
    }
    
    return result;    

}

#ifdef DUMMY_DATA
-(void) createDummyData{
    
    DLMKTeamDescriptor* teamDescriptor = [DLMKTeamDescriptor teamDescriptorWithName:@"NewTeam" context:[self.stack context]];
    
    for(int i =0 ; i < 10;++i){
        [teamDescriptor addPlayerWithName:@"Unnamed" number:i];
    }
    
    
}

-(void) workWithData{
    
    
    //Search for Teams
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKTeamDescriptor entityName]];
    
    req.fetchBatchSize = 20;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:DLMKTeamDescriptorAttributes.name ascending:NO]
                            ];
    
    //req.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", allies ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        NSLog(@"Teams count %lu", (unsigned long) [res count]);
        NSLog(@"Teams: %@", res);
        
        NSLog(@"Class Type: %@", [res class]);
    }
    
    /*
    //Delete a note
    [self.stack.context deleteObject:allies];//Delete a notebook
    req.predicate = nil;
    res = [self.stack.context executeFetchRequest:req error:&err];
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        NSLog(@"Notebooks: %@", res);
    }
    
    
    //Save data
    [self.stack saveWithErrorBlock:^(NSError* error){
        NSLog(@"Error on save: %@", error);
    }];
     */
}





#endif


@end




















