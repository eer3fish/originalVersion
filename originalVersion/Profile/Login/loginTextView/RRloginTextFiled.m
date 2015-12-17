//
//  RRloginTextFiled.m
//  RRlogin
//
//  Created by fish on 15/12/13.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "RRloginTextFiled.h"

@implementation RRloginTextFiled

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage imageNamed:@"输入框"];
    }
    return self;
}

//根据类型设置样式
- (void)setTextFiledType:(loginTextFiledType)textFiledType {
    switch (textFiledType) {
        case loginTextFiledTypeUser:
            [self setupWithImageName:@"用户名icon" placeholder:@"请输入用户名"];
            
            break;
            
        case loginTextFiledTypePassword:
            [self setupWithImageName:@"密码icon" placeholder:@"请输入密码"];
            
            break;
    }
}

- (void)setupWithImageName:(NSString *)imageName placeholder:(NSString *)placeholder {
    self.font = [UIFont systemFontOfSize:18];
    self.placeholder = placeholder;
    UIImageView *icon = [[UIImageView alloc] init];
    icon.image = [UIImage imageNamed:imageName];
    icon.width = 17;
    icon.height = 17;
    icon.contentMode = UIViewContentModeRedraw;
    self.leftView = icon;
    self.leftViewMode = UITextFieldViewModeAlways;
}

//改变图片的位置
- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *sub in self.subviews) {
        if ([sub isKindOfClass:[UIImageView class]]) {
            sub.x = 10;
        }
    }
}

//重写占位文字的位置
- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return [self setoffRectWithOrigianl:bounds];
}

//重写编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self setoffRectWithOrigianl:bounds];
}

//重写输入文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds {
    return [self setoffRectWithOrigianl:bounds];
}


- (CGRect)setoffRectWithOrigianl:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 35, bounds.origin.y, bounds.size.width, bounds.size.height);
}

@end
