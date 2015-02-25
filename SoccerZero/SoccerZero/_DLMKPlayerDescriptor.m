// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKPlayerDescriptor.m instead.

#import "_DLMKPlayerDescriptor.h"

const struct DLMKPlayerDescriptorAttributes DLMKPlayerDescriptorAttributes = {
	.name = @"name",
	.number = @"number",
};

const struct DLMKPlayerDescriptorRelationships DLMKPlayerDescriptorRelationships = {
	.photoContainer = @"photoContainer",
	.playerStats = @"playerStats",
	.teamDescriptor = @"teamDescriptor",
};

@implementation DLMKPlayerDescriptorID
@end

@implementation _DLMKPlayerDescriptor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PlayerDescriptor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PlayerDescriptor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PlayerDescriptor" inManagedObjectContext:moc_];
}

- (DLMKPlayerDescriptorID*)objectID {
	return (DLMKPlayerDescriptorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"numberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"number"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic name;

@dynamic number;

- (int16_t)numberValue {
	NSNumber *result = [self number];
	return [result shortValue];
}

- (void)setNumberValue:(int16_t)value_ {
	[self setNumber:@(value_)];
}

- (int16_t)primitiveNumberValue {
	NSNumber *result = [self primitiveNumber];
	return [result shortValue];
}

- (void)setPrimitiveNumberValue:(int16_t)value_ {
	[self setPrimitiveNumber:@(value_)];
}

@dynamic photoContainer;

@dynamic playerStats;

- (NSMutableSet*)playerStatsSet {
	[self willAccessValueForKey:@"playerStats"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"playerStats"];

	[self didAccessValueForKey:@"playerStats"];
	return result;
}

@dynamic teamDescriptor;

@end

