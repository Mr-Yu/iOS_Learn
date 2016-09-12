//
//  YNRequest.m
//  waye
//
//  Created by wapage-mac on 16/8/18.
//  Copyright © 2016年 neusoft. All rights reserved.
//

#import "YNRequest.h"

@implementation YNRequest

- (NSString *)requestUrl{
    return @"";
}

//设置请求方式，默认post
- (HTTPMethod)getHTTPMethod{
    return POST;
}

- (id)responseJSONObject
{
    if ([self isKindOfClass:[NSString class]]) {
        return [NSJSONSerialization JSONObjectWithData:[((NSString *)self) dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    } else if ([self isKindOfClass:[NSData class]]) {
        return [NSJSONSerialization JSONObjectWithData:(NSData *)self options:kNilOptions error:nil];
    }
    
    return self;
}

//上传数据
- (id)requestArgument{
    return @"";
}

- (AFConstructingBlock)constructingBodyBlock{
    return nil;
}


@end
