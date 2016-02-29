//
//  ViewController.m
//  videoPlayer
//
//  Created by wymany on 16/2/29.
//  Copyright © 2016年 wymany. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>
#import "UIView+Extension.h"
#import "MacroDefinition.h"
#import "PlayerView.h"
#import <Masonry.h>

@interface ViewController ()
@property (nonatomic,strong) PlayerView *playerView;
@property (nonatomic,strong) MASConstraint *topConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PlayerView *playerView = [[PlayerView alloc] init];
    playerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:playerView];
    self.playerView = playerView;
    [self.playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(20.0);
        make.height.mas_equalTo(self.playerView.mas_width).multipliedBy(0.5625);
    }];
    
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)updateViewConstraints
{
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    [self.playerView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (UIDeviceOrientationIsLandscape(orientation))
        {
            make.top.mas_equalTo(self.view).offset(0);
        }
        else
        {
            make.top.mas_equalTo(self.view).offset(20.0);
        }

    }];
    [super updateViewConstraints];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
