//
//  AMOApplication.m
//  AMOUITestApplication
//
//  Created by amo on 2014/12/14.
//  Copyright (c) 2014年 amo. All rights reserved.
//

#import "AMOApplication.h"
#import <objc/objc-runtime.h>

@implementation AMOApplication

- (void)_sendButtonEventWithType:(int)arg1 phase:(int)arg2 timestamp:(double)arg3
{
    NSLog(@"%s[BEFORE]: type = %d, phase = %d, timestamp = %f", __FUNCTION__, arg1, arg2, arg3);
    ((void (*)(int, int, double))objc_msgSendSuper)(arg1, arg2, arg3);
    NSLog(@"%s[AFTER]: type = %d, phase = %d, timestamp = %f", __FUNCTION__, arg1, arg2, arg3);
}

@end
