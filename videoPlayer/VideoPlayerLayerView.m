

//
//  ViedoPlayerLayerView.m
//  videoPlayer
//
//  Created by wymany on 16/2/29.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import "VideoPlayerLayerView.h"
#import <AVFoundation/AVFoundation.h>

@implementation VideoPlayerLayerView

+ (Class)layerClass
{
    return [AVPlayerLayer class];
}

- (void)setAvPlayer:(AVPlayer *)avPlayer
{
    [(AVPlayerLayer *) [self layer] setPlayer:avPlayer];
}

@end
