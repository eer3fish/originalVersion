//
//  RRloginView.m
//  RRlogin
//
//  Created by fish on 15/12/14.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "RRloginView.h"
#import "RRloginTextFiled.h"

@implementation RRloginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景
        CGRect imageVRect = (CGRect){0, 0, frame.size};
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageVRect];
        UIImage *old = [UIImage imageNamed:@"登陆框背景"];
        UIImage *new = [old resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        imageView.image = new;
        [self addSubview:imageView];
    }
    return self;
}

- (void)setViewType:(loginViewType)viewType {
    _viewType = viewType;
    switch (viewType) {
    case loginViewTypeMain:
        [self setupSubviewsTypeMain];
        break;
        
    case loginViewTypeOther:
        [self setupSubViewsTypeOther];
        break;
            
    case loginViewTypeRegister:
        [self setupSubViewsTypeRegister];
        break;
    }
}

- (void)setupSubviewsTypeMain {
    CGRect userRect = CGRectMake(2 * MARGIN_TEXTVIEW, MARGIN_TEXTVIEW, SELF_WIDTH - 4 * MARGIN_TEXTVIEW, TEXT_HEIGHT);
    RRloginTextFiled *userTF = [[RRloginTextFiled alloc] initWithFrame:userRect];
    userTF.textFiledType = loginTextFiledTypeUser;
    [self addSubview:userTF];

    CGRect pwdRect = CGRectMake(2 * MARGIN_TEXTVIEW, 2 * MARGIN_TEXTVIEW + TEXT_HEIGHT, SELF_WIDTH - 4 * MARGIN_TEXTVIEW, 36);
    RRloginTextFiled *pwdTF = [[RRloginTextFiled alloc] initWithFrame:pwdRect];
    pwdTF.textFiledType = loginTextFiledTypePassword;
    [self addSubview:pwdTF];
    
    CGRect loginBtnRect = CGRectMake(2 * MARGIN_TEXTVIEW, 3 * MARGIN_TEXTVIEW + 2 * TEXT_HEIGHT, SELF_WIDTH - 4 * MARGIN_TEXTVIEW, 36);
    /** 高亮状态的图片*/
    UIButton *loginBtn = [self creatButtonWith:@"登录" Image:@"登陆背景" highlightedImage:nil icon:nil frame:loginBtnRect];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"登陆点击"] forState:UIControlStateSelected];
    [loginBtn addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupSubViewsTypeOther {
    CGRect wechatRect = CGRectMake(2 * MARGIN_TEXTVIEW, MARGIN_TEXTVIEW, SELF_WIDTH - 4 * MARGIN_TEXTVIEW, TEXT_HEIGHT);
    UIButton *wechatBtn = [self creatButtonWith:@"使用微信账号登录" Image:@"微信登陆" highlightedImage:@"微信登陆点击" icon:@"微信icon" frame:wechatRect];
    [wechatBtn addTarget:self action:@selector(loginWechat) forControlEvents:UIControlEventTouchUpInside];
    wechatBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    wechatBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    CGFloat sinaBtnY = CGRectGetMaxY(wechatBtn.frame) + MARGIN_TEXTVIEW;
    CGRect sinaRect = CGRectMake(2 * MARGIN_TEXTVIEW, sinaBtnY, SELF_WIDTH - 4 * MARGIN_TEXTVIEW, TEXT_HEIGHT);
    UIButton *sinaBtn = [self creatButtonWith:@"使用微博账号登录" Image:@"微博账号" highlightedImage:@"微博账号点击" icon:@"微博icon" frame:sinaRect];
    [sinaBtn addTarget:self action:@selector(loginSina) forControlEvents:UIControlEventTouchUpInside];
    sinaBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    sinaBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
}

- (void)setupSubViewsTypeRegister {
    CGRect userRect = CGRectMake(2 * MARGIN_TEXTVIEW, MARGIN_TEXTVIEW, SELF_WIDTH - 4 * MARGIN_TEXTVIEW, TEXT_HEIGHT);
    RRloginTextFiled *userTF = [[RRloginTextFiled alloc] initWithFrame:userRect];
    userTF.textFiledType = loginTextFiledTypeUser;
    [self addSubview:userTF];
    
    CGRect pwdRect = CGRectMake(2 * MARGIN_TEXTVIEW, 2 * MARGIN_TEXTVIEW + TEXT_HEIGHT, SELF_WIDTH - 4 * MARGIN_TEXTVIEW, 36);
    RRloginTextFiled *pwdTF = [[RRloginTextFiled alloc] initWithFrame:pwdRect];
    pwdTF.textFiledType = loginTextFiledTypePassword;
    [self addSubview:pwdTF];
    
    CGRect loginBtnRect = CGRectMake(2 * MARGIN_TEXTVIEW, 3 * MARGIN_TEXTVIEW + 2 * TEXT_HEIGHT, SELF_WIDTH - 4 * MARGIN_TEXTVIEW, 36);
    /** 高亮状态的图片*/
    UIButton *loginBtn = [self creatButtonWith:@"注册" Image:@"登陆背景" highlightedImage:nil icon:nil frame:loginBtnRect];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"登陆点击"] forState:UIControlStateSelected];
    [loginBtn addTarget:self action:@selector(clickRegister) forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)creatButtonWith:(NSString *)title Image:(NSString *)imageName highlightedImage:(NSString *)hightlightedImageName icon:(NSString *)iconName frame:(CGRect)buttonFrame {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonFrame;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    if (imageName) {
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (hightlightedImageName) {
        [button setBackgroundImage:[UIImage imageNamed:hightlightedImageName] forState:UIControlStateHighlighted];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (iconName) {
        [button setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:iconName] forState:UIControlStateHighlighted];
    }
    [self addSubview:button];
    return button;
}

- (void)clickLogin {
    if ([self.delegate respondsToSelector:@selector(didClickLoginButton)]) {
        [self.delegate didClickLoginButton];
    }
}

- (void)loginWechat {
    if ([self.delegate respondsToSelector:@selector(didClickWechatButton)]) {
        [self.delegate didClickWechatButton];
    }
}

- (void)loginSina {
    if ([self.delegate respondsToSelector:@selector(didClickSinaButton)]) {
        [self.delegate didClickSinaButton];
    }
}

- (void)clickRegister {
    if ([self.delegate respondsToSelector:@selector(didClickRegister)]) {
        [self.delegate didClickRegister];
    }
}
@end
