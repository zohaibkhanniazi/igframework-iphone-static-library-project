///
///  IGCacheImages.h
///
///  IGFrameworkProject
///
///  Created by Ondrej Rafaj on 1.4.10.
///
///  Copyright 2010 Home. All rights reserved.
///  @todo Create function for caching AND resizing with rounded corners


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IGCacheImages : NSObject {

}

+ (NSString *)getCachedImagePath:(NSString *)imageUrlString;

- (void)cacheImage:(NSString *)imageUrlString withRoundCorners:(int)corners;

- (UIImage *)getCachedImage:(NSString *)imageUrlString withRoundCorners:(int)corners;


@end
