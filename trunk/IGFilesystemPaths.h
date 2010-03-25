//
//  IGFilesystemPaths.h
//  iPinchMedia
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IGFilesystemPaths : NSObject {

}

+ (NSString *)getDocumentsDirectoryPath;

+ (NSString *)getRootDirectoryPath;

+ (NSString *)getTempDirectoryPath;

+ (NSString *)getConfigDirectoryPath;

+ (NSString *)getCacheDirectoryPath;

+ (NSString *)getImagesDirectoryPath;

+ (NSString *)getFilesDirectoryPath;

+ (NSString *)getSystemDirectoryPath;

+ (NSString *)getDatabaseDirectoryPath;

+ (NSString *)getSQLiteDirectoryPath;

+ (NSString *)getSQLiteFilePath:(NSString *)databaseName;

+ (NSString *)getIGTableViewDbDirectoryPath;

+ (NSString *)getIGTableViewDbFilePath:(NSString *)databaseName;





@end
