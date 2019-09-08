//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by 杨奇 on 2019/5/26.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMediator.h"

/**
 文章底层页面
 */
@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocol>

- (instancetype)initWithUrlString:(NSString *)urlString;

@end
