// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKTeamDescriptor.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKTeamDescriptorAttributes {
	__unsafe_unretained NSString *name;
} DLMKTeamDescriptorAttributes;

extern const struct DLMKTeamDescriptorRelationships {
	__unsafe_unretained NSString *players;
	__unsafe_unretained NSString *teamStats;
} DLMKTeamDescriptorRelationships;

@class DLMKPlayerDescriptor;
@class DLMKTeamStats;

@interface DLMKTeamDescriptorID : NSManagedObjectID {}
@end

@interface _DLMKTeamDescriptor : DLMKBaseManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DLMKTeamDescriptorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *players;

- (NSMutableSet*)playersSet;

@property (nonatomic, strong) NSSet *teamStats;

- (NSMutableSet*)teamStatsSet;

@end

@interface _DLMKTeamDescriptor (PlayersCoreDataGeneratedAccessors)
- (void)addPlayers:(NSSet*)value_;
- (void)removePlayers:(NSSet*)value_;
- (void)addPlayersObject:(DLMKPlayerDescriptor*)value_;
- (void)removePlayersObject:(DLMKPlayerDescriptor*)value_;

@end

@interface _DLMKTeamDescriptor (TeamStatsCoreDataGeneratedAccessors)
- (void)addTeamStats:(NSSet*)value_;
- (void)removeTeamStats:(NSSet*)value_;
- (void)addTeamStatsObject:(DLMKTeamStats*)value_;
- (void)removeTeamStatsObject:(DLMKTeamStats*)value_;

@end

@interface _DLMKTeamDescriptor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitivePlayers;
- (void)setPrimitivePlayers:(NSMutableSet*)value;

- (NSMutableSet*)primitiveTeamStats;
- (void)setPrimitiveTeamStats:(NSMutableSet*)value;

@end
