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
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;

@end

@implementation ViewController {
    UIView *_superview;
    UIView *_targetView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _addExampleView];
    
    _observer = [[SJOrentationObserver alloc] initWithTarget:_targetView container:_superview rotationCondition:^BOOL(SJOrentationObserver * _Nonnull observer) {
        return YES;
    }];
    
    // support orientation
//    _observer.supportedRotationOrientation = SJSupportedRotationOrientation_LandscapeRight | SJSupportedRotationOrientation_LandscapeLeft;
    
}

- (void)_addExampleView {
    
    _superview = [UIView new];
    _superview.backgroundColor = [UIColor blackColor];
    _superview.frame = CGRectMake(0, 300, self.view.frame.size.width, self.view.frame.size.width * 9.0 / 16);
    [self.view addSubview:_superview];
    
    _targetView = [UIView new];
    _targetView.frame = _superview.bounds;
    _targetView.backgroundColor = [UIColor orangeColor];
    [_superview addSubview:_targetView];
    
    [_targetView addSubview:self.changeBtn];
    self.changeBtn.frame = _targetView.bounds;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)change:(id)sender {
    [_observer _changeOrientation];
}

@end
