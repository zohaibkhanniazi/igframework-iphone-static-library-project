///
///  IGCacheVariables.h
///
///  IGFrameworkProject
///
///  Created by Ondrej Rafaj on 25.3.10.
///
///  Copyright 2010 Home. All rights reserved.
///

#import <Foundation/Foundation.h>
#import "IGCacheImages.h"

@interface IGCache : NSObject {

}

+ (void)deleteCacheFiles;

+ (void)deleteCacheFilesOlderThan:(NSDate *)date;

@end
