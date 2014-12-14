//
//  AMOUITestViewControllerTests.m
//  AMOUITestApplication
//
//  Created by amo on 2014/12/14.
//  Copyright (c) 2014年 amo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <objc/objc-runtime.h>
#import "AMOUITestViewController.h"

#define objc_msgSend(...) ((void(*)(id, SEL, __VA_ARGS__))objc_msgSend)

@interface MockUITouch: UITouch

@property (nonatomic) CGPoint aTouchPoint;
@property (nonatomic) CGPoint aPreviousTouchPoint;
@property (nonatomic) UIWindow *aWindow;
@property (nonatomic) UIView *aView;
@property (nonatomic) UITouchPhase aPhase;
@property (nonatomic) NSUInteger aTapCount;

@end

@implementation MockUITouch

- (CGPoint)locationInView:(UIView *)view
{
    return [_aView convertPoint:_aTouchPoint toView:view];
}

- (CGPoint)previousLocationInView:(UIView *)view
{
    return [_aView convertPoint:_aPreviousTouchPoint toView:view];
}

- (UIWindow *)window { return _aWindow; }
- (UIView *)view { return _aView; }
- (UITouchPhase)phase { return _aPhase; }
- (NSUInteger)tapCount { return _aTapCount; }

@end

@interface MockUIEvent: UIEvent

@property (nonatomic) NSSet *aTouches;

@end

@implementation MockUIEvent

- (UITouch *)_firstTouchForView:(UIView *)view
{
    return [_aTouches anyObject];
}

@end


@interface AMOUITestViewControllerTests : XCTestCase

@end

@implementation AMOUITestViewControllerTests

- (void)window:(UIWindow *)window tapSimulationWithPoint:(CGPoint)point
{
    MockUIEvent *event = [MockUIEvent new];
    UIView *view = [window hitTest:point withEvent:event];
    MockUITouch *touch = [MockUITouch new];
    touch.aTouchPoint = touch.aPreviousTouchPoint = [view convertPoint:point fromView:nil];
    touch.aWindow = window;
    touch.aView = view;
    touch.aTapCount = 1;
    
    NSSet *touches = [NSSet setWithObject:touch];
    event.aTouches = touches;
    
    touch.aPhase = UITouchPhaseBegan;
    [view touchesBegan:touches withEvent:event];
    
    touch.aPhase = UITouchPhaseEnded;
    [view touchesEnded:touches withEvent:event];
}

- (void)testCase
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    AMOUITestViewController *vc = [AMOUITestViewController new];
    window.rootViewController = vc;
    [window makeKeyAndVisible];
    CGPoint touchPoint = CGPointMake(vc.view.center.x, vc.view.center.y / 2);
    
    XCTAssertEqualObjects(vc.someView.backgroundColor, vc.deactiveColor);
    
    [self window:window tapSimulationWithPoint:touchPoint];
    
    XCTAssertEqualObjects(vc.someView.backgroundColor, vc.activeColor);

    [self window:window tapSimulationWithPoint:touchPoint];

    XCTAssertEqualObjects(vc.someView.backgroundColor, vc.deactiveColor);
}

@end
