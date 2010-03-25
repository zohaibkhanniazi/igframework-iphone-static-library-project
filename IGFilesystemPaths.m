//
//  IGFilesystemPaths.m
//  iPinchMedia
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGFilesystemPaths.h"
#import "IGConfiguration.h"
#import "IGFilesystemIO.h"


@implementation IGFilesystemPaths

+ (NSString *)getDocumentsDirectoryPath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths objectAtIndex:0];
}


+ (NSString *)getRootDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getDocumentsDirectoryPath], kIGFilesystemPathsFolder];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getTempDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"temp"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getConfigDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"config"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getCacheDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"cache"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getImagesDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"images"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getFilesDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"files"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getSystemDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"system"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getDatabaseDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"database"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getSQLiteDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"sqlite"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getSQLiteFilePath:(NSString *)databaseName {
	return [NSString stringWithFormat:@"%@%@.sqlite", [self getSQLiteDirectoryPath], databaseName];
}

+ (NSString *)getIGTableViewDbDirectoryPath {
	NSString *p = [NSString stringWithFormat:@"%@/%@/", [self getRootDirectoryPath], @"igtableview"];
	[IGFilesystemIO makeFolderPath:p];
	return p;
}

+ (NSString *)getIGTableViewDbFilePath:(NSString *)databaseName {
	return [NSString stringWithFormat:@"%@%@.igtw", [self getIGTableViewDbDirectoryPath], databaseName];
}


@end
