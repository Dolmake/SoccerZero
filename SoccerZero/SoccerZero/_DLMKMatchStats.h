// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKMatchStats.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKMatchStatsAttributes {
	__unsafe_unretained NSString *date;
} DLMKMatchStatsAttributes;

extern const struct DLMKMatchStatsRelationships {
	__unsafe_unretained NSString *teamsStats;
} DLMKMatchStatsRelationships;

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

@property (nonatomic, strong) NSSet *teamsStats;

- (NSMutableSet*)teamsStatsSet;

@end

@interface _DLMKMatchStats (TeamsStatsCoreDataGeneratedAccessors)
- (void)addTeamsStats:(NSSet*)value_;
- (void)removeTeamsStats:(NSSet*)value_;
- (void)addTeamsStatsObject:(DLMKTeamStats*)value_;
- (void)removeTeamsStatsObject:(DLMKTeamStats*)value_;

@end

@interface _DLMKMatchStats (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSMutableSet*)primitiveTeamsStats;
- (void)setPrimitiveTeamsStats:(NSMutableSet*)value;

@end
