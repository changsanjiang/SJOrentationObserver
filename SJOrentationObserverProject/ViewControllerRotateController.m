//
//  ViewControllerRotateController.m
//  SJOrentationObserverProject
//
//  Created by 畅三江 on 2018/9/20.
//  Copyright © 2018 SanJiang. All rights reserved.
//

#import "ViewControllerRotateController.h"
#import "SJVCRotationManager.h"

@interface ViewControllerRotateController ()<SJRotationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIView *superview;
@property (weak, nonatomic) IBOutlet UIView *target;

@property (nonatomic, strong) SJVCRotationManager *mgr;

@end

@implementation ViewControllerRotateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mgr = [[SJVCRotationManager alloc] initWithViewController:self];
    _mgr.superview = _superview;
    _mgr.target = _target;
    _mgr.rotationCondition = ^BOOL(id<SJRotationManagerProtocol>  _Nonnull mgr) {
        return YES;
    };
    _mgr.delegate = self;
    
//    [_mgr rotate];
    
//    [_mgr rotate:SJOrientation_LandscapeRight animated:YES];
//
//    [_mgr rotate:SJOrientation_LandscapeLeft animated:YES completionHandler:^(id<SJRotationManagerProtocol>  _Nonnull mgr) {
//        NSLog(@"....");
//    }];
    
    // Do any additional setup after loading the view.
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
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
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
