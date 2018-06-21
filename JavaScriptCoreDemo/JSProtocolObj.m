//
//  JSProtocolObj.m
//  JavaScriptCoreDemo
//
//  Created by bob on 2018/6/14.
//  Copyright © 2018年 wenbo. All rights reserved.
//

#import "JSProtocolObj.h"

@implementation JSProtocolObj

@synthesize sum = _sum;

- (NSInteger)add:(NSInteger)a b:(NSInteger)b {
    return a + b;
}

- (void)setSum:(NSInteger)sum
{
    NSLog(@"--%@", @(sum));
    _sum = sum;
}

@end
