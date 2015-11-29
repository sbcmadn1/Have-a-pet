//
//  YCCareSectionHeaderView.h
//  有宠ZJZ
//


#import <UIKit/UIKit.h>
@class CZStatuse;
@interface YCCareSectionHeaderView : UIView

@property (nonatomic,strong) CZStatuse *statuse;

+ (instancetype)sectionHeaderView;

@end
