//
//  UIViewController+Switch.m
//  EAViewController
//
//  Created by Posen on 2020/2/15.
//

#import "UIViewController+Switch.h"

@implementation UIViewController (Switch)

#pragma mark - rootViewController
- (void)switchRootViewControllerToVCWithClass:(Class)vcClass
{
    UIViewController *vc = nil;
    vc = [[[vcClass class] alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
}

#pragma mark - push
- (void)pushToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated
{
    UIViewController *vc = nil;
    vc = [[[vcClass class] alloc]init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Back/Pop
//返回
- (void)backViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completion
{
    if (self.presentingViewController&&self.navigationController.viewControllers.count == 1) //modal的页面，且没有push到下一个界面
    {
        [self dismissViewControllerAnimated:animated completion:completion];
    }
    else if (self.navigationController.viewControllers.count > 1)
    {
        [self.navigationController popViewControllerAnimated:animated];
    }
    
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"无路可退");
#endif
}

//回到指定类的视图控制器
- (void)popToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated
{
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    
    [arrViewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:vcClass])
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popToViewController:(UIViewController *)obj animated:animated];
                *stop = YES;
            });
        }
    }];
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"此路不通");
#endif
}

//回到指定类名的视图控制器
- (void)popToViewControllerWithString:(NSString *)vcString animated:(BOOL)animated
{
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    
    [arrViewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:NSClassFromString(vcString)])
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popToViewController:(UIViewController *)obj animated:animated];
                *stop = YES;
            });
        }
    }];
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"此路不通");
#endif
}

//回到指定位置的视图控制器
- (void)popToViewControllerWithIndex:(NSUInteger)index animated:(BOOL)animated
{
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    
    if (arrViewControllers.count > index)
    {
        [self.navigationController popToViewController:arrViewControllers[index] animated:animated];
    }
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"以退为进？");
#endif
}

//回退指定数量的视图控制器
- (void)popToViewControllerWithCount:(NSUInteger)count animated:(BOOL)animated
{
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    
    if (arrViewControllers.count > count)
    {
        [self.navigationController popToViewController:arrViewControllers[arrViewControllers.count - count - 1] animated:animated];
    }
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"再退是悬崖");
#endif
}

@end
