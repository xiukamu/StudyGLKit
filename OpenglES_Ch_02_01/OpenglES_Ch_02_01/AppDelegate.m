//
//  AppDelegate.m
//  Opengles_ch_02_01
//
//  Created by 于军振 on 2020/1/20.
//  Copyright © 2020 于军振. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:vc];

    self.window.rootViewController = naVC;
    [self.window makeKeyWindow];
    return YES;
}





@end
