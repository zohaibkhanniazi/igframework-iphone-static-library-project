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

+ (void)deleteCacheFiles;

+ (void)deleteCacheFilesOlderThan:(NSDate *)date;

@end
