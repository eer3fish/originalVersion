//
//  RRregisterViewController.m
//  originalVersion
//
//  Created by fish on 15/12/14.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "RRregisterViewController.h"
#import "RRloginView.h"

@implementation RRregisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setupSubviews {
    CGRect registerViewRect = CGRectMake(MARGIN_DEFAULT, MARGIN_DEFAULT + 64, SCREEN_HEIGHT - 2 * MARGIN_DEFAULT, 4 * MARGIN_TEXTVIEW + 3 * TEXT_HEIGHT);
    RRloginView *registerView = [[RRloginView alloc] initWithFrame:registerViewRect];
    registerView.viewType = loginViewTypeRegister;
    [self.view addSubview:registerView];
}


@end
