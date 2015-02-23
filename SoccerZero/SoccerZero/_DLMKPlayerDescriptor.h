// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKPlayerDescriptor.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKPlayerDescriptorAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *number;
} DLMKPlayerDescriptorAttributes;

extern const struct DLMKPlayerDescriptorRelationships {
	__unsafe_unretained NSString *playerStats;
	__unsafe_unretained NSString *teamDescriptor;
} DLMKPlayerDescriptorRelationships;

@class DLMKPlayerStats;
@class DLMKTeamDescriptor;

@interface DLMKPlayerDescriptorID : NSManagedObjectID {}
@end

@interface _DLMKPlayerDescriptor : DLMKBaseManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DLMKPlayerDescriptorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* number;

@property (atomic) int16_t numberValue;
- (int16_t)numberValue;
- (void)setNumberValue:(int16_t)value_;

//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *playerStats;

- (NSMutableSet*)playerStatsSet;

@property (nonatomic, strong) DLMKTeamDescriptor *teamDescriptor;

//- (BOOL)validateTeamDescriptor:(id*)value_ error:(NSError**)error_;

@end

@interface _DLMKPlayerDescriptor (PlayerStatsCoreDataGeneratedAccessors)
- (void)addPlayerStats:(NSSet*)value_;
- (void)removePlayerStats:(NSSet*)value_;
- (void)addPlayerStatsObject:(DLMKPlayerStats*)value_;
- (void)removePlayerStatsObject:(DLMKPlayerStats*)value_;

@end

@interface _DLMKPlayerDescriptor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveNumber;
- (void)setPrimitiveNumber:(NSNumber*)value;

- (int16_t)primitiveNumberValue;
- (void)setPrimitiveNumberValue:(int16_t)value_;

- (NSMutableSet*)primitivePlayerStats;
- (void)setPrimitivePlayerStats:(NSMutableSet*)value;

- (DLMKTeamDescriptor*)primitiveTeamDescriptor;
- (void)setPrimitiveTeamDescriptor:(DLMKTeamDescriptor*)value;

@end
