//
//  SJOrentationObserver.h
//  SJVideoPlayerProject
//
//  Created by BlueDancer on 2017/12/5.
//  Copyright © 2017年 SanJiang. All rights reserved.
//
// 项目地址: https://github.com/changsanjiang/SJOrentationObserver
// 我的邮箱: changsanjiang@gmail.com
//
// 注意事项: 如果父视图的`clipsToBounds == YES`, 转回小屏时, 会出现被截掉一部分. 请注意这个问题.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJOrentationObserver : NSObject

/*!
 *  Target is rotationView.
 *  Container is superview.
 **/
- (instancetype)initWithTarget:(UIView *)view container:(UIView *)targetSuperview;

@property (nonatomic, assign, readonly, getter=isFullScreen) BOOL fullScreen;
/// 旋转时间, default is 0.3
@property (nonatomic, assign, readwrite) float duration;
/// 旋转条件, 返回 YES 才会旋转, 默认为 nil.
@property (nonatomic, copy, readwrite, nullable) BOOL(^rotationCondition)(SJOrentationObserver *observer);

@property (nonatomic, copy, readwrite, nullable) void(^orientationWillChange)(SJOrentationObserver *observer);

@property (nonatomic, copy, readwrite, nullable) void(^orientationChanged)(SJOrentationObserver *observer);

- (BOOL)_changeOrientation;

@end

NS_ASSUME_NONNULL_END
