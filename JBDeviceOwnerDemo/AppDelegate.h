//
//  AppDelegate.h
//  JBDeviceOwnerDemo
//
//  Created by Steven Choi on 12-5-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OwnerInfoViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OwnerInfoViewController *viewController;

@end
