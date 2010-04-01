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


@implementation IGCacheImages

- (void)cacheImage:(NSString *)imageUrlString withRoundCorners:(int)corners {
    NSURL *ImageURL = [NSURL URLWithString: imageUrlString];
    
    // Generate a unique path to a resource representing the image you want
    NSString *filename = @"aaaaa"; // [[something unique, perhaps the image name]]
    NSString *path = [[IGFilesystemPaths getCacheDirectoryPath] stringByAppendingPathComponent: filename];
	
	UIImage *image;
	
    // Check for file existence
    if(![IGFilesystemIO isFile:path]) {
        // The file doesn't exist, we should get a copy of it
		
        // Fetch image
        NSData *data = [[NSData alloc] initWithContentsOfURL: ImageURL];
        image = [[UIImage alloc] initWithData: data];
        
        // Do we want to round the corners?
        if (corners > 0) image = [self roundCorners: image];
        
        // Is it PNG or JPG/JPEG?
        // Running the image representation function writes the data from the image to a file
        if([imageUrlString rangeOfString: @".png" options: NSCaseInsensitiveSearch].location != NSNotFound) {
            [UIImagePNGRepresentation(image) writeToFile: path atomically: YES];
        }
        else if([imageUrlString rangeOfString: @".jpg" options: NSCaseInsensitiveSearch].location != NSNotFound || [imageUrlString rangeOfString: @".jpeg" options: NSCaseInsensitiveSearch].location != NSNotFound) {
            [UIImageJPEGRepresentation(image, 90) writeToFile: path atomically: YES];
        }
    }
}

- (UIImage *)getCachedImage:(NSString *)imageUrlString withRoundCorners:(int)corners {
	NSString *filename = @"aaaaa"; // [[something unique, perhaps the image name]]
    NSString *path = [[IGFilesystemPaths getCacheDirectoryPath] stringByAppendingPathComponent:filename];
	
    UIImage *image;
    
    // Check for a cached version
    if([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        image = [UIImage imageWithContentsOfFile:path]; // this is the cached image
    }
    else {
        // get a new one
        [self cacheImage:imageUrlString withRoundCorners:corners];
        image = [UIImage imageWithContentsOfFile:path];
    }
	
    return image;
}

- (UIImage *)roundCorners:(UIImage *)img {
	return [IGImagesTools roundCorners:img];
}


@end
