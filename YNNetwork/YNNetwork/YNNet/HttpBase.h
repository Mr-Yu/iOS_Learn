//
//  HttpBase.h
//  YNNetwork
//
//  Created by wapage-mac on 16/9/12.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//


#import "YNNetwork.h"

@interface HttpBase : YNRequest

- (NSString *)msg;
- (NSNumber *)code;

- (id)data;
- (id)data_amount;
- (id)data_money;

- (NSString*)stringForKey:(NSString*)key;
- (id)objectForKey:(NSString*)key;

//json解析
- (id)JSONObject:(NSDictionary *)dic;
@end
