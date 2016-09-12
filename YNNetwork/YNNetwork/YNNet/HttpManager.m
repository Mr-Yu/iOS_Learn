//
//  HttpManager.m
//  YNNetwork
//
//  Created by wapage-mac on 16/9/12.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//


#import "HttpManager.h"
#import "iToast.h"


@implementation HttpManager{
    //    YTKBatchRequest *_batchRequest;
}

+ (HttpManager *)sharedManager {
    static HttpManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[HttpManager alloc] init];
        [_sharedManager setupInit];
    });
    
    return _sharedManager;
}

-(void)setupInit{
    [self setBaseUrl];
    //    _batchRequest = [[YTKBatchRequest alloc] init];
}

- (void)setBaseUrl{
    //在这里设置baseurl
    YNNetworkConfig *config = [YNNetworkConfig sharedInstance];
    config.baseUrl = @"";
}

//Post 请求
-(void)postForRequest:(YNRequest *)request callback:(rsponseCallback)callback{
    if ([request constructingBodyBlock] == nil) {
        [self requestWithMethod:[request getHTTPMethod] WithPath:[self requestUrl:request] WithParams:[request requestArgument] WithSuccessBlock:^(NSDictionary *dic) {
            NSLog(@"%@", dic);
            request.RequestData = dic;
            if (callback!=nil)
                callback(request , YES);
        } WithFailurBlock:^(NSError *error) {
            [[iToast makeText:@"亲，您的网络不给力呦"] show];
            if (callback!=nil)
                callback(request , NO);
        }];
    }else{
        [self requestWithMethod:[request getHTTPMethod] WithPath:[self requestUrl:request] WithParams:[request requestArgument] WithForm:[request constructingBodyBlock] WithSuccessBlock:^(NSDictionary *dic) {
            NSLog(@"%@", dic);
            request.RequestData = dic;
            if (callback!=nil)
                callback(request , YES);
        } WithFailurBlock:^(NSError *error) {
            [[iToast makeText:@"亲，您的网络不给力呦"] show];
            if (callback!=nil)
                callback(request , NO);
        }];
    }
}

//Post 取消
- (void)postCancel:(id)request{
    //    if (request != nil){
    //        if ([request isExecuting]){
    //            [request stop];
    //        }
    //    }
}

//批量发送Post
- (void)postBatchRequest:(NSArray*)requests callback:(rsponseBatchCallback)callback{
    //    _batchRequest = [[YTKBatchRequest alloc] initWithRequestArray:requests];
    //    [_batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
    //        if (callback != nil)
    //            callback(batchRequest.requestArray,YES);
    //    } failure:^(YTKBatchRequest *batchRequest) {
    //        if (callback != nil)
    //        callback(batchRequest.requestArray, NO);
    //        [[iToast makeText:@"亲，您的网络不给力呦"] show];
    //    }];
}

//批量发送Post取消
- (void)postBatchCancel{
    //    if (_batchRequest != nil){
    //        [_batchRequest stop];
    //    }
}

- (NSString *)requestUrl:(YNRequest *)request{
    NSString *requestUrl = @"";
    YNNetworkConfig *config = [YNNetworkConfig sharedInstance];
    requestUrl = [NSString stringWithFormat:@"%@%@",config.baseUrl,[request requestUrl]];
    return requestUrl;
}

@end

