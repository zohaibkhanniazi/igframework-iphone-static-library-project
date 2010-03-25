//
//  IGFrameworkProjectAppDelegate.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright Home 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IGFrameworkProjectAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

