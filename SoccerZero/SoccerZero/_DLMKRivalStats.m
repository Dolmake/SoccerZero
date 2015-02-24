// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKRivalStats.m instead.

#import "_DLMKRivalStats.h"

const struct DLMKRivalStatsAttributes DLMKRivalStatsAttributes = {
	.goals = @"goals",
	.name = @"name",
};

const struct DLMKRivalStatsRelationships DLMKRivalStatsRelationships = {
	.matchStats = @"matchStats",
};

@implementation DLMKRivalStatsID
@end

@implementation _DLMKRivalStats

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RivalStats" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RivalStats";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RivalStats" inManagedObjectContext:moc_];
}

- (DLMKRivalStatsID*)objectID {
	return (DLMKRivalStatsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"goalsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"goals"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic goals;

- (int16_t)goalsValue {
	NSNumber *result = [self goals];
	return [result shortValue];
}

- (void)setGoalsValue:(int16_t)value_ {
	[self setGoals:@(value_)];
}

- (int16_t)primitiveGoalsValue {
	NSNumber *result = [self primitiveGoals];
	return [result shortValue];
}

- (void)setPrimitiveGoalsValue:(int16_t)value_ {
	[self setPrimitiveGoals:@(value_)];
}

@dynamic name;

@dynamic matchStats;

@end

