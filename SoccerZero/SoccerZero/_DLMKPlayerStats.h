// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKPlayerStats.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKPlayerStatsAttributes {
	__unsafe_unretained NSString *assistances;
	__unsafe_unretained NSString *errors;
	__unsafe_unretained NSString *faults_done;
	__unsafe_unretained NSString *faults_received;
	__unsafe_unretained NSString *goals;
	__unsafe_unretained NSString *is_playing;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *number;
	__unsafe_unretained NSString *seconds_played;
	__unsafe_unretained NSString *shots;
} DLMKPlayerStatsAttributes;

extern const struct DLMKPlayerStatsRelationships {
	__unsafe_unretained NSString *playerDescriptor;
	__unsafe_unretained NSString *teamStats;
} DLMKPlayerStatsRelationships;

@class DLMKPlayerDescriptor;
@class DLMKTeamStats;

@interface DLMKPlayerStatsID : NSManagedObjectID {}
@end

@interface _DLMKPlayerStats : DLMKBaseManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DLMKPlayerStatsID* objectID;

@property (nonatomic, strong) NSNumber* assistances;

@property (atomic) int32_t assistancesValue;
- (int32_t)assistancesValue;
- (void)setAssistancesValue:(int32_t)value_;

//- (BOOL)validateAssistances:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* errors;

@property (atomic) int32_t errorsValue;
- (int32_t)errorsValue;
- (void)setErrorsValue:(int32_t)value_;

//- (BOOL)validateErrors:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* faults_done;

@property (atomic) int32_t faults_doneValue;
- (int32_t)faults_doneValue;
- (void)setFaults_doneValue:(int32_t)value_;

//- (BOOL)validateFaults_done:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* faults_received;

@property (atomic) int32_t faults_receivedValue;
- (int32_t)faults_receivedValue;
- (void)setFaults_receivedValue:(int32_t)value_;

//- (BOOL)validateFaults_received:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* goals;

@property (atomic) int32_t goalsValue;
- (int32_t)goalsValue;
- (void)setGoalsValue:(int32_t)value_;

//- (BOOL)validateGoals:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* is_playing;

@property (atomic) BOOL is_playingValue;
- (BOOL)is_playingValue;
- (void)setIs_playingValue:(BOOL)value_;

//- (BOOL)validateIs_playing:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* notes;

//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* number;

@property (atomic) int16_t numberValue;
- (int16_t)numberValue;
- (void)setNumberValue:(int16_t)value_;

//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* seconds_played;

@property (atomic) int32_t seconds_playedValue;
- (int32_t)seconds_playedValue;
- (void)setSeconds_playedValue:(int32_t)value_;

//- (BOOL)validateSeconds_played:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* shots;

@property (atomic) int32_t shotsValue;
- (int32_t)shotsValue;
- (void)setShotsValue:(int32_t)value_;

//- (BOOL)validateShots:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DLMKPlayerDescriptor *playerDescriptor;

//- (BOOL)validatePlayerDescriptor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DLMKTeamStats *teamStats;

//- (BOOL)validateTeamStats:(id*)value_ error:(NSError**)error_;

@end

@interface _DLMKPlayerStats (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAssistances;
- (void)setPrimitiveAssistances:(NSNumber*)value;

- (int32_t)primitiveAssistancesValue;
- (void)setPrimitiveAssistancesValue:(int32_t)value_;

- (NSNumber*)primitiveErrors;
- (void)setPrimitiveErrors:(NSNumber*)value;

- (int32_t)primitiveErrorsValue;
- (void)setPrimitiveErrorsValue:(int32_t)value_;

- (NSNumber*)primitiveFaults_done;
- (void)setPrimitiveFaults_done:(NSNumber*)value;

- (int32_t)primitiveFaults_doneValue;
- (void)setPrimitiveFaults_doneValue:(int32_t)value_;

- (NSNumber*)primitiveFaults_received;
- (void)setPrimitiveFaults_received:(NSNumber*)value;

- (int32_t)primitiveFaults_receivedValue;
- (void)setPrimitiveFaults_receivedValue:(int32_t)value_;

- (NSNumber*)primitiveGoals;
- (void)setPrimitiveGoals:(NSNumber*)value;

- (int32_t)primitiveGoalsValue;
- (void)setPrimitiveGoalsValue:(int32_t)value_;

- (NSNumber*)primitiveIs_playing;
- (void)setPrimitiveIs_playing:(NSNumber*)value;

- (BOOL)primitiveIs_playingValue;
- (void)setPrimitiveIs_playingValue:(BOOL)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveNotes;
- (void)setPrimitiveNotes:(NSString*)value;

- (NSNumber*)primitiveNumber;
- (void)setPrimitiveNumber:(NSNumber*)value;

- (int16_t)primitiveNumberValue;
- (void)setPrimitiveNumberValue:(int16_t)value_;

- (NSNumber*)primitiveSeconds_played;
- (void)setPrimitiveSeconds_played:(NSNumber*)value;

- (int32_t)primitiveSeconds_playedValue;
- (void)setPrimitiveSeconds_playedValue:(int32_t)value_;

- (NSNumber*)primitiveShots;
- (void)setPrimitiveShots:(NSNumber*)value;

- (int32_t)primitiveShotsValue;
- (void)setPrimitiveShotsValue:(int32_t)value_;

- (DLMKPlayerDescriptor*)primitivePlayerDescriptor;
- (void)setPrimitivePlayerDescriptor:(DLMKPlayerDescriptor*)value;

- (DLMKTeamStats*)primitiveTeamStats;
- (void)setPrimitiveTeamStats:(DLMKTeamStats*)value;

@end
