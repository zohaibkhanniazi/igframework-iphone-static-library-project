//
//  IGCacheImages.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 1.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGCacheImages.h"
#import <UIKit/UIKit.h>
#import "IGFilesystem.h"
#import "IGImagesTools.h"
#import "IGText.h"


@implementation IGCacheImages

/**
 Returns unique path for the image based on the url of the image
 
 @param imageUrlString NSString Url of the image
 */
+ (NSString *)getCachedImagePath:(NSString *)imageUrlString {
	NSString *filename = [IGText getSafeText:imageUrlString];
   return [[IGFilesystemPaths getCacheDirectoryPath] stringByAppendingPathComponent: filename];
}

/**
 Downloads the image if it's not already cached
 
 @param imageUrlString NSString Url of the image
 @param corners int Rounded corners radius
 
 @todo Think about storing images only in the png format as it might be better for rounded corners functionality (jpeg has no transparency)
 */
- (void)cacheImage:(NSString *)imageUrlString withRoundCorners:(int)corners {
    NSURL *imageURL = [NSURL URLWithString: imageUrlString];
	NSString *path = [IGCacheImages getCachedImagePath:imageUrlString];
	UIImage *image;
    if(![IGFilesystemIO isFile:path]) {
		NSData *data = [[NSData alloc] initWithContentsOfURL:imageURL];
		image = [[UIImage alloc] initWithData:data];
        if (corners > 0) image = [IGImagesTools roundCorners:image withRadius:corners];
        if([imageUrlString rangeOfString: @".png" options: NSCaseInsensitiveSearch].location != NSNotFound) {
            [UIImagePNGRepresentation(image) writeToFile: path atomically: YES];
        }
        else if([imageUrlString rangeOfString: @".jpg" options: NSCaseInsensitiveSearch].location != NSNotFound || [imageUrlString rangeOfString: @".jpeg" options: NSCaseInsensitiveSearch].location != NSNotFound) {
            [UIImageJPEGRepresentation(image, 90) writeToFile: path atomically: YES];
        }
    }
}

/**
 Returns NSString for a specific key in initiated file
 
 @param imageUrlString NSString Url of the image
 @param corners int Rounded corners radius
 
 @return NSString Object
 */
- (UIImage *)getCachedImage:(NSString *)imageUrlString withRoundCorners:(int)corners {
	NSString *path = [IGCacheImages getCachedImagePath:imageUrlString];
	UIImage *image;
    if([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        image = [UIImage imageWithContentsOfFile:path]; // this is the cached image
    }
    else {
        [self cacheImage:imageUrlString withRoundCorners:corners];
        image = [UIImage imageWithContentsOfFile:path];
    }
    return image;
}


@end
