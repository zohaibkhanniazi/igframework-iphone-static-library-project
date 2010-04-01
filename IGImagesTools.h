//
//  UIImagesTools.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 1.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface IGImagesTools : NSObject {

}

+ (UIImage *)resizeImage:(UIImage *)myImage toWidth:(int)width andHeight:(int)height;

+ (UIImage *)roundCorners:(UIImage*)img;

@end
