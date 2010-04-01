//
//  IGCacheVariables.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 25.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IGCacheVariables : NSObject {

}

/*
 
 # constructor Cache_Lite::Cache_Lite
 # Cache_Lite::get
 # Cache_Lite::save
 # Cache_Lite::remove
 # Cache_Lite::clean
 # Cache_Lite::setToDebug
 # Cache_Lite::setLifeTime
 # Cache_Lite::saveMemoryCachingState
 # Cache_Lite::getMemoryCachingState
 # Cache_Lite::lastModified
 # Cache_Lite::raiseError
 # Cache_Lite::extendLife
 # constructor Cache_Lite_Output::Cache_Lite_Output
 # Cache_Lite_Output::start
 # Cache_Lite_Output::end
 # constructor Cache_Lite_Function::Cache_Lite_Function
 # Cache_Lite_Function::call
 # Cache_Lite_Function::drop
 # constructor Cache_Lite_File::Cache_Lite_File
 # Cache_Lite_File::get
 
 */

+ (void)deleteCacheFiles;

+ (void)deleteCacheFilesOlderThan:(NSDate *)date;

@end
