//
//  YNNetworkConfig.m
//  waye
//
//  Created by wapage-mac on 16/8/18.
//  Copyright © 2016年 neusoft. All rights reserved.
//

#import "YNNetworkConfig.h"
#import "YNRequest.h"

@implementation YNNetworkConfig{
    YNNetworkConfig *_config;
}


+ (YNNetworkConfig *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//- (id)init {
//    self = [super init];
//    if (self) {
//        _config = [YNNetworkConfig sharedInstance];
////        _requestsRecord = [NSMutableDictionary dictionary];
//    }
//    return self;
//}



@end
