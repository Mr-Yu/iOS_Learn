//
//  SecretDataManager.m
//  KeychainTest
//
//  Created by wapage-mac on 16/7/11.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//

#import "SecretDataManager.h"
#import "KeyChainUtil.h"
@interface SecretDataManager ()

@end

@implementation SecretDataManager
static NSString * const KEY_IN_KEYCHAIN = @"com.youshaa.app.allinfo";
static NSString * const KEY_PASSWORD = @"com.youshaa.app.password";

+(void)savePassWord:(NSString *)password
{
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:password forKey:KEY_PASSWORD];
    [KeyChainUtil save:KEY_IN_KEYCHAIN data:usernamepasswordKVPairs];
}

+(id)readPassWord
{
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[KeyChainUtil load:KEY_IN_KEYCHAIN];
    return [usernamepasswordKVPair objectForKey:KEY_PASSWORD];
}

+(void)deletePassWord
{
    [KeyChainUtil delete:KEY_IN_KEYCHAIN];
}

@end
