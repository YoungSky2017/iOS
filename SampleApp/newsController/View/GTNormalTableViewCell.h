//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by 杨奇 on 2019/5/21.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTListItem;
NS_ASSUME_NONNULL_BEGIN

/**
 s点击删除按钮
 */
@protocol GTNormalTableViewCellDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end

/**
 新闻列表cell
 */
@interface GTNormalTableViewCell : UITableViewCell
@property (nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;
- (void) layoutTableViewCellWithItem:(GTListItem *)item;
@end

NS_ASSUME_NONNULL_END
