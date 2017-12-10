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

@implementation ViewController {
    UIView *superview;
    UIView *targetView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _addExampleView];
    
    _observer = [[SJOrentationObserver alloc] initWithTarget:targetView container:superview];
    _observer.rotationCondition = ^BOOL(SJOrentationObserver * _Nonnull observer) {
        return YES;
    };
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)_addExampleView {
    superview = [UIView new];
    superview.backgroundColor = [UIColor blackColor];
    superview.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9.0 / 16);
    superview.center = self.view.center;
    [self.view addSubview:superview];
    
    
    targetView = [UIView new];
    targetView.frame = superview.bounds;
    targetView.backgroundColor = [UIColor orangeColor];
    [superview addSubview:targetView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
