//
//  IGCacheVariables.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 25.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGCacheVariables.h"
#import "IGFilesystemIO.h"
#import "IGFilesystemPaths.h"


@implementation IGCacheVariables


+ (void)deleteCacheFiles {
	[IGFilesystemIO deleteFile:[IGFilesystemPaths getCacheDirectoryPath]];
}

+ (void)deleteCacheFilesOlderThan:(NSDate *)date {
	[IGFilesystemIO deleteFilesOlderThan:date inDirectory:[IGFilesystemPaths getCacheDirectoryPath]];
}


@end
