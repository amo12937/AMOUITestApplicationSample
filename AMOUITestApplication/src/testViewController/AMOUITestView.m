//
//  AMOUITestView.m
//  AMOUITestApplication
//
//  Created by amo on 2014/12/14.
//  Copyright (c) 2014年 amo. All rights reserved.
//

#import "AMOUITestView.h"

@implementation AMOUITestView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"\n%s[BEFORE]: point = %@, event = %@\n\n", __FUNCTION__, NSStringFromCGPoint(point), event);
    BOOL result = [super pointInside:point withEvent:event];
    NSLog(@"\n%s[AFTER]: point = %@, event = %@, result = %d\n\n", __FUNCTION__, NSStringFromCGPoint(point), event, result);
    return result;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"\n%s[BEFORE]: point = %@, event = %@\n\n", __FUNCTION__, NSStringFromCGPoint(point), event);
    UIView *result = [super hitTest:point withEvent:event];
    NSLog(@"\n%s[AFTER]: point = %@, event = %@, result = %@\n\n", __FUNCTION__, NSStringFromCGPoint(point), event, result);
    return result;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"\n%s[BEFORE]: touches = %@, event = %@\n\n", __FUNCTION__, touches, event);
    [super touchesBegan:touches withEvent:event];
    NSLog(@"\n%s[AFTER]: touches = %@, event = %@\n\n", __FUNCTION__, touches, event);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"\n%s[BEFORE]: touches = %@, event = %@\n\n", __FUNCTION__, touches, event);
    [super touchesMoved:touches withEvent:event];
    NSLog(@"\n%s[AFTER]: touches = %@, event = %@\n\n", __FUNCTION__, touches, event);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"\n%s[BEFORE]: touches = %@, event = %@\n\n", __FUNCTION__, touches, event);
    [super touchesEnded:touches withEvent:event];
    NSLog(@"\n%s[AFTER]: touches = %@, event = %@\n\n", __FUNCTION__, touches, event);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"\n%s[BEFORE]: touches = %@, event = %@\n\n", __FUNCTION__, touches, event);
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"\n%s[AFTER]: touches = %@, event = %@\n\n", __FUNCTION__, touches, event);
}

@end
