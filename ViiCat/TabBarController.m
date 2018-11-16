//
//  TabBarController.m
//  ViiCat
//
//  Created by Liu Jie on 2018/11/15.
//  Copyright © 2018 JasonMark. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:homeVC];
    navHome.tabBarItem.tag = 0;
    navHome.tabBarItem.title = @"首页";
    navHome.tabBarItem.image = [[UIImage imageNamed:@"common_tab_home_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navHome.tabBarItem.selectedImage = [[UIImage imageNamed:@"common_tab_home_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    ListViewController *listVC = [[ListViewController alloc] init];
//    UINavigationController *navList = [[UINavigationController alloc] initWithRootViewController:listVC];
//    navList.tabBarItem.tag = 0;
//    navList.tabBarItem.title = @"明细";
//    navList.tabBarItem.image = [[UIImage imageNamed:@"common_tab_home_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    navList.tabBarItem.selectedImage = [[UIImage imageNamed:@"common_tab_home_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [self setViewControllers:@[navHome] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
