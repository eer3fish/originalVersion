//
//  DictionaryModel.h
//  originalVersion
//
//  Created by fish on 15/12/11.
//  Copyright © 2015年 fish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictionaryModel : NSObject
/** cell图片的地址*/
@property(nonatomic, strong) NSString *picPath;
/** cell的单词 eg.homeland*/
@property(nonatomic, strong) NSString *word;
/** cell单词的来源 eg.来自国土安全01 01*/
@property(nonatomic, strong) NSString *source;
@end
