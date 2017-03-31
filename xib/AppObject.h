//
//  AppObject.h
//  xib
//
//  Created by 丫丫 on 17/3/31.
//  Copyright © 2017年 丫丫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppObject : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;
@end
