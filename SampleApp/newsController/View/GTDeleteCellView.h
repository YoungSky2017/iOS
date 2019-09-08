//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by 杨奇 on 2019/8/12.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView


- (void)showDeleteViewFromPoint:(CGPoint )point clickBlock:(dispatch_block_t )clickBlock;

@end

NS_ASSUME_NONNULL_END
