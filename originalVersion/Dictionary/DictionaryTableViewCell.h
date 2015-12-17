//
//  DictionaryTableViewCell.h
//  originalVersion
//
//  Created by fish on 15/12/11.
//  Copyright © 2015年 fish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DictionaryModel.h"

@interface DictionaryTableViewCell : UITableViewCell
@property(nonatomic, strong) DictionaryModel *dictionaryModel;
@property(nonatomic, assign) CGFloat cellHeight;
@end

@interface WBStatusToolbarView : UIView
@property (nonatomic, strong) UIButton *readButton;
@property (nonatomic, strong) UIButton *contextButton;
@property (nonatomic, strong) UIButton *addButton;

@property (nonatomic, strong) UILabel *readLabel;
@property (nonatomic, strong) UILabel *contextLabel;
@property (nonatomic, strong) UILabel *addLabel;
//
//@property (nonatomic, strong) CAGradientLayer *line1;
//@property (nonatomic, strong) CAGradientLayer *line2;
//@property (nonatomic, strong) CALayer *topLine;
//@property (nonatomic, strong) CALayer *bottomLine;
//@property (nonatomic, weak) DictionaryTableViewCell *cell;
//
//- (void)setLiked:(BOOL)liked withAnimation:(BOOL)animation;
@end