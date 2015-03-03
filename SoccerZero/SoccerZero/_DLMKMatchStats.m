// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKMatchStats.m instead.

#import "_DLMKMatchStats.h"

const struct DLMKMatchStatsAttributes DLMKMatchStatsAttributes = {
	.date = @"date",
	.seconds_first_half = @"seconds_first_half",
	.seconds_second_half = @"seconds_second_half",
};

const struct DLMKMatchStatsRelationships DLMKMatchStatsRelationships = {
	.rivalStats = @"rivalStats",
	.teamStats = @"teamStats",
};

@implementation DLMKMatchStatsID
@end

@implementation _DLMKMatchStats

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MatchStats" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MatchStats";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MatchStats" inManagedObjectContext:moc_];
}

- (DLMKMatchStatsID*)objectID {
	return (DLMKMatchStatsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"seconds_first_halfValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"seconds_first_half"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"seconds_second_halfValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"seconds_second_half"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic date;

@dynamic seconds_first_half;

- (int32_t)seconds_first_halfValue {
	NSNumber *result = [self seconds_first_half];
	return [result intValue];
}

- (void)setSeconds_first_halfValue:(int32_t)value_ {
	[self setSeconds_first_half:@(value_)];
}

- (int32_t)primitiveSeconds_first_halfValue {
	NSNumber *result = [self primitiveSeconds_first_half];
	return [result intValue];
}

- (void)setPrimitiveSeconds_first_halfValue:(int32_t)value_ {
	[self setPrimitiveSeconds_first_half:@(value_)];
}

@dynamic seconds_second_half;

- (int32_t)seconds_second_halfValue {
	NSNumber *result = [self seconds_second_half];
	return [result intValue];
}

- (void)setSeconds_second_halfValue:(int32_t)value_ {
	[self setSeconds_second_half:@(value_)];
}

- (int32_t)primitiveSeconds_second_halfValue {
	NSNumber *result = [self primitiveSeconds_second_half];
	return [result intValue];
}

- (void)setPrimitiveSeconds_second_halfValue:(int32_t)value_ {
	[self setPrimitiveSeconds_second_half:@(value_)];
}

@dynamic rivalStats;

@dynamic teamStats;

@end

