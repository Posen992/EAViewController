//
//  UIViewController+Switch.h
//  EAViewController
//
//  Created by Posen on 2020/2/15.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Switch)

#pragma mark - rootViewController

/// 切换根视图为指定的控制器
/// @param vcClass 控制器的类
- (void)switchRootViewControllerToVCWithClass:(Class)vcClass;

#pragma mark - push
/**
 跳转到指定类的控制器

 @param vcClass 控制器的类
 @param animated 是否需要跳转动画
 */
- (void)pushToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated;

#pragma mark - Back/Pop
/**
 返回上一页

 @param animated 是否有动画效果
 @param completion 完成回调，仅modal页面dismiss时调用
 */
- (void)backViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completion;

/**
 回到指定类的视图控制器

 @param vcClass 指定的类
 @param animated 是否有动画效果
 */
- (void)popToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated;

/**
 回到指定类名的视图控制器

 @param vcString 指定的类名
 @param animated 是否有动画效果
 */
- (void)popToViewControllerWithString:(NSString *)vcString animated:(BOOL)animated;

/**
 回到指定位置的视图控制器

 @param index 指定的位置
 @param animated 是否有动画效果
 */
- (void)popToViewControllerWithIndex:(NSUInteger)index animated:(BOOL)animated;

/**
 回退指定数量的视图控制器

 @param count 指定数量
 @param animated 是否有动画效果
 */
- (void)popToViewControllerWithCount:(NSUInteger)count animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
