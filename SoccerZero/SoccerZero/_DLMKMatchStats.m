// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKMatchStats.m instead.

#import "_DLMKMatchStats.h"

const struct DLMKMatchStatsAttributes DLMKMatchStatsAttributes = {
	.date = @"date",
};

const struct DLMKMatchStatsRelationships DLMKMatchStatsRelationships = {
	.teamsStats = @"teamsStats",
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

	return keyPaths;
}

@dynamic date;

@dynamic teamsStats;

- (NSMutableSet*)teamsStatsSet {
	[self willAccessValueForKey:@"teamsStats"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"teamsStats"];

	[self didAccessValueForKey:@"teamsStats"];
	return result;
}

@end

