//
//  UIView+Extension.h
//  DecoPhoto
//
//  Created by wuyun on 14-10-13.
//  Copyright (c) 2014年 PG. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  这个为了方便直接设置和赋值view的长宽高等
 */
@interface UIView (Extension)

/**
 *  x
 */
@property (nonatomic, assign) CGFloat x;
/**
 *  y
 */
@property (nonatomic, assign) CGFloat y;
/**
 *  maxX
 */
@property (nonatomic, assign) CGFloat maxX;
/**
 *  maxY
 */
@property (nonatomic, assign) CGFloat maxY;
/**
 *  centerX
 */
@property (nonatomic, assign) CGFloat centerX;
/**
 *  centerY
 */
@property (nonatomic, assign) CGFloat centerY;
/**
 *  width
 */
@property (nonatomic, assign) CGFloat width;
/**
 *  height
 */
@property (nonatomic, assign) CGFloat height;
/**
 *  size
 */
@property (nonatomic, assign) CGSize size;
@end
