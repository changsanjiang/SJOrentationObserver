//
//  ViewRotateController.m
//  SJOrentationObserverProject
//
//  Created by 畅三江 on 2018/9/20.
//  Copyright © 2018 SanJiang. All rights reserved.
//

#import "ViewRotateController.h"
#import "SJRotationManager.h"

@interface ViewRotateController () 
@property (weak, nonatomic) IBOutlet UIView *superview;
@property (weak, nonatomic) IBOutlet UIView *target;

@property (nonatomic, strong) SJRotationManager *mgr;
@property (nonatomic, strong) id<SJRotationManagerObserver> rotationObserver;
@end

@implementation ViewRotateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mgr = [[SJRotationManager alloc] init];
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
    _rotationObserver.rotationDidStartExeBlock = ^(id<SJRotationManagerProtocol>  _Nonnull mgr) {
        NSLog(@"开始旋转");
    };
    _rotationObserver.rotationDidEndExeBlock = ^(id<SJRotationManagerProtocol>  _Nonnull mgr) {
        NSLog(@"结束旋转");
    };
    
    // Do any additional setup after loading the view.
} 
@end
