//
//  ZYYTabBar.m
//  zyyTabBarDemo
//
//  Created by 郑玉洋 on 2017/4/20.
//  Copyright © 2017年 郑玉洋. All rights reserved.
//

#import "ZYYTabBar.h"

@interface ZYYTabBar()

@property (strong, nonatomic) NSMutableArray *tabBarItems;

@end

@implementation ZYYTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    
    return self;
}

- (void)config{
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, SCREEN_WIDTH, 5)];
    topLine.image = [UIImage imageNamed:@"tapbar_top_line"];
    [self addSubview:topLine];
    
}

- (void)setSelectedIndex:(NSInteger)index {
    for (ZYYTabBarItem *item in _tabBarItems) {
        if (item.tag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
}

#pragma mark - Touch Event

- (void)itemSelected:(ZYYTabBarItem *)sender {
    if (sender.tabBarItemType != TabBarItemRise) {
        [self setSelectedIndex:sender.tag];
    } else {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedRiseButton)]) {
                [self.delegate tabBarDidSelectedRiseButton];
            }
        }
    }
}

- (void)setTabBarItemAttributes:(NSArray<NSDictionary *> *)tabBarItemAttributes{
    _tabBarItemAttributes = tabBarItemAttributes.copy;
    
    CGFloat normalItemWidth = (SCREEN_WIDTH * 3 / 4) / (_tabBarItemAttributes.count - 1);
    CGFloat tabBarHeight = CGRectGetHeight(self.frame);
    CGFloat publishItemWidth = (SCREEN_WIDTH / 4);
    
    NSInteger itemTag = 0;
    BOOL passedRiseItem = NO;
    
    _tabBarItems = [NSMutableArray arrayWithCapacity:_tabBarItemAttributes.count];
    
    for (id item in _tabBarItemAttributes) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSDictionary *itemDict = (NSDictionary *)item;
            
            TabBarItemType type = [itemDict[kTabBarItemAttributeType] integerValue];
            
            CGRect frame = CGRectMake(itemTag * normalItemWidth + (passedRiseItem ? publishItemWidth : 0), 0, type == TabBarItemRise ? publishItemWidth : normalItemWidth, tabBarHeight);
            
            ZYYTabBarItem *tabBarItem = [self tabBarItemWithFrame:frame
                                                           title:itemDict[kTabBarItemAttributeTitle]
                                                 normalImageName:itemDict[kTabBarItemAttributeNormalImageName]
                                               selectedImageName:itemDict[kTabBarItemAttributeSelectedImageName]
                                                  tabBarItemType:[itemDict[kTabBarItemAttributeType] integerValue]];
            if (itemTag == 0) {
                tabBarItem.selected = YES;
            }
            
            [tabBarItem addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
            
            if (tabBarItem.tabBarItemType != TabBarItemRise) {
                tabBarItem.tag = itemTag;
                itemTag++;
            } else {
                passedRiseItem = YES;
            }
            
            [_tabBarItems addObject:tabBarItem];
            [self addSubview:tabBarItem];
        }
    }
}

- (ZYYTabBarItem *)tabBarItemWithFrame:(CGRect)frame
                                 title:(NSString *)title
                       normalImageName:(NSString *)normalImageName
                     selectedImageName:(NSString *)selectedImageName
                        tabBarItemType:(TabBarItemType)tabBarItemType {
    
    ZYYTabBarItem *item = [[ZYYTabBarItem alloc] initWithFrame:frame];
    
    //文字
    item.titleLabel.font = [UIFont systemFontOfSize:8];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
    //图片
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    //类型
    item.tabBarItemType = tabBarItemType;
    
    return item;
}

@end
