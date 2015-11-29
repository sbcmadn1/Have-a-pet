//
//  YCShareNavigationBarView.h
//  有宠1.0
//


#import <UIKit/UIKit.h>

typedef enum {
    YCShareTypeCarefully,
    YCShareTypeAttention,
    YCShareTypeNew
}YCShareType;

@class YCShareNavigationBarView;
@protocol YCShareNavigationBarViewDelegate <NSObject>
@optional
- (void)shareNavigationBarView:(YCShareNavigationBarView *)barView DidClickBtnType:(YCShareType)type;
@end

@interface YCShareNavigationBarView : UIView
@property (nonatomic,assign) CGFloat offsetX;
@property (nonatomic,weak) id<YCShareNavigationBarViewDelegate> delegate;

+ (instancetype)shareNavigationBarView;

@end
