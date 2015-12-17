//
//  DictionaryTableViewCell.m
//  originalVersion
//
//  Created by fish on 15/12/11.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "DictionaryTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface DictionaryTableViewCell ()
@property(nonatomic, weak) UIImageView *picView;
@property(nonatomic, weak) UILabel *wordLabel;
@property(nonatomic, weak) UILabel *sourceLabel;
@end

@implementation DictionaryTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)view).delaysContentTouches = NO;
            break;
        }
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [self commonInit];
    return self;
}

- (void)commonInit {
    //图片
    UIImageView *picView = [UIImageView new];
    self.picView = picView;
    [self.contentView addSubview:picView];
    
    //单词
    UILabel *wordLabel = [UILabel new];
    self.wordLabel = wordLabel;
    [self.contentView addSubview:wordLabel];
    
    //来源
    UILabel *sourceLabel = [UILabel new];
    self.sourceLabel = sourceLabel;
    self.sourceLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:sourceLabel];
    
    
    
}

- (void)setDictionaryModel:(DictionaryModel *)dictionaryModel {
    _dictionaryModel = dictionaryModel;
    UIImage *holdPlaceImage = [UIImage imageNamed:@""];
    NSURL *imageUrl = [NSURL URLWithString:dictionaryModel.picPath];
    [self.picView sd_setImageWithURL:imageUrl placeholderImage:holdPlaceImage];
    [self.picView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    self.wordLabel.text = dictionaryModel.word;
    [self.wordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    NSAttributedString *sourceAttrStr = [self getAttributedStringWith:dictionaryModel.source];
    CGSize sourceLabelSize;
    self.sourceLabel.attributedText = sourceAttrStr;
    
    
}

- (NSAttributedString *)getAttributedStringWith:(NSString *)string {
    NSString *sourceString = [NSString stringWithFormat:@"来自%@",string];
    NSMutableAttributedString *sourceAttrStr = [[NSMutableAttributedString alloc] initWithString:sourceString];
    [sourceAttrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 2)];
    [sourceAttrStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(2, sourceAttrStr.length - 2)];
    
    return (NSAttributedString *)sourceAttrStr;
}


















@end
