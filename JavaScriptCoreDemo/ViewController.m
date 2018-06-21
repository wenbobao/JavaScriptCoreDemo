//
//  ViewController.m
//  JavaScriptCoreDemo
//
//  Created by bob on 2018/6/14.
//  Copyright © 2018年 wenbo. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "JSProtocolObj.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self test1];
    [self test3];
}

// OC调用JavaScript
- (void)test1 {
    JSContext *context = [[JSContext alloc] init];
    
    NSString *js = @"function add (a, b) {return a + b}";
    
    [context evaluateScript:js];
    
    JSValue *n = [context[@"add"] callWithArguments:@[@2, @3]];
    
    NSLog(@"js value is %@", @([n toInt32]));
}

//JavaScript调用OC  -- block
- (void)test2 {
    JSContext *context = [[JSContext alloc] init];
    context[@"add"] = ^(NSInteger a, NSInteger b) {
        NSLog(@"---%@", @(a + b));
    };
    [context evaluateScript:@"add(2,3)"];
}

//JavaScript调用OC  -- export协议
- (void)test3 {
    
    JSProtocolObj *obj = [[JSProtocolObj alloc] init];
    JSContext *context = [[JSContext alloc] init];
    context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        [JSContext currentContext].exception = exception;
        NSLog(@"exception:%@",exception);
    };
    
    context[@"OCObj"] = obj;
    // 下面的写法是错误的, 协议中定义的是add: b:，但是JS里面方法名字是addB(a,b)。
//    [context evaluateScript:@"OCObj.sum = OCObj.add(2,3)"];
    
    [context evaluateScript:@"OCObj.sum = OCObj.addB(2,3)"];
}

@end
