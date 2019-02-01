//
//  ViewControllerRotateController.m
//  SJOrentationObserverProject
//
//  Created by 畅三江 on 2018/9/20.
//  Copyright © 2018 SanJiang. All rights reserved.
//

#import "ViewControllerRotateController.h"
#import "SJVCRotationManager.h"

@interface ViewControllerRotateController ()
@property (weak, nonatomic) IBOutlet UIView *superview;
@property (weak, nonatomic) IBOutlet UIView *target;

@property (nonatomic, strong) SJVCRotationManager *mgr;
@property (nonatomic, strong) id<SJRotationManagerObserver> rotationObserver;
@end

@implementation ViewControllerRotateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mgr = [[SJVCRotationManager alloc] initWithViewController:self];
    _mgr.superview = _superview;
    _mgr.target = _target;
    _mgr.shouldTriggerRotation = ^BOOL(id<SJRotationManagerProtocol>  _Nonnull mgr) {
//        if ( ... ) {
//            // ...
//            return NO;
//        }
        return YES;
    };
    
    _rotationObserver = [_mgr getObserver];
    __weak typeof(self) _self = self;
    _rotationObserver.rotationDidStartExeBlock = ^(id<SJRotationManagerProtocol>  _Nonnull mgr) {
        __strong typeof(_self) self = _self;
        if ( !self ) return ;
        NSLog(@"开始旋转");
        [self.navigationController setNavigationBarHidden:mgr.isFullscreen animated:YES];
    };
    _rotationObserver.rotationDidEndExeBlock = ^(id<SJRotationManagerProtocol>  _Nonnull mgr) {
        __strong typeof(_self) self = _self;
        if ( !self ) return ;
        NSLog(@"结束旋转");
    };
    
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationLandscapeLeft) forKey:@"orientation"];
}

- (IBAction)back:(id)sender {
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)dis_Yes:(id)sender {
    _mgr.disableAutorotation = YES;
}
- (IBAction)dis_NO:(id)sender {
    _mgr.disableAutorotation = NO;
}
- (IBAction)rotate:(id)sender {
    [_mgr rotate];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [_mgr vc_viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (BOOL)shouldAutorotate {
    return [_mgr vc_shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [_mgr vc_supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [_mgr vc_preferredInterfaceOrientationForPresentation];
}

@end
