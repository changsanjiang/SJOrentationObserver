//
//  ViewController.m
//  SJOrentationObserverProject
//
//  Created by BlueDancer on 2017/12/9.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "ViewController.h"
#import "SJOrentationObserver.h"

@interface ViewController ()

@property (nonatomic, strong) SJOrentationObserver *observer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *fatherView = [UIView new];
    fatherView.backgroundColor = [UIColor blackColor];
    fatherView.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9.0 / 16);
    fatherView.center = self.view.center;
    [self.view addSubview:fatherView];
    
    
    UIView *targetView = [UIView new];
    targetView.frame = fatherView.bounds;
    targetView.backgroundColor = [UIColor orangeColor];
    [fatherView addSubview:targetView];
    
    _observer = [[SJOrentationObserver alloc] initWithTarget:targetView container:fatherView];
    
    _observer.rotationCondition = ^BOOL(SJOrentationObserver * _Nonnull observer) {
        return YES;
    };
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
