//
//  GTDeleteCellView.m
//  SampleApp
//
//  Created by 杨奇 on 2019/8/12.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()

@property (nonatomic, strong, readwrite)UIView *backgroundView;
@property (nonatomic, strong, readwrite)UIButton *deleteButton;
@property (nonatomic, copy, readwrite)dispatch_block_t deleteBlock;

@end

@implementation GTDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.6;
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroundView;
        })];
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
        
        
    }
    return self;
}
- (void)showDeleteViewFromPoint:(CGPoint )point clickBlock:(dispatch_block_t )clickBlock{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    _deleteBlock = [clickBlock copy];
    
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
//        self.deleteButton.frame = CGRectMake((self.frame.size.width - 200) / 2, (self.frame.size.height - 200) / 2, 200, 200);
    }];
}

- (void)dismissDeleteView {
    [self removeFromSuperview];
}

- (void)_clickButton {
    if (_deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}
@end
