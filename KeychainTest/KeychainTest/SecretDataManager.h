//
//  SecretDataManager.h
//  KeychainTest
//
//  Created by wapage-mac on 16/7/11.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//

#import "ViewController.h"

@interface SecretDataManager : NSObject
/**
 *    @brief    存储密码
 *
 *    @param     password     密码内容
 */
+(void)savePassWord:(NSString *)password;

/**
 *    @brief    读取密码
 *
 *    @return    密码内容
 */
+(id)readPassWord;

/**
 *    @brief    删除密码数据
 */
+(void)deletePassWord;

@end
