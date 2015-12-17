//
//  tabBarController.m
//  douyuTV
//
//  Created by fish on 15/11/20.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "tabBarController.h"
#import "DictionaryViewController.h"
#import "FoundViewController.h"
#import "navigationController.h"
#import "RRloginViewController.h"

@interface tabBarController ()

@end

@implementation tabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    DictionaryViewController *homeVC = [[DictionaryViewController alloc] init];
    [self addChildVC:homeVC title:@"词典" image:@"首页" selectedImage:@"首页2"];
    
    FoundViewController *messageVC = [[FoundViewController alloc] init];
    [self addChildVC:messageVC title:@"发现" image:@"发现" selectedImage:@"发现2"];
    
    RRloginViewController *loginVC = [[RRloginViewController alloc] init];
    [self addChildVC:loginVC title:@"我的" image:@"我的" selectedImage:@"我的2"];
}

- (void)addChildVC:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVc.tabBarItem.title = title;
//    childVc.tabBarController.tabBarItem.title = title;
    
    if (image) {
        childVc.tabBarItem.image = [UIImage imageNamed:image];
    }
    
    if (selectedImage) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];

    
    navigationController *nvc = [[navigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nvc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
