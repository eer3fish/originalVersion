//
//  RRloginTextFiled.h
//  RRlogin
//
//  Created by fish on 15/12/13.
//  Copyright © 2015年 fish. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, loginTextFiledType) {
    loginTextFiledTypeUser,
    loginTextFiledTypePassword,
};

@interface RRloginTextFiled : UITextField
@property(nonatomic, assign) loginTextFiledType textFiledType;
@end
