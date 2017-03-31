//
//  AppObject.m
//  xib
//
//  Created by 丫丫 on 17/3/31.
//  Copyright © 2017年 丫丫. All rights reserved.
//

#import "AppObject.h"

@implementation AppObject
- (instancetype) initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    
    return self;
}

+ (instancetype) appWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
