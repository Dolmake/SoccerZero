// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKRivalStats.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKRivalStatsAttributes {
	__unsafe_unretained NSString *goals;
	__unsafe_unretained NSString *name;
} DLMKRivalStatsAttributes;

extern const struct DLMKRivalStatsRelationships {
	__unsafe_unretained NSString *matchStats;
} DLMKRivalStatsRelationships;

@class DLMKMatchStats;

@interface DLMKRivalStatsID : NSManagedObjectID {}
@end

@interface _DLMKRivalStats : DLMKBaseManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DLMKRivalStatsID* objectID;

@property (nonatomic, strong) NSNumber* goals;

@property (atomic) int16_t goalsValue;
- (int16_t)goalsValue;
- (void)setGoalsValue:(int16_t)value_;

//- (BOOL)validateGoals:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DLMKMatchStats *matchStats;

//- (BOOL)validateMatchStats:(id*)value_ error:(NSError**)error_;

@end

@interface _DLMKRivalStats (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveGoals;
- (void)setPrimitiveGoals:(NSNumber*)value;

- (int16_t)primitiveGoalsValue;
- (void)setPrimitiveGoalsValue:(int16_t)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (DLMKMatchStats*)primitiveMatchStats;
- (void)setPrimitiveMatchStats:(DLMKMatchStats*)value;

@end
