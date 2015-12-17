//
//  DictionaryTableView.m
//  originalVersion
//
//  Created by fish on 15/12/11.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "DictionaryTableView.h"

@implementation DictionaryTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delaysContentTouches = NO;
        self.canCancelContentTouches = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        UIView *wrapView = self.subviews.firstObject;
        if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
            for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
                if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"]) {
                    gesture.enabled = NO;
                    break;
                }
            }
        }
    }
    return self;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ([view isKindOfClass:[UIControl class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}

@end