//
//  IGCacheVariables.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 25.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGCache.h"
#import "IGFilesystemIO.h"
#import "IGFilesystemPaths.h"


@implementation IGCache


/**
 Deletes all cached file for the app
 */
+ (void)deleteCacheFiles {
	[IGFilesystemIO deleteFile:[IGFilesystemPaths getCacheDirectoryPath]];
}

/**
 Deletes all cached file for the app that are older that specified date
 
 @param date NSDate Limit date
 */
+ (void)deleteCacheFilesOlderThan:(NSDate *)date {
	[IGFilesystemIO deleteFilesOlderThan:date inDirectory:[IGFilesystemPaths getCacheDirectoryPath]];
}


@end
