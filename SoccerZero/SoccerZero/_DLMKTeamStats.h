// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKTeamStats.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKTeamStatsAttributes {
	__unsafe_unretained NSString *isLocal;
	__unsafe_unretained NSString *name;
} DLMKTeamStatsAttributes;

extern const struct DLMKTeamStatsRelationships {
	__unsafe_unretained NSString *matchStats;
	__unsafe_unretained NSString *playersStats;
	__unsafe_unretained NSString *teamDescriptor;
} DLMKTeamStatsRelationships;

@class DLMKMatchStats;
@class DLMKPlayerStats;
@class DLMKTeamDescriptor;

@interface DLMKTeamStatsID : NSManagedObjectID {}
@end

@interface _DLMKTeamStats : DLMKBaseManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DLMKTeamStatsID* objectID;

@property (nonatomic, strong) NSNumber* isLocal;

@property (atomic) BOOL isLocalValue;
- (BOOL)isLocalValue;
- (void)setIsLocalValue:(BOOL)value_;

//- (BOOL)validateIsLocal:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DLMKMatchStats *matchStats;

//- (BOOL)validateMatchStats:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *playersStats;

- (NSMutableSet*)playersStatsSet;

@property (nonatomic, strong) DLMKTeamDescriptor *teamDescriptor;

//- (BOOL)validateTeamDescriptor:(id*)value_ error:(NSError**)error_;

@end

@interface _DLMKTeamStats (PlayersStatsCoreDataGeneratedAccessors)
- (void)addPlayersStats:(NSSet*)value_;
- (void)removePlayersStats:(NSSet*)value_;
- (void)addPlayersStatsObject:(DLMKPlayerStats*)value_;
- (void)removePlayersStatsObject:(DLMKPlayerStats*)value_;

@end

@interface _DLMKTeamStats (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveIsLocal;
- (void)setPrimitiveIsLocal:(NSNumber*)value;

- (BOOL)primitiveIsLocalValue;
- (void)setPrimitiveIsLocalValue:(BOOL)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (DLMKMatchStats*)primitiveMatchStats;
- (void)setPrimitiveMatchStats:(DLMKMatchStats*)value;

- (NSMutableSet*)primitivePlayersStats;
- (void)setPrimitivePlayersStats:(NSMutableSet*)value;

- (DLMKTeamDescriptor*)primitiveTeamDescriptor;
- (void)setPrimitiveTeamDescriptor:(DLMKTeamDescriptor*)value;

@end
