#import "DLMKTeamDescriptor.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKModelServer.h"
#import "DLMKPhotoContainer.h"

@interface DLMKTeamDescriptor ()

// Private interface goes here.

@end

@implementation DLMKTeamDescriptor

// Custom logic goes here.

#pragma mark - Class methods

+(instancetype) teamDescriptorWithName:(NSString*) aName photo:(UIImage*)aPhoto context:(NSManagedObjectContext*) aContext{
    DLMKTeamDescriptor *teamDescriptor = [self insertInManagedObjectContext:aContext];
    teamDescriptor.name = aName;
    teamDescriptor.players = [NSSet setWithArray:@[]];
    teamDescriptor.photoContainer = [DLMKPhotoContainer photoContainerWithPhoto:aPhoto context:aContext ];

    return teamDescriptor;
}


#pragma mark - Instance methods


-(DLMKPlayerDescriptor*) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber{
    return [self addPlayerWithName:name number:aNumber photo:nil];
    
}
-(DLMKPlayerDescriptor*) addPlayerWithName:(NSString*)name number:(NSUInteger)aNumber photo:(UIImage*)aPhoto{
    
    DLMKPlayerDescriptor *playerDescriptor = [DLMKPlayerDescriptor playerDescriptorWithName:name number:aNumber photo:aPhoto teamDescriptor:self context:[self managedObjectContext] ];
    
    [self addPlayersObject:playerDescriptor];
    return playerDescriptor;
}

-(void) removePlayer:(DLMKPlayerDescriptor*)player{
    [self removePlayersObject:player];
}

-(NSUInteger) countPlayers{
    return [self.players count];
}

-(DLMKPlayerDescriptor*) playerAtRow:(NSInteger) row{

    NSArray* players = [[self.players allObjects] sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {

        NSInteger diff = ((DLMKPlayerDescriptor*)a).numberValue - ((DLMKPlayerDescriptor*)b).numberValue;
        return (NSComparisonResult)diff;
        
    } ];
    return players[row];
}


-(NSArray*) winningMatches{
    return [[DLMKModelServer SINGLETON] fetchWonMatchesForTeamDescriptor:self];
}
-(NSArray*) lossingMatches{
       return [[DLMKModelServer SINGLETON] fetchLostMatchesForTeamDescriptor:self];
}
-(NSArray*) tieMatches{
    return [[DLMKModelServer SINGLETON] fetchTieMatchesForTeamDescriptor:self];

}








@end
