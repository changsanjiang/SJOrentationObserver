//
//  ViewRotateController.m
//  SJOrentationObserverProject
//
//  Created by 畅三江 on 2018/9/20.
//  Copyright © 2018 SanJiang. All rights reserved.
//

#import "ViewRotateController.h"
#import "SJRotationManager.h"

@interface ViewRotateController ()<SJRotationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIView *superview;
@property (weak, nonatomic) IBOutlet UIView *target;

@property (nonatomic, strong) SJRotationManager *mgr;

@end

@implementation ViewRotateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mgr = [[SJRotationManager alloc] init];
    _mgr.superview = _superview;
    _mgr.target = _target;
    _mgr.rotationCondition = ^BOOL(id<SJRotationManagerProtocol>  _Nonnull mgr) {
        return YES;
    };
    _mgr.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)rotationManager:(id<SJRotationManagerProtocol>)manager didRotateView:(BOOL)isFullscreen {
#ifdef DEBUG
    NSLog(@"%d - %s", (int)__LINE__, __func__);
#endif
}

- (void)rotationManager:(id<SJRotationManagerProtocol>)manager willRotateView:(BOOL)isFullscreen {
#ifdef DEBUG
    NSLog(@"%d - %s", (int)__LINE__, __func__);
#endif

}
@end
