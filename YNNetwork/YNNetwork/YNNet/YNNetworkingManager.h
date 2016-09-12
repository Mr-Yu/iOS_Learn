//
//  YNNetworkingManager.h
//  waye
//
//  Created by wapage-mac on 16/8/18.
//  Copyright © 2016年 neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "YNNetworkConfig.h"

@class YNRequest;

typedef void (^AFConstructingBlock)(id<AFMultipartFormData> formData);

//请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *dic);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

//请求方法define
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
} HTTPMethod;

@interface YNNetworkingManager : AFHTTPSessionManager
+ (instancetype)sharedManager;
//非form表单方式上传
- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;
//form表单方式上传
- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
                 WithForm:(AFConstructingBlock)Formblock
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;

@end
