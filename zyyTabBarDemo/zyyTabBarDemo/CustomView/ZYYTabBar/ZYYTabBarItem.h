//
//  ZYYTabBarItem.h
//  zyyTabBarDemo
//
//  Created by 郑玉洋 on 2017/4/20.
//  Copyright © 2017年 郑玉洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TabBarItemType) {
    TabBarItemNormal = 0,
    TabBarItemRise,
};

extern NSString *const kTabBarItemAttributeTitle;// NSString
extern NSString *const kTabBarItemAttributeNormalImageName;// NSString
extern NSString *const kTabBarItemAttributeSelectedImageName;// NSString
extern NSString *const kTabBarItemAttributeType;// NSNumber, LLTabBarItemType

@interface ZYYTabBarItem : UIButton

@property (nonatomic, assign) TabBarItemType tabBarItemType;

@end
