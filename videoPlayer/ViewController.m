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
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic,strong) PlayerView *playerView;
@property (nonatomic,strong) MASConstraint *topConstraint;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    PlayerView *playerView = [[PlayerView alloc] init];
    playerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:playerView];
    self.playerView = playerView;
    [self.playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(20.0);
        make.height.mas_equalTo(playerView.mas_width).multipliedBy(0.5625);
    }];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.alwaysBounceVertical = NO;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"videoCell"];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(playerView.mas_bottom).with.priorityLow();
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell" forIndexPath:indexPath];
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%zd 行",indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *redView = [UIView new];
    redView.alpha = 0.6;
    redView.backgroundColor = [UIColor redColor];
    return redView;
}

#pragma mark - observe

- (void)deviceOrientationChanged:(NSNotification *)note
{
    [self.view updateConstraintsIfNeeded];
    [self.view setNeedsUpdateConstraints];

}








@end
