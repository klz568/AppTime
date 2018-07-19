//
//  UIViewController+Record.m
//  guixueapp
//
//  Created by guixue0001 on 16/8/22.
//  Copyright © 2016年 klz. All rights reserved.
//

#import "UIViewController+Record.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Record)
@dynamic catoryStartTime;
@dynamic catoryEndTime;
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self class] swizzleSelector:@selector(viewDidAppear:)
                 withSwizzledSelector:@selector(klz_timeViewDidAppear:)];
        
        [[self class] swizzleSelector:@selector(viewDidDisappear:) withSwizzledSelector:@selector(klz_timeViewDidDisappear:)];
        
    });
}

- (void)klz_timeViewDidAppear:(BOOL)animated
{
    if (![self isKindOfClass:[UINavigationController class]]) {
        self.catoryStartTime = [[NSDate date] timeIntervalSince1970] * 1000;
        [self klz_timeViewDidAppear:animated];
    }
    
}

- (void)klz_timeViewDidDisappear:(BOOL)animated
{
    if (![self isKindOfClass:[UINavigationController class]]) {
        self.catoryEndTime = [[NSDate date] timeIntervalSince1970] * 1000;
        const char *name = class_getName([self class]);
        NSLog(@"allTime____%f,%s",self.catoryEndTime - self.catoryStartTime,name);
        [self klz_timeViewDidDisappear:animated];
    }
}



@end
