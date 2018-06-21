//
//  JSProtocolObj.h
//  JavaScriptCoreDemo
//
//  Created by bob on 2018/6/14.
//  Copyright © 2018年 wenbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

//定义一个JSExport protocol
@protocol JSExportTest <JSExport>

- (NSInteger)add:(NSInteger)a b:(NSInteger)b;

@property (nonatomic, assign) NSInteger sum;

@end


@interface JSProtocolObj : NSObject <JSExportTest>

@end
