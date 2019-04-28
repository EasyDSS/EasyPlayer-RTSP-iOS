//
//  RecordViewController.h
//  EasyRTSP
//
//  Created by mac on 2018/7/9.
//  Copyright © 2018年 phylony. All rights reserved.
//

#import "BaseViewController.h"

/**
 录像文件夹
 */
@interface RecordViewController : BaseViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, assign) int currentIndex;
@property (nonatomic, copy) NSString *url;

- (instancetype) initWithStoryborad;

@end
