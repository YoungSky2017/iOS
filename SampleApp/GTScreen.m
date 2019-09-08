//
//  GTScreen.m
//  SampleApp
//
//  Created by 杨奇 on 2019/8/17.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTScreen.h"

@implementation GTScreen

//iphone xs max
+ (CGSize)sizeFor65Inch{
    return CGSizeMake(414,896);
}

//iphone xr
+ (CGSize)sizeFor61Inch{
    return CGSizeMake(414,896);
}

// iphonex
+ (CGSize)sizeFor58Inch{
    return CGSizeMake(375,812);
}
//plus
//4 /5

@end
