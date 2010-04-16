///
///  IGAccelAutorotation.h
///
///  IGFrameworkProject
///
///  Created by Ondrej Rafaj on 24.3.10.
///
///  Copyright 2010 Home. All rights reserved.
///

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IGAccelAutorotation : NSObject {

}

+ (BOOL)allowPortrait:(UIInterfaceOrientation)io;
+ (BOOL)allowPortraitLeft:(UIInterfaceOrientation)io;
+ (BOOL)allowPortraitRight:(UIInterfaceOrientation)io;
+ (BOOL)allowPortraitLeftRight:(UIInterfaceOrientation)io;
+ (BOOL)allowAll:(UIInterfaceOrientation)io;

+ (UIInterfaceOrientation)getCurrentOrientation;


@end
