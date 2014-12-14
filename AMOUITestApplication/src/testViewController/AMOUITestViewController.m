//
//  AMOUITestViewController.m
//  AMOUITestApplication
//
//  Created by amo on 2014/12/14.
//  Copyright (c) 2014年 amo. All rights reserved.
//

#import "AMOUITestViewController.h"
#import "AMOUITestView.h"

@interface AMOUITestViewController ()

- (void)onClick:(id)sender;

@end

@implementation AMOUITestViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _activeColor = [UIColor colorWithRed:0.3 green:0.7 blue:0.3 alpha:1.0];
        _deactiveColor = [UIColor colorWithRed:0.7 green:0.3 blue:0.3 alpha:1.0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    AMOUITestView *view = [[AMOUITestView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.center = self.view.center;
    [self.view addSubview:view];
    view.backgroundColor = _deactiveColor;
    view.userInteractionEnabled = YES;
    _someView = view;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"hoge" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = CGPointMake(self.view.center.x, self.view.center.y / 2);
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClick:(id)sender
{
    NSLog(@"%s", __FUNCTION__);
    _someView.backgroundColor = [_someView.backgroundColor isEqual:_activeColor] ? _deactiveColor : _activeColor;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
