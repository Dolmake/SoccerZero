#import "DLMKTeamDescriptor.h"
#import "DLMKPlayerDescriptor.h"

@interface DLMKTeamDescriptor ()

// Private interface goes here.

@end

@implementation DLMKTeamDescriptor

// Custom logic goes here.

#pragma mark - Class methods

+(instancetype) teamDescriptorWithName:(NSString*) aName context:(NSManagedObjectContext*) aContext{
    return [self teamDescriptorWithName:aName players:nil context:aContext];
}

+(instancetype) teamDescriptorWithName:(NSString*) aName players:(NSArray*)players context:(NSManagedObjectContext*) aContext{
    
    DLMKTeamDescriptor *teamDescriptor = [self insertInManagedObjectContext:aContext];
    teamDescriptor.name = aName;
    teamDescriptor.players = nil;
    if (players)
        teamDescriptor.players = [NSSet setWithArray:players];
    
    
    return nil;
}

#pragma mark - Instance methods

-(void) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber{
    
    DLMKPlayerDescriptor *playerDescriptor = [DLMKPlayerDescriptor playerDescriptorWithName:name number:aNumber teamDescriptor:self context:[self managedObjectContext] ];
    
    [self addPlayersObject:playerDescriptor];
}

-(NSUInteger) countPlayers{
    return [self.players count];
}





@end
