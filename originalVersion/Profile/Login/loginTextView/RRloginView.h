//
//  RRloginView.h
//  RRlogin
//
//  Created by fish on 15/12/14.
//  Copyright © 2015年 fish. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, loginViewType) {
    loginViewTypeMain,
    loginViewTypeOther,
    loginViewTypeRegister,
};

@protocol loginViewDelegate <NSObject>

@optional
- (void)didClickLoginButton;
- (void)didClickWechatButton;
- (void)didClickSinaButton;
- (void)didClickRegister;
@end

@interface RRloginView : UIView
@property(nonatomic, assign)loginViewType viewType;
@property(nonatomic, weak)id<loginViewDelegate> delegate;
@end
