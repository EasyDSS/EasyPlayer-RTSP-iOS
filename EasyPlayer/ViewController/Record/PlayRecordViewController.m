//
//  PlayRecordViewController.m
//  EasyPlayerRTSP
//
//  Created by leo on 2018/3/14.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "PlayRecordViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface PlayRecordViewController ()

@property (nonatomic, retain) AVPlayerViewController *playerViewController;

@end

@implementation PlayRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationItem.title = [self.path substringFromIndex:self.path.length-18];
    
    NSURL *url = [NSURL fileURLWithPath:self.path];
    AVPlayer *avPlayer = [AVPlayer playerWithURL:url];
    // player的控制器对象
    _playerViewController = [[AVPlayerViewController alloc] init];
    // 控制器的player播放器
    _playerViewController.player = avPlayer;
    // 试图的填充模式
    _playerViewController.videoGravity = AVLayerVideoGravityResizeAspect;
    // 是否显示播放控制条
    _playerViewController.showsPlaybackControls = YES;
    // 设置显示的Frame
    _playerViewController.view.frame = self.view.bounds;
    // 将播放器控制器添加到当前页面控制器中
    [self addChildViewController:_playerViewController];
    // view一定要添加，否则将不显示
    [self.view addSubview:_playerViewController.view];
    // 播放
    [_playerViewController.player play];
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if (_playerViewController) {
        [_playerViewController.player pause];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
