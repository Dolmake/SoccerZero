// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKPlayerStats.m instead.

#import "_DLMKPlayerStats.h"

const struct DLMKPlayerStatsAttributes DLMKPlayerStatsAttributes = {
	.assistances = @"assistances",
	.errors = @"errors",
	.faults_done = @"faults_done",
	.faults_received = @"faults_received",
	.goals = @"goals",
	.name = @"name",
	.notes = @"notes",
	.number = @"number",
	.seconds_played = @"seconds_played",
	.shots = @"shots",
};

const struct DLMKPlayerStatsRelationships DLMKPlayerStatsRelationships = {
	.teamMatch = @"teamMatch",
};

@implementation DLMKPlayerStatsID
@end

@implementation _DLMKPlayerStats

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PlayerStats" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PlayerStats";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PlayerStats" inManagedObjectContext:moc_];
}

- (DLMKPlayerStatsID*)objectID {
	return (DLMKPlayerStatsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"assistancesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"assistances"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"errorsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"errors"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"faults_doneValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"faults_done"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"faults_receivedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"faults_received"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"goalsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"goals"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"numberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"number"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"seconds_playedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"seconds_played"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"shotsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"shots"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic assistances;

- (int32_t)assistancesValue {
	NSNumber *result = [self assistances];
	return [result intValue];
}

- (void)setAssistancesValue:(int32_t)value_ {
	[self setAssistances:@(value_)];
}

- (int32_t)primitiveAssistancesValue {
	NSNumber *result = [self primitiveAssistances];
	return [result intValue];
}

- (void)setPrimitiveAssistancesValue:(int32_t)value_ {
	[self setPrimitiveAssistances:@(value_)];
}

@dynamic errors;

- (int32_t)errorsValue {
	NSNumber *result = [self errors];
	return [result intValue];
}

- (void)setErrorsValue:(int32_t)value_ {
	[self setErrors:@(value_)];
}

- (int32_t)primitiveErrorsValue {
	NSNumber *result = [self primitiveErrors];
	return [result intValue];
}

- (void)setPrimitiveErrorsValue:(int32_t)value_ {
	[self setPrimitiveErrors:@(value_)];
}

@dynamic faults_done;

- (int32_t)faults_doneValue {
	NSNumber *result = [self faults_done];
	return [result intValue];
}

- (void)setFaults_doneValue:(int32_t)value_ {
	[self setFaults_done:@(value_)];
}

- (int32_t)primitiveFaults_doneValue {
	NSNumber *result = [self primitiveFaults_done];
	return [result intValue];
}

- (void)setPrimitiveFaults_doneValue:(int32_t)value_ {
	[self setPrimitiveFaults_done:@(value_)];
}

@dynamic faults_received;

- (int32_t)faults_receivedValue {
	NSNumber *result = [self faults_received];
	return [result intValue];
}

- (void)setFaults_receivedValue:(int32_t)value_ {
	[self setFaults_received:@(value_)];
}

- (int32_t)primitiveFaults_receivedValue {
	NSNumber *result = [self primitiveFaults_received];
	return [result intValue];
}

- (void)setPrimitiveFaults_receivedValue:(int32_t)value_ {
	[self setPrimitiveFaults_received:@(value_)];
}

@dynamic goals;

- (int32_t)goalsValue {
	NSNumber *result = [self goals];
	return [result intValue];
}

- (void)setGoalsValue:(int32_t)value_ {
	[self setGoals:@(value_)];
}

- (int32_t)primitiveGoalsValue {
	NSNumber *result = [self primitiveGoals];
	return [result intValue];
}

- (void)setPrimitiveGoalsValue:(int32_t)value_ {
	[self setPrimitiveGoals:@(value_)];
}

@dynamic name;

@dynamic notes;

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

@dynamic shots;

- (int32_t)shotsValue {
	NSNumber *result = [self shots];
	return [result intValue];
}

- (void)setShotsValue:(int32_t)value_ {
	[self setShots:@(value_)];
}

- (int32_t)primitiveShotsValue {
	NSNumber *result = [self primitiveShots];
	return [result intValue];
}

- (void)setPrimitiveShotsValue:(int32_t)value_ {
	[self setPrimitiveShots:@(value_)];
}

@dynamic teamMatch;

@end

