//
//  YNNetworkConfig.h
//  waye
//
//  Created by wapage-mac on 16/8/18.
//  Copyright © 2016年 neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YNNetworkConfig : NSObject

+ (YNNetworkConfig *)sharedInstance;

@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic) NSString *cdnUrl;

@end
