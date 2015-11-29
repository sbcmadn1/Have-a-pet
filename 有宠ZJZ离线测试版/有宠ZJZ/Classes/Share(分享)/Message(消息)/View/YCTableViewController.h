//
//  YCTableViewController.h
//  有宠ZJZ
//


#import <UIKit/UIKit.h>
#import "YCMesBaseTableViewController.h"
#import "YCMessageItem.h"
#import "YCMessageItemArrow.h"
#import "YCMessageGroup.h"
@interface YCTableViewController : YCMesBaseTableViewController

//@property(nonatomic,assign) NSInteger index;
+(instancetype) TableViewController;
@property (nonatomic,strong) UISegmentedControl *segmentedControl;
@end
