//
//  JCNav.m
//  myPush
//
//  Created by mac on 16/1/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "JCNav.h"
#import <objc/runtime.h>


@interface JCNav () <UIGestureRecognizerDelegate>
@property (nonatomic, weak) UIPanGestureRecognizer *popRecognizer;
@end

@implementation JCNav


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    unsigned int count = 0;
//    
//    Ivar *ivar = class_copyIvarList([UIGestureRecognizer class], &count);
//    
//    for (int i = 0; i<count; i++) {
//        Ivar _var = *(ivar + i);
//        NSLog(@"%s",ivar_getTypeEncoding(_var));
//        NSLog(@"%s",ivar_getName(_var));
//    }

    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    UIView *gestureView = gesture.view;
    
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] init];
    popRecognizer.delegate = self;
    popRecognizer.maximumNumberOfTouches = 1;
    [gestureView addGestureRecognizer:popRecognizer];
    
    /**
     *  获取系统手势的target数组
     */
    NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
    /**
     *  获取它的唯一对象，我们知道它是一个叫UIGestureRecognizerTarget的私有类，它有一个属性叫_target
     */
    id gestureRecognizerTarget = [_targets firstObject];
    /**
     *  获取_target:_UINavigationInteractiveTransition，它有一个方法叫handleNavigationTransition:
     */
    id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
    /**
     *  通过前面的打印，我们从控制台获取出来它的方法签名。
     */
    SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
    /**
     *  创建一个与系统一模一样的手势，我们只把它的类改为UIPanGestureRecognizer
     */
    [popRecognizer addTarget:navigationInteractiveTransition action:handleTransition];
}


- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {

    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    
    if (translation.x <= 0) {
        return NO;
    }
    
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}


@end
