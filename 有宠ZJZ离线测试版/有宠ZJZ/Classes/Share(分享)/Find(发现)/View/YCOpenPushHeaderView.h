//
//  YCOpenPushHeaderView.h
//  有宠ZJZ
//
//  Created by li on 15/9/28.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YCOpenPushHeaderView;
@protocol YCOpenPushHeaderViewDelegate <NSObject>

@optional
-(void)OpenPushHeaderViewBtn:(YCOpenPushHeaderView *)open;

@end

@interface YCOpenPushHeaderView : UIView
@property(nonatomic,weak)id<YCOpenPushHeaderViewDelegate>delegate;
+(instancetype)OpenPushHeaderView;
@end
