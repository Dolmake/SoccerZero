// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKPhotoContainer.m instead.

#import "_DLMKPhotoContainer.h"

const struct DLMKPhotoContainerAttributes DLMKPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct DLMKPhotoContainerRelationships DLMKPhotoContainerRelationships = {
	.playerDescriptor = @"playerDescriptor",
};

@implementation DLMKPhotoContainerID
@end

@implementation _DLMKPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (DLMKPhotoContainerID*)objectID {
	return (DLMKPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic playerDescriptor;

@end

