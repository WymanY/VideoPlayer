//
//  VideoControlTopView.h
//  videoPlayer
//
//  Created by wymany on 16/2/29.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoControlTopView : UIView

/**
 *  是否是横屏状态
 */
@property (nonatomic,assign) BOOL landScapeState;

/**
 *  加载标题
 */
@property (nonatomic,copy) NSString *title;

@end
