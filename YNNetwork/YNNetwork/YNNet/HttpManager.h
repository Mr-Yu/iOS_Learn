//
//  HttpManager.h
//  YNNetwork
//
//  Created by wapage-mac on 16/9/12.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YNNetwork.h"

typedef void (^rsponseCallback)(NSObject *rsponse, BOOL isSuccess);

typedef void (^rsponseBatchCallback)(NSArray *rsponses, BOOL isSuccess);

@interface HttpManager : YNNetworkingManager

+ (id)sharedManager;

//设置url
- (void)setBaseUrl;

//Post 请求
- (void)postForRequest:(id)request callback:(rsponseCallback)callback;
//Post 取消
- (void)postCancel:(id)request;

//批量发送Post
- (void)postBatchRequest:(NSArray*)requests callback:(rsponseBatchCallback)callback;
//批量发送Post取消
- (void)postBatchCancel;
@end