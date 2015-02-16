// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKTeamDescriptor.m instead.

#import "_DLMKTeamDescriptor.h"

const struct DLMKTeamDescriptorAttributes DLMKTeamDescriptorAttributes = {
	.name = @"name",
};

const struct DLMKTeamDescriptorRelationships DLMKTeamDescriptorRelationships = {
	.players = @"players",
};

@implementation DLMKTeamDescriptorID
@end

@implementation _DLMKTeamDescriptor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TeamDescriptor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TeamDescriptor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TeamDescriptor" inManagedObjectContext:moc_];
}

- (DLMKTeamDescriptorID*)objectID {
	return (DLMKTeamDescriptorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic players;

- (NSMutableSet*)playersSet {
	[self willAccessValueForKey:@"players"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"players"];

	[self didAccessValueForKey:@"players"];
	return result;
}

@end

