//
//  SETTINGS.h
//  EverPoor
//
//  Created by Daniel on 10/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

//MOGENERATOR syntax:
// mogenerator -v2 --model Model.xcdatamodeld/model.xcdatamodel/ --base-class DLMKBaseManagedObject

#define DEBUG
///#define RELEASE

#ifdef DEBUG

    #define COREDATA_MODEL_NAME @"Model"
    #define AUTO_SAVE YES
    #define AUTO_SAVE_DELAY 60
    //#define DUMMY_DATA YES
    #define DLMK_LOG

#endif

#ifdef RELEASE

    #define COREDATA_MODEL_NAME @"Model"
    #define AUTO_SAVE YES
    #define AUTO_SAVE_DELAY 60
    //#define DUMMY_DATA YES
    //#define DLMK_LOG

#endif
