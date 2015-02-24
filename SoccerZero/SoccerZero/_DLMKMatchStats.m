// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKMatchStats.m instead.

#import "_DLMKMatchStats.h"

const struct DLMKMatchStatsAttributes DLMKMatchStatsAttributes = {
	.date = @"date",
	.seconds_played = @"seconds_played",
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

	if ([key isEqualToString:@"seconds_playedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"seconds_played"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic date;

@dynamic seconds_played;

- (int32_t)seconds_playedValue {
	NSNumber *result = [self seconds_played];
	return [result intValue];
}

- (void)setSeconds_playedValue:(int32_t)value_ {
	[self setSeconds_played:@(value_)];
}

- (int32_t)primitiveSeconds_playedValue {
	NSNumber *result = [self primitiveSeconds_played];
	return [result intValue];
}

- (void)setPrimitiveSeconds_playedValue:(int32_t)value_ {
	[self setPrimitiveSeconds_played:@(value_)];
}

@dynamic rivalStats;

@dynamic teamStats;

@end

