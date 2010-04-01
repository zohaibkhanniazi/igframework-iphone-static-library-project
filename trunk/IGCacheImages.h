//
//  IGCacheImages.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 1.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IGCacheImages : NSObject {

}

- (void)cacheImage:(NSString *)imageUrlString withRoundCorners:(int)corners;

- (UIImage *)getCachedImage:(NSString *)ImageURLString;

- (UIImage *)roundCorners:(UIImage*)img;


@end
