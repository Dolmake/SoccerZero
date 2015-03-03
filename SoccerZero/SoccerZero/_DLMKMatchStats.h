// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKMatchStats.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKMatchStatsAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *seconds_first_half;
	__unsafe_unretained NSString *seconds_second_half;
} DLMKMatchStatsAttributes;

extern const struct DLMKMatchStatsRelationships {
	__unsafe_unretained NSString *rivalStats;
	__unsafe_unretained NSString *teamStats;
} DLMKMatchStatsRelationships;

@class DLMKRivalStats;
@class DLMKTeamStats;

@interface DLMKMatchStatsID : NSManagedObjectID {}
@end

@interface _DLMKMatchStats : DLMKBaseManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DLMKMatchStatsID* objectID;

@property (nonatomic, strong) NSDate* date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* seconds_first_half;

@property (atomic) int32_t seconds_first_halfValue;
- (int32_t)seconds_first_halfValue;
- (void)setSeconds_first_halfValue:(int32_t)value_;

//- (BOOL)validateSeconds_first_half:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* seconds_second_half;

@property (atomic) int32_t seconds_second_halfValue;
- (int32_t)seconds_second_halfValue;
- (void)setSeconds_second_halfValue:(int32_t)value_;

//- (BOOL)validateSeconds_second_half:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DLMKRivalStats *rivalStats;

//- (BOOL)validateRivalStats:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DLMKTeamStats *teamStats;

//- (BOOL)validateTeamStats:(id*)value_ error:(NSError**)error_;

@end

@interface _DLMKMatchStats (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSNumber*)primitiveSeconds_first_half;
- (void)setPrimitiveSeconds_first_half:(NSNumber*)value;

- (int32_t)primitiveSeconds_first_halfValue;
- (void)setPrimitiveSeconds_first_halfValue:(int32_t)value_;

- (NSNumber*)primitiveSeconds_second_half;
- (void)setPrimitiveSeconds_second_half:(NSNumber*)value;

- (int32_t)primitiveSeconds_second_halfValue;
- (void)setPrimitiveSeconds_second_halfValue:(int32_t)value_;

- (DLMKRivalStats*)primitiveRivalStats;
- (void)setPrimitiveRivalStats:(DLMKRivalStats*)value;

- (DLMKTeamStats*)primitiveTeamStats;
- (void)setPrimitiveTeamStats:(DLMKTeamStats*)value;

@end
