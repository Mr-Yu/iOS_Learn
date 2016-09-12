//
//  HttpTest.m
//  YNNetwork
//
//  Created by wapage-mac on 16/9/12.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//

#import "HttpTest.h"

@implementation HttpTest{
    NSString *_mobile;
}

- (id)initWithMobile:(NSString *)mobile{
    self = [super init];
    if(self){
        _mobile = mobile;
    }
    
    return self;
}

- (id)requestArgument{
    return @{
             @"mobile":_mobile
             };
}

- (NSString *)requestUrl{
    return @"";
}


@end
