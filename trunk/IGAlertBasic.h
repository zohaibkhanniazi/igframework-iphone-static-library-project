//
//  IGAlertBasic.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 26.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface IGAlertBasic : UIAlertView {

}

+ (void)showPopup:(NSString *)title withText:(NSString *)text;

@end
