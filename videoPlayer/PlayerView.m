
//
//  PlayerView.m
//  videoPlayer
//
//  Created by wymany on 16/2/29.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import "PlayerView.h"
#import <Masonry.h>
#import "VideoControlBottomView.h"
#import "VideoPlayerLayerView.h"
#import "VideoControlTopView.h"

@interface PlayerView ()
@property (nonatomic,strong) UIView *viedoPlayerHoldView;

@property (nonatomic,strong) UIView *controlHolderView;
@property (nonatomic,strong) VideoControlTopView *topControlHolderView;
@property (nonatomic,strong) VideoControlBottomView *bottomControlHolderView;
@property (nonatomic,strong) VideoPlayerLayerView *playerLayerView;

@property (nonatomic,strong) AVPlayer *player;


@end

@implementation PlayerView


#pragma mark - init

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (instancetype)init
{
    if (self = [super init])
    {
        
        //添加
        //添加整个 holderView
        //添加最底层的播放 view
        
        VideoPlayerLayerView *playerLayerView = [[VideoPlayerLayerView alloc] init];
        [self addSubview:playerLayerView];
        self.playerLayerView = playerLayerView;
        NSURL *url = [NSURL URLWithString:@"http://krtv.qiniudn.com/150522nextapp"];
        AVAsset * asset = [AVAsset assetWithURL:url];
        AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithAsset:asset];
        
        
        AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
        self.player = player;
        [playerLayerView setAvPlayer:player];
        [player play];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        playerLayer.needsDisplayOnBoundsChange =  YES;
        

        [playerLayerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        
        

        UIView  *controlHolderView = [[UIView alloc] init];
        self.controlHolderView = controlHolderView;
        controlHolderView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.controlHolderView];
        [controlHolderView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.edges.equalTo(self).insets(UIEdgeInsetsZero);
        }];
        
        
        //添加底部控制条
        VideoControlBottomView *bottomControlHolderView = [[VideoControlBottomView alloc] init];
        bottomControlHolderView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
        
        self.bottomControlHolderView = bottomControlHolderView;
        [controlHolderView addSubview:self.bottomControlHolderView];
        [bottomControlHolderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
        //添加底部控制条
        VideoControlTopView *topControlHolderView = [[VideoControlTopView alloc] init];
        topControlHolderView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
        [controlHolderView addSubview:topControlHolderView];
        
        [topControlHolderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(47);
        }];
        
        
    }
    
    return self;
}

- (void)updateConstraints
{
    [super updateConstraints];
}





@end
