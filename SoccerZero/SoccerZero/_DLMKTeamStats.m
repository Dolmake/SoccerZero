// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKTeamStats.m instead.

#import "_DLMKTeamStats.h"

const struct DLMKTeamStatsAttributes DLMKTeamStatsAttributes = {
	.name = @"name",
};

const struct DLMKTeamStatsRelationships DLMKTeamStatsRelationships = {
	.matchStats = @"matchStats",
	.playersStats = @"playersStats",
};

@implementation DLMKTeamStatsID
@end

@implementation _DLMKTeamStats

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TeamStats" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TeamStats";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TeamStats" inManagedObjectContext:moc_];
}

- (DLMKTeamStatsID*)objectID {
	return (DLMKTeamStatsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic matchStats;

@dynamic playersStats;

- (NSMutableSet*)playersStatsSet {
	[self willAccessValueForKey:@"playersStats"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"playersStats"];

	[self didAccessValueForKey:@"playersStats"];
	return result;
}

@end

