//
//  VNetwork.m
//  douyuTV
//
//  Created by fish on 15/11/20.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "VNetwork.h"

@implementation VNetwork

+ (VNetwork *)sharedManager {
    static VNetwork *sharedNetworkSingleton = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        sharedNetworkSingleton = [[self alloc] init];
    });
    return sharedNetworkSingleton;
}

- (AFHTTPRequestOperationManager *)baseHTTPRequest {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setTimeoutInterval:TIMEOUT];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html",@"application/javascript",@"application/json", nil];
    
    return manager;
}

- (void)getWithParams:(NSMutableDictionary *)params url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    AFHTTPRequestOperationManager *manager = [self baseHTTPRequest];
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager GET:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         successBlock(responseObject);
         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
         failureBlock(errorStr);
     }];

}

- (void)postWithParams:(NSMutableDictionary *)params url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    AFHTTPRequestOperationManager *manager = [self baseHTTPRequest];
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        successBlock(responseObject);
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failureBlock(errorStr);
    }];

}

- (void)upImageWithParams:(NSMutableDictionary *)params imageArray:(NSArray *)images url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    AFHTTPRequestOperationManager *manger=[self baseHTTPRequest];
    NSString *urlStr=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manger POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (int i=1; i<=images.count; i++) {
            
            NSData *imageData=UIImageJPEGRepresentation(images[i-1], 1.0);
            
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"image%d",i] fileName:@"image" mimeType:@"image/jpg"];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failureBlock(errorStr);
    }];

}
@end
