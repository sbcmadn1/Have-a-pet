//
//  YCMesBaseCell.h
//  有宠ZJZ
//
//  Created by apple on 15/9/26.


#import <UIKit/UIKit.h>



@class YCMessageItem;
@interface YCMesBaseCell : UITableViewCell

+ (instancetype) cellWithTableView: (UITableView *) tableView;
/**
 *  是否显示分割线 YES:显示 NO:不显示
 */
@property(nonatomic,assign) BOOL showLineView;
/**
 *  定义一个模型属性用来接收外界传入的属性,因为这个是cell的一个设置显示的内容，相当是他的一个属性
 */
@property (nonatomic,strong) YCMessageItem *item;
@end
