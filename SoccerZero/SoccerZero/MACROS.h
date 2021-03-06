//
//  MACROS.h
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@import CoreGraphics;

#import "SETTINGS.h"

#define NSStringize_helper(x) #x
#define NSStringize(x) @NSStringize_helper(x)


#define APP_NAME [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
#define APP_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define OPEN_URL(urlString) [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]]

// Retrieving preference values
#define PREF_KEY_VALUE(x) [[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:(x)]
#define PREF_KEY_BOOL(x) [(PREF_KEY_VALUE(x)) boolValue]
#define PREF_SET_KEY_VALUE(x, y) [[[NSUserDefaultsController sharedUserDefaultsController] values] setValue:(y) forKey:(x)]
#define PREF_OBSERVE_VALUE(x, y) [[NSUserDefaultsController sharedUserDefaultsController] addObserver:y forKeyPath:x options:NSKeyValueObservingOptionOld context:nil];

/* key, observer, object */
#define OB_OBSERVE_VALUE(x, y, z) [(z) addObserver:y forKeyPath:x options:NSKeyValueObservingOptionOld context:nil];

#ifdef __OBJC__
static inline BOOL isEmpty(id thing) {
    return thing == nil
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

static inline CGSize maxPhotoSize(int maxSize, CGFloat width, CGFloat height){
    //CGFloat aspect = width / height;
    CGFloat newheight = height > maxSize ? maxSize : height;
    CGFloat newwidth = width > maxSize ? maxSize : width;
    CGFloat scaleByHeight = newheight / height;
    CGFloat scaleByWidth = newwidth / width;
    CGFloat minScale = MIN(scaleByHeight, scaleByWidth);
    return CGSizeMake(width * minScale, height * minScale);
}

#endif

#ifdef DLMK_LOG
#define __DLMK_NSLOG_DESCRIPTION__ NSLog([NSString stringWithString:[self description]]);
#else
#define __DLMK_NSLOG_DESCRIPTION__
#endif

