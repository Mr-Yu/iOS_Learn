//
//  HttpBase.m
//  YNNetwork
//
//  Created by wapage-mac on 16/9/12.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//

#import "HttpBase.h"

@implementation HttpBase

- (HTTPMethod)getHTTPMethod {
    return POST;
}

- (NSString *)msg{
    return [[self JSONObject:self.RequestData] objectForKey:@"msg"];
}

- (NSNumber *)code{
    return [[self JSONObject:self.RequestData] objectForKey:@"code"];
}

- (id)data{
    return [[self JSONObject:self.RequestData] objectForKey:@"data"];
}
- (id)data_amount{
    return [[self JSONObject:self.RequestData] objectForKey:@"data_amount"];
}
- (id)data_money{
    return [[self JSONObject:self.RequestData] objectForKey:@"data_money"];
}

- (id)objectForKey:(NSString*)key{
    return [[self JSONObject:self.RequestData] objectForKey:key];
}

- (NSString*)stringForKey:(NSString*)key{
    return [self objectForKey:key];
}

- (id)JSONObject:(NSDictionary *)dic
{
    if ([self isKindOfClass:[NSString class]]) {
        return [NSJSONSerialization JSONObjectWithData:[((NSString *)dic) dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    } else if ([self isKindOfClass:[NSData class]]) {
        return [NSJSONSerialization JSONObjectWithData:(NSData *)dic options:kNilOptions error:nil];
    } else {
        return dic;
    }
}

@end
