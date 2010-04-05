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

@class IGCacheImages;

@protocol IGCacheImagesDelegate <NSObject>

@optional

- (void)loadingComplete:(UIImage *)object;

- (void)loadingError:(NSString *)message;

@end

@interface IGCacheImages : NSObject {
	
	id <IGCacheImagesDelegate> delegate;
	
}

@property (nonatomic, assign) id <IGCacheImagesDelegate> delegate;

+ (NSString *)getCachedImagePath:(NSString *)imageUrlString;

- (void)cacheImage:(NSString *)imageUrlString withRoundCorners:(int)corners;

- (UIImage *)getCachedImage:(NSString *)imageUrlString withRoundCorners:(int)corners;


@end
