
//
//  VideoControlTopView.m
//  videoPlayer
//
//  Created by wymany on 16/2/29.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import "VideoControlTopView.h"
#import "Constant.h"

@interface VideoControlTopView ()
@property (nonatomic,strong) UIButton *navBackIndicatorBtn;
@end

@implementation VideoControlTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //添加返回 Button
        UIButton *navBackIndicatorBtn = [UIButton new];
        [navBackIndicatorBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [navBackIndicatorBtn setImage:[UIImage imageNamed:@"player_back"] forState:UIControlStateHighlighted];
        [self addSubview:navBackIndicatorBtn];
        self.navBackIndicatorBtn = navBackIndicatorBtn;
        
        [navBackIndicatorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        
    }
    return self;
}



@end
