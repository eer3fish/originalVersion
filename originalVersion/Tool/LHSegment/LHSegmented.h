//
//  LHSegmented.h
//  LHScrollLabel
//
//  Created by fish on 15/12/2.
//  Copyright © 2015年 fish. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LHSegmentDelegate <NSObject>

@optional
- (UIButton *)didClickSegmentButton:(id)sender;
@end

@interface LHSegmented : UIView
@property(nonatomic, weak)id<LHSegmentDelegate> delegate;
@property(nonatomic, copy)void (^changeScrolloffset)(NSInteger value);

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles TitleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor BackgroundColor:(UIColor *)backgroundColor;

- (void) moveSlider:(CGFloat)offset;

- (void) changeButtonColor:(UIButton *)sender;

@end
