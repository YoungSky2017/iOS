//
//  GTNotification.h
//  SampleApp
//
//  Created by 杨奇 on 2019/8/21.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTNotification : NSObject

+ (GTNotification *)notificationManager;
- (void)checkNotificationAuthorization;

@end

NS_ASSUME_NONNULL_END
