// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKPhotoContainer.h instead.

@import CoreData;
#import "DLMKBaseManagedObject.h"

extern const struct DLMKPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} DLMKPhotoContainerAttributes;

extern const struct DLMKPhotoContainerRelationships {
	__unsafe_unretained NSString *playerDescriptor;
} DLMKPhotoContainerRelationships;

@class DLMKPlayerDescriptor;

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

@end

@interface _DLMKPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (DLMKPlayerDescriptor*)primitivePlayerDescriptor;
- (void)setPrimitivePlayerDescriptor:(DLMKPlayerDescriptor*)value;

@end
