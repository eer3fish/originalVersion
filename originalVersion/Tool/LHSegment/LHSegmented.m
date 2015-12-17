//
//  LHSegmented.m
//  LHScrollLabel
//
//  Created by fish on 15/12/2.
//  Copyright © 2015年 fish. All rights reserved.
//

#define SCREEN_W [UIScreen mainScreen].bounds.size.width

#import "LHSegmented.h"

@interface LHSegmented ()
@property(nonatomic, weak)UIView *slide;
@property(nonatomic, assign)CGFloat WIDTH;
@end

@implementation LHSegmented

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles TitleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor BackgroundColor:(UIColor *)backgroundColor {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = backgroundColor;
        
        [self creatButtonsWithTitles:titles TitleColor:titleColor selectedColor:selectedColor SuperViewFrame:frame];
    }
    return self;
}

- (void)creatButtonsWithTitles:(NSArray *)titles TitleColor:(UIColor *)titleColor selectedColor:(UIColor *)selectedColor SuperViewFrame:(CGRect)frame {
    CGFloat WIDTH = frame.size.width / titles.count;
    CGFloat HEIGHT = frame.size.height;
    _WIDTH = WIDTH;
    for (int i = 0; i < titles.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT)];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:titleColor forState:UIControlStateNormal];
        [button setTitleColor:selectedColor forState:UIControlStateSelected];
        /**
         button.layer.borderWidth = 1.0;
         button.layer.borderColor = [UIColor grayColor].CGColor;
         button.layer.cornerRadius = 5.0;
         button.layer.masksToBounds = YES;
        */
        
        [button setTag:100 + i];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    [self creatSlide:WIDTH];
}

- (void)clickButton:(UIButton *)sender {
    for (id object in self.subviews) {
        if ([object isKindOfClass:[UIButton class]]) {
            UIButton *tempButton = (UIButton *)object;
            tempButton.selected = NO;
        }
    }
    
    sender.selected = YES;
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect slideRect = self.slide.frame;
        slideRect.origin.x = (sender.tag - 100) * self.WIDTH;
        self.slide.frame = slideRect;
        
    } completion:nil];
    
    self.changeScrolloffset(sender.tag - 100);
}

- (void) creatSlide:(CGFloat)Width {
    UIView *slide = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 4, Width, 4)];
    [slide setBackgroundColor:RGBColor(219, 99, 139)];
    [self addSubview:slide];
    _slide = slide;
}

- (void) moveSlider:(CGFloat)offset {
    CGRect slideRect = self.slide.frame;
    slideRect.origin.x = offset / (SCREEN_W * 2) * (self.frame.size.width);
    self.slide.frame = slideRect;
}

- (void) changeButtonColor:(UIButton *)sender {
    for (id object in self.subviews) {
        if ([object isKindOfClass:[UIButton class]]) {
            UIButton *tempButton = (UIButton *)object;
            tempButton.selected = NO;
        }
    }
    sender.selected = YES;
}



@end


