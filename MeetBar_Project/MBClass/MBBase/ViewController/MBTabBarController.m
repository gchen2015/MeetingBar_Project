//
//  MBTabBarController.m
//  MeetBar_Project
//
//  Created by L on 2017/6/22.
//  Copyright © 2017年 MB. All rights reserved.
//

#import "MBTabBarController.h"
#import "MBMeetBarViewController.h"
#import "MBConversationListViewController.h"
#import "MBProfileViewController.h"
#import "MBContactViewController.h"
#import "MBLoginViewController.h"
#import "MBNavigationController.h"

@interface MBTabBarController ()<UITabBarControllerDelegate,CYLTabBarControllerDelegate>

@end

@implementation MBTabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTabBarController];
    }
    return self;
}

- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes =[self tabBarItemsAttributesForController];
    
    /// 设置控制器数组
    self.viewControllers =[self mpViewControllers];
    
    self.tabBar.tintColor = TABBAR_COLOR;
    
    self.delegate = self;
    
}


//控制器设置
- (NSArray *)mpViewControllers {
    MBMeetBarViewController *firstViewController = [[MBMeetBarViewController alloc] init];
    MBNavigationController *firstNavigationController = [[MBNavigationController alloc]
                                                         initWithRootViewController:firstViewController];
    
    MBConversationListViewController *secondViewController = [[MBConversationListViewController alloc] init];
    MBNavigationController *secondNavigationController = [[MBNavigationController alloc]
                                                          initWithRootViewController:secondViewController];
    
    MBContactViewController *thirdViewController = [[MBContactViewController alloc] init];
    MBNavigationController *thirdNavigationController = [[MBNavigationController alloc]initWithRootViewController:thirdViewController];
    
    
    MBProfileViewController *fourthViewController = [[MBProfileViewController alloc] init];
    MBNavigationController *fourthNavigationController = [[MBNavigationController alloc]
                                                          initWithRootViewController:fourthViewController];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

//TabBar文字跟图标设置
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"会吧",
                                                 CYLTabBarItemImage : @"meetbar_unselect",
                                                 CYLTabBarItemSelectedImage : @"meetbar_select",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"消息",
                                                  CYLTabBarItemImage : @"message_unselect",
                                                  CYLTabBarItemSelectedImage : @"message_select",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"通讯录",
                                                 CYLTabBarItemImage : @"contact_unselect",
                                                 CYLTabBarItemSelectedImage : @"contact_select",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我",
                                                  CYLTabBarItemImage : @"profile_unselect",
                                                  CYLTabBarItemSelectedImage : @"profile_select"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
    /// 特殊处理 - 是否需要登录
//    BOOL isBaiDuService = [viewController.topViewController isKindOfClass:[MBMeetBarViewController class]];
//    if (!isBaiDuService) {
//        MBLog(@"你点击了TabBar");
//        //判断登录（需要判断融云是否登录）
//        NSString *token = @"";
//        if ( token == nil || token.length < 1) {
//            
//            MBLoginViewController *login = [[MBLoginViewController alloc] init];
//            MBNavigationController *navi = [[MBNavigationController alloc] initWithRootViewController:login];
//            [self presentViewController:navi animated:YES completion:^{
//            }];
//            return  NO;
//        }
//    }
    return YES;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    NSString *button = [NSString stringWithFormat:@"UIT%@arB%@", @"abB", @"utton"];
    // 如果 PlusButton 也添加了点击事件，那么点击 PlusButton 后不会触发该代理方法。
    if ([control isKindOfClass:[CYLExternPlusButton class]]) {
        UIButton *button = CYLExternPlusButton;
        animationView = button.imageView;
        
    } else if ([control isKindOfClass:NSClassFromString(button)]) {
        NSString *imageView = [NSString stringWithFormat:@"UITabB%@pp%@", @"arSwa", @"ableImageView"];
        for (UIView *subView in control.subviews) {
            if ([subView isKindOfClass:NSClassFromString(imageView)]) {
                animationView = subView;
            }
        }
    }
    
    //    if ([self cyl_tabBarController].selectedIndex % 2 == 0) {
    //        [self addScaleAnimationOnView:animationView];
    //    } else {
    //        [self addRotateAnimationOnView:animationView];
    //    }
    
    [self addScaleAnimationOnView:animationView];
}

#pragma mark -缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

#pragma mark -旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}

@end
