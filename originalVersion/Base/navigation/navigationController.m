//
//  navigationController.m
//  douyuTV
//
//  Created by fish on 15/11/20.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "navigationController.h"

@interface navigationController ()

@end

@implementation navigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [[UIColor defaultColor] colorWithAlphaComponent:0.85f];
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
