//
//  SETTINGS.h
//  EverPoor
//
//  Created by Daniel on 10/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

//MOGENERATOR syntax:
// mogenerator -v2 --model Model.xcdatamodeld/model.xcdatamodel/ --base-class DLMKBaseManagedObject

#define DLMK_DEBUG
///#define DLMK_RELEASE

#ifdef DLMK_DEBUG

    #define COREDATA_MODEL_NAME @"Model"
    #define AUTO_SAVE YES
    #define AUTO_SAVE_DELAY 60
    //#define DUMMY_DATA YES
    #define DLMK_LOG

#endif

#ifdef DLMK_RELEASE

    #define COREDATA_MODEL_NAME @"Model"
    #define AUTO_SAVE YES
    #define AUTO_SAVE_DELAY 300
    //#define DUMMY_DATA YES
    //#define DLMK_LOG

#endif
