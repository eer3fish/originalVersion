//
//  VNetwork.h
//  douyuTV
//
//  Created by fish on 15/11/20.
//  Copyright © 2015年 fish. All rights reserved.
//  基于AF的基本网络请求

#define TIMEOUT 30

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^SuccessBlock) (id responBody);
typedef void(^FailureBlock) (NSString *error);

@interface VNetwork : NSObject

+ (VNetwork *)sharedManager;
- (AFHTTPRequestOperationManager *)baseHTTPRequest;

-(void)getWithParams:(NSMutableDictionary *)params url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

-(void)postWithParams:(NSMutableDictionary *)params url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

-(void)upImageWithParams:(NSMutableDictionary *)params imageArray:(NSArray *)images url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

@end
