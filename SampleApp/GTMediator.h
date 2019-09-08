//
//  GTMediator.h
//  SampleApp
//
//  Created by 杨奇 on 2019/8/18.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocol <NSObject>

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

@interface GTMediator : NSObject

//target action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

//urlscheme
typedef void(^GTMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

//protol class
+ (void)registerProtol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtocol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
