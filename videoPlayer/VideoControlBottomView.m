//
//  VideoControlBottomView.m
//  videoPlayer
//
//  Created by wymany on 16/2/29.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import "VideoControlBottomView.h"
#import "Constant.h"

@interface VideoControlBottomView ()
@property (nonatomic,strong) UIButton *playButton;
@property (nonatomic,strong) UIButton *fullScreenButton;
@property (nonatomic,strong) UISlider *progressSlider;
@property (nonatomic,strong) UILabel *currentTimeLabel;
@property (nonatomic,strong) UILabel *totalTimeLabel;

@end

@implementation VideoControlBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        
        //添加播放按钮
        UIButton *playButton = [[UIButton alloc] init];
        [playButton setImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateSelected];
        [self addSubview:playButton];
        self.playButton = playButton;
        [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        
        //添加右边的zooming 按钮
        UIButton *fullScreenButton = [[UIButton alloc] init];
        [fullScreenButton setImage:[UIImage imageNamed:@"player_full"] forState:UIControlStateNormal];
        [fullScreenButton setImage:[UIImage imageNamed:@"player_small"] forState:UIControlStateHighlighted];
        [self addSubview:fullScreenButton];
        self.fullScreenButton = fullScreenButton;
        
        [fullScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15.0);
            make.centerY.mas_equalTo(0);
        }];
        
        
        
        //添加滚动条和时间的容器
        
        UIView *timeAndSliderContainer = [[UIView alloc] init];
//        timeAndSliderContainer.backgroundColor = [UIColor clearColor];
        timeAndSliderContainer.opaque = YES;
        [self addSubview:timeAndSliderContainer];
        [timeAndSliderContainer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(playButton.mas_right).offset(15);
            make.right.mas_equalTo(fullScreenButton.mas_left).offset(-15);
            make.centerY.mas_equalTo(0);
            make.height.mas_equalTo(32);
        }];
        
        //添加 slider
        
        UISlider *slider = [[UISlider alloc] init];
        [slider setThumbImage:[UIImage imageNamed:@"player_redbutton"] forState:UIControlStateNormal];
        [slider setThumbImage:[UIImage imageNamed:@"player_redbutton_down"] forState:UIControlStateHighlighted];
        slider.minimumTrackTintColor = [UIColor colorWithRed:0.937  green:0.255  blue:0.137 alpha:1];
        slider.maximumTrackTintColor = [UIColor colorWithRed:0.333  green:0.333  blue:0.333 alpha:1];
        [timeAndSliderContainer addSubview:slider];
        self.progressSlider = slider;
        [slider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(15);
        }];
        
        //添加时间标签
        UILabel *currentTimeLabel = [[UILabel alloc] init];
        currentTimeLabel.textColor = [UIColor blueColor];
        currentTimeLabel.textAlignment = NSTextAlignmentRight;
        currentTimeLabel.font = [UIFont systemFontOfSize:11];
        currentTimeLabel.text = @"00:00:00/";
        [timeAndSliderContainer addSubview:currentTimeLabel];
        self.currentTimeLabel = currentTimeLabel;
        
        [currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.width.mas_equalTo(60.0);
            make.top.mas_equalTo(slider.mas_bottom);
            make.bottom.mas_equalTo(0);
        }];

        UILabel *totalTimeLabel = [[UILabel alloc] init];
        totalTimeLabel.textColor = [UIColor blueColor];
        totalTimeLabel.textAlignment = NSTextAlignmentLeft;
        totalTimeLabel.font = [UIFont systemFontOfSize:11];
        totalTimeLabel.text = @"00:00:00";
        self.totalTimeLabel = totalTimeLabel;
        [timeAndSliderContainer addSubview:totalTimeLabel];
        
        
        [totalTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(currentTimeLabel.mas_right);
            make.width.height.mas_equalTo(currentTimeLabel);
            make.centerY.mas_equalTo(currentTimeLabel);
        }];
        

        
    }
    
    return self;
}
@end
