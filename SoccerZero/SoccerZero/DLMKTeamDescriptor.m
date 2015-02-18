#import "DLMKTeamDescriptor.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKModelServer.h"

@interface DLMKTeamDescriptor ()

// Private interface goes here.

@end

@implementation DLMKTeamDescriptor

// Custom logic goes here.

#pragma mark - Class methods

+(instancetype) teamDescriptorWithName:(NSString*) aName context:(NSManagedObjectContext*) aContext{
    DLMKTeamDescriptor *teamDescriptor = [self insertInManagedObjectContext:aContext];
    teamDescriptor.name = aName;
    teamDescriptor.players = [NSSet setWithArray:@[]];
    return teamDescriptor;
}


#pragma mark - Instance methods

-(void) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber{
    
    DLMKPlayerDescriptor *playerDescriptor = [DLMKPlayerDescriptor playerDescriptorWithName:name number:aNumber teamDescriptor:self context:[self managedObjectContext] ];
    
    [self addPlayersObject:playerDescriptor];
}

-(NSUInteger) countPlayers{
    return [self.players count];
}

-(DLMKPlayerDescriptor*) playerAtRow:(NSInteger) row{

    //  WTF!!!: Why is not working
//    NSArray* players = [[self.players allObjects] sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
//
//        NSInteger diff = ((DLMKPlayerDescriptor*)a).numberValue - ((DLMKPlayerDescriptor*)b).numberValue;
//        return (NSComparisonResult)diff;
//        
//    } ];
//    return players[row];
    
    NSArray* allPlayers = [[DLMKModelServer SINGLETON] fetchPlayersForTeam:self ];
    return allPlayers[row];
}







@end
