//
//  KeyChainUtil.h
//  KeychainTest
//
//  Created by wapage-mac on 16/7/11.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//

#import "ViewController.h"

@interface KeyChainUtil : NSObject
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;


@end
