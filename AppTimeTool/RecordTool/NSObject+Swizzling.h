//
//  NSObject+Swizzling.h
//  guixueapp
//
//  Created by guixue0001 on 16/5/4.
//  Copyright © 2016年 秦智博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;

@end
