// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKPhotoContainer.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} DLMKPhotoContainerAttributes;

extern const struct DLMKPhotoContainerRelationships {
	__unsafe_unretained NSString *playerDescriptor;
	__unsafe_unretained NSString *teamDescriptor;
} DLMKPhotoContainerRelationships;

@class DLMKPlayerDescriptor;
@class DLMKTeamDescriptor;

@interface DLMKPhotoContainerID : NSManagedObjectID {}
@end

@interface _DLMKPhotoContainer : DLMKBaseManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DLMKPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DLMKPlayerDescriptor *playerDescriptor;

//- (BOOL)validatePlayerDescriptor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DLMKTeamDescriptor *teamDescriptor;

//- (BOOL)validateTeamDescriptor:(id*)value_ error:(NSError**)error_;

@end

@interface _DLMKPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (DLMKPlayerDescriptor*)primitivePlayerDescriptor;
- (void)setPrimitivePlayerDescriptor:(DLMKPlayerDescriptor*)value;

- (DLMKTeamDescriptor*)primitiveTeamDescriptor;
- (void)setPrimitiveTeamDescriptor:(DLMKTeamDescriptor*)value;

@end
