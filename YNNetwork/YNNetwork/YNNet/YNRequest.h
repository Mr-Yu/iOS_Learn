//
//  YNRequest.h
//  waye
//
//  Created by wapage-mac on 16/8/18.
//  Copyright © 2016年 neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YNNetworkingManager.h"

typedef void (^AFConstructingBlock)(id<AFMultipartFormData> formData);

@interface YNRequest : NSObject

@property (nonatomic, copy) NSDictionary *RequestData;

- (NSString *)requestUrl;
//设置请求方式，默认post
- (HTTPMethod)getHTTPMethod;
//解析json
- (id)responseJSONObject;
//上传数据
- (id)requestArgument;
//form表单传输
- (AFConstructingBlock)constructingBodyBlock;
@end
