//
//  CZStatuseCell.h
//  15-微博案例（屏幕适配）
//


#import <UIKit/UIKit.h>

@class CZStatuse;
@interface CZStatuseCell : UITableViewCell

@property (nonatomic,strong) CZStatuse *statuse;

/**
 *  1.如果采用连线方式使指针对象指向一个同类型的对象，可以使用weak属性，因为这时候被连线的对象是全局的
 *  2.如果采用写代码创建一个同类型的对象，并赋值给该对象的话，属性必须是strong，因为代码创建的对象是局部的，必须用一个强指针执行，不然出了方法体就会被释放
 */

//@property (weak, nonatomic) IBOutlet UILabel *textView;

@property (nonatomic,assign) CGFloat pictureHeight;


@end
