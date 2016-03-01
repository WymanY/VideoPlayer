
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
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *logoImagview;
@end

@implementation VideoControlTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //添加返回 Button
        UIButton *navBackIndicatorBtn = [UIButton new];

        
        [navBackIndicatorBtn setImage:[UIImage imageNamed:@"icon_back02"] forState:UIControlStateNormal];
        navBackIndicatorBtn.tintColor = [UIColor whiteColor];
        [self addSubview:navBackIndicatorBtn];
        self.navBackIndicatorBtn = navBackIndicatorBtn;
        
        [navBackIndicatorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        //添加右边的 Logo
        
        UIImageView *logoImageView = [UIImageView new];
        [self addSubview:logoImageView];
        logoImageView.image = [UIImage imageNamed:@"player_logo_full"];
        self.logoImagview = logoImageView;
        
        [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 40));
            make.right.mas_equalTo(-5);
            make.top.mas_equalTo(0);
        }];
        
        
        //添加标题按钮
        UILabel *titleLabel = [UILabel new];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = @"恭喜小李子获得了这次的奥斯卡的大奖小金杯子";
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(navBackIndicatorBtn.mas_right).offset(5);
            make.right.mas_equalTo(logoImageView.mas_left);
            make.top.bottom.equalTo(self);

        }];
    }
    return self;
}



@end
