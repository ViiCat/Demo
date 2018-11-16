//
//  UIViewController+Category.m
//  ViiCat
//
//  Created by Liu Jie on 2018/11/16.
//  Copyright © 2018 JasonMark. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>

@implementation UIViewController (Category)
+ (void)load {
    
    ///仅执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //获得方法的实例
        Method wda = class_getInstanceMethod([self class], @selector(viewDidAppear:));
        Method swizzlingWda = class_getInstanceMethod([self class], @selector(swizzling_viewDidAppear:));
        
        //避免源SEL没有实现IMP的情况
        BOOL isAdd = class_addMethod([self class], method_getName(swizzlingWda), method_getImplementation(swizzlingWda), method_getTypeEncoding(swizzlingWda));
        
        if (isAdd) {
            class_replaceMethod([self class], method_getName(swizzlingWda), method_getImplementation(swizzlingWda), method_getTypeEncoding(swizzlingWda));
        } else {
            //关键,方法交换
            method_exchangeImplementations(wda, swizzlingWda);
        }
    });
}

- (void)swizzling_viewDidAppear:(BOOL)animated {
    //这句相当于调用-(void)viewDidAppear:(BOOL)animated; 原因在此之前方法已经完成了交换
    [self swizzling_viewDidAppear:animated];
    
    //类名称
    const char *cName = class_getName([self class]);
    //系统时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *strTime = [formatter stringFromDate:[NSDate date]];
    NSLog(@"\nClass:%@\nTime:%@",[NSString stringWithUTF8String:cName],strTime);
}
@end
