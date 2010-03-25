//
//  IGFilesystemIO.m
//  iPinchMedia
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGFilesystemIO.h"


@implementation IGFilesystemIO

+ (BOOL)isFolder:(NSString *)path {
	BOOL isDir;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if ([fileManager fileExistsAtPath:path isDirectory:&isDir] && isDir) return YES;
	else return NO;
}

+ (BOOL)isFile:(NSString *)path {
	BOOL isDir;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if ([fileManager fileExistsAtPath:path isDirectory:&isDir]) {
		if (isDir) return NO;
		else return YES;
	}
	else return NO;
}

+ (NSString *)getContentsOfFile:(NSString *)filePath {
	NSError *error;
	return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
}

+ (NSDictionary *)getFileAttributes:(NSString *)path {
	NSFileManager *manager = [NSFileManager defaultManager];
	NSDictionary *fileAttributes = [manager fileAttributesAtPath:path traverseLink:false];
	return fileAttributes;
}

+ (NSArray *)getListAll:(NSString *)path {
	NSMutableArray *fileArray = [[[NSMutableArray alloc] init] autorelease];
	NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *fileList = [manager directoryContentsAtPath:path];
	for (NSString *file in fileList){
        if (![file isEqualToString:@"~"]) [fileArray addObject:file];
	}
	return fileArray;
}

// TODO: list files only
+ (NSArray *)getListFiles:(NSString *)path {
	NSMutableArray *fileArray = [[[NSMutableArray alloc] init] autorelease];
	NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *fileList = [manager directoryContentsAtPath:path];
	for (NSString *file in fileList){
        if (![file isEqualToString:@"~"] ) [fileArray addObject:file];
	}
	return fileArray;
}

// TODO: list folders only
+ (NSArray *)getListFolders:(NSString *)path {
	NSMutableArray *fileArray = [[[NSMutableArray alloc] init] autorelease];
	NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *fileList = [manager directoryContentsAtPath:path];
	for (NSString *file in fileList){
        if (![file isEqualToString:@"~"]) [fileArray addObject:file];
	}
	return fileArray;
}

+ (int)getFileSize:(NSString *)path {
	NSDictionary *fileAttributes = [self getFileAttributes:path];
	int ret = [[fileAttributes objectForKey:NSFileSize] intValue];
	return ret;
}

+ (NSString *)getFileExtension:(NSString *)path {
	NSString *ret = [path pathExtension];
	return ret;
}

+ (NSString *)getFormatedFileSize:(NSString *)path {
	int fileSize = [self getFileSize:path];
	NSString *extension;
	NSString *formatedFileSize;
	float ff;
	if (fileSize < 1024) {
		formatedFileSize = [NSString stringWithFormat:@"%d", fileSize];
		extension = @"bytes";
	}
	else if (fileSize < 1048576) {
		ff = fileSize / 1024;
		formatedFileSize = [NSString stringWithFormat:@"%.2f", ff];
		extension = @"Kb";
	}
	else {
		ff = fileSize / 1048576;
		formatedFileSize = [NSString stringWithFormat:@"%.2f", ff];
		extension = @"Mb";
	}
	return [NSString stringWithFormat:@"%@ %@", formatedFileSize, extension];
}

+ (NSDate *)getFileCreated:(NSString *)path {
	NSDictionary *fileAttributes = [self getFileAttributes:path];
	return [fileAttributes objectForKey:NSFileCreationDate];
}

+ (void)makeFolderPath:(NSString *)path {
	if (![self isFolder:path]) {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		[fileManager createDirectoryAtPath:path attributes:nil];
	}
}

+ (BOOL)deleteFile:(NSString *)path {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	return [fileManager removeItemAtPath:path error:nil];
}

+ (void)deleteFilesOlderThan:(NSDate *)date inDirectory:(NSString *)dir {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *contents = [fileManager directoryContentsAtPath:dir];
	NSDictionary *currentFileAttributes;
	NSDate *currentFileDate;
	NSString *path;
	for (NSString *fname in contents) {
		path = [NSString stringWithFormat:@"%@%@", dir, fname];
		currentFileAttributes = [fileManager fileAttributesAtPath:path traverseLink:YES];
		currentFileDate = [currentFileAttributes objectForKey:NSFileModificationDate];
		if([currentFileDate compare:date] == NSOrderedAscending) [self deleteFile:path];
	}
}



@end
