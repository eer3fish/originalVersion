//
//  RRloginViewController.m
//  RRlogin
//
//  Created by fish on 15/12/13.
//  Copyright © 2015年 fish. All rights reserved.
//

#define BACKGROUNDCOLOR [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
#define SegmentW 40

#import "RRloginViewController.h"
#import "RRloginTextFiled.h"
#import "RRloginView.h"
#import "LHSegmented.h"

@interface RRloginViewController ()<loginViewDelegate, UIScrollViewDelegate>
@property(nonatomic, weak) UIScrollView *scrollView;
@property(nonatomic, strong) LHSegmented *segment;
@property(nonatomic, weak) UIView *loginView;
@property(nonatomic, weak) UIView *registerView;
@end


@implementation RRloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BACKGROUNDCOLOR;

    [self setupSegment];
    [self setupScrollView];
    [self setupChildView];
}

- (void)setupChildView {
    [self setupLoginView];
    [self setupRegisterView];
}

- (void)setupSegment {
    CGRect rect = CGRectMake(0, 64, self.view.frame.size.width, SegmentW);
    NSArray *array = @[@"登录", @"注册"];
    UIColor *titleColor = RGBColor(196, 196, 196);
    UIColor *selectedColor = RGBColor(219, 99, 139);
    UIColor *background = [UIColor whiteColor];
    
    LHSegmented *segment = [[LHSegmented alloc] initWithFrame:rect Titles:array TitleColor:titleColor selectedColor:selectedColor BackgroundColor:background];
    self.segment = segment;
    
    segment.changeScrolloffset = ^(NSInteger value){
        [UIView animateWithDuration:0.36 animations:^{
            [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * value, 0) animated:NO];
        }];
    };
    
    [self.view addSubview:segment];
}

- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT-104)];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
}

- (void)setupLoginView {
    
    UIView *loginView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 104)];
    loginView.backgroundColor = BACKGROUNDCOLOR;
    self.loginView = loginView;
    
    //上
    RRloginView *loginViewMain = [[RRloginView alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH - 30, 4 * MARGIN_TEXTVIEW + 3 * TEXT_HEIGHT)];
    loginViewMain.viewType = loginViewTypeMain;
    loginViewMain.delegate = self;
    [loginView addSubview:loginViewMain];
    
    //中
    CGFloat lineY = CGRectGetMaxY(loginViewMain.frame);
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, lineY + MARGIN_DEFAULT + 5, SCREEN_WIDTH - 30, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:179.0/255.0 green:179.0/255.0 blue:179.0/255.0 alpha:1.0];
    [loginView addSubview:lineView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    label.center = lineView.center;
    label.text = @"使用其他方式登录";
    label.textColor = [UIColor colorWithRed:179.0/255.0 green:179.0/255.0 blue:179.0/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:12];
    label.backgroundColor = BACKGROUNDCOLOR;
    label.textAlignment = NSTextAlignmentCenter;
    [loginView insertSubview:label aboveSubview:lineView];
    
    //下
    CGFloat loginVOtherY = CGRectGetMaxY(lineView.frame) + MARGIN_DEFAULT + 5;
    RRloginView *loginViewOther = [[RRloginView alloc] initWithFrame:CGRectMake(15, loginVOtherY, SCREEN_WIDTH - 30, 3 * MARGIN_TEXTVIEW + 2 * TEXT_HEIGHT)];
    loginViewOther.viewType = loginViewTypeOther;
    loginViewOther.delegate = self;
    [loginView addSubview:loginViewOther];
    
    [self.scrollView addSubview:self.loginView];
}

- (void)setupRegisterView {
    UIView *registerView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 104)];
    registerView.backgroundColor = BACKGROUNDCOLOR;
    self.registerView = registerView;
    
    CGRect registerViewRect = CGRectMake(MARGIN_DEFAULT, MARGIN_DEFAULT, SCREEN_WIDTH - 2 * MARGIN_DEFAULT, 4 * MARGIN_TEXTVIEW + 3 * TEXT_HEIGHT);
    RRloginView *loginViewRegister = [[RRloginView alloc] initWithFrame:registerViewRect];
    loginViewRegister.viewType = loginViewTypeRegister;
    [registerView addSubview:loginViewRegister];
    
    [self.scrollView addSubview:self.registerView];
}


#pragma mark - loginViewDelegate

- (void)didClickLoginButton {
    NSLog(@"clickLogin");
}

- (void)didClickWechatButton {
    NSLog(@"clickWechat");
}

- (void)didClickSinaButton {
    NSLog(@"clickSina");
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        NSInteger value = scrollView.contentOffset.x / SCREEN_WIDTH;
        UIButton *tempButton = (UIButton *)[self.segment viewWithTag:(100 + value)];
        [self.segment changeButtonColor:tempButton];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        CGFloat offset = scrollView.contentOffset.x;
        [self.segment moveSlider:offset];
    }
}


@end
