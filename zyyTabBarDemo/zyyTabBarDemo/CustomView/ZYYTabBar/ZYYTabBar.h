//
//  ZYYTabBar.h
//  zyyTabBarDemo
//
//  Created by 郑玉洋 on 2017/4/20.
//  Copyright © 2017年 郑玉洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYYTabBarItem.h"

@protocol TabBarDelegate <NSObject>

- (void)tabBarDidSelectedRiseButton;

@end

@interface ZYYTabBar : UIView

@property (nonatomic, copy) NSArray<NSDictionary *> *tabBarItemAttributes;
@property (nonatomic, weak) id<TabBarDelegate> delegate;

@end
