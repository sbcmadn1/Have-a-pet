//
//  YCMesBaseCell.m
//  有宠ZJZ
//
//  Created by apple on 15/9/26.


#import "YCMesBaseCell.h"
#import "YCMessageItem.h"
#import "YCMessageItemArrow.h"

@interface YCMesBaseCell()
/**
 *  分割线
 */
@property (nonatomic, strong) UIView *lineView;
/**
 *  开关
 */
@property (nonatomic,strong) UISwitch * st;
/**
 *  箭头
 */
@property (nonatomic,strong) UIImageView *arrowView;
/**
 *  文本标签
 */
@property (nonatomic,strong) UILabel *lableView;
@end


@implementation YCMesBaseCell

#pragma mark ---懒加载控件---------------
/**
 *  分割线
 *
 *  @return <#return value description#>
 */
- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
        _lineView.alpha = 0.3;
    }
    return _lineView;
}
/**
 *  开关
 *
 *
 */
- (UISwitch *)st
{
    if (_st==nil) {
        _st=[[UISwitch alloc]init];
    }
    
    return _st;
    
}
/**
 *  箭头
 *
 */
- (UIImageView *)arrowView
{
    if (_arrowView==nil) {
        _arrowView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _arrowView;
    
    
}
/**
 *  文本标签
 *
 */
- (UILabel *)lableView
{
    if (_lableView==nil)
    {
        _lableView=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        _lableView.textColor=[UIColor grayColor];
        //_lableView.backgroundColor=[UIColor redColor];
        _lableView.textAlignment = NSTextAlignmentRight;
    }
    
    return _lableView;
    
}
/**
 *
 *cell 的加载方法
 *
 */
+ (instancetype) cellWithTableView: (UITableView *) tableView
{
    //创建重用标示
    static  NSString * ID =@"setting";
    //创建cell
    YCMesBaseCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil)
    {
        cell =[[YCMesBaseCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}
/**
 *重写cell 的创建方法
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setup];
    }
    
    
    
    return  self;
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder])
    {
        [self setup];
    }
    
    return self;
}
- (void)setup
{
    
    //设置文本标签的标题
    self.textLabel.font=[UIFont systemFontOfSize:16];
    //设置颜色
    self.textLabel.textColor=[UIColor blackColor];
    //默认状态显示控件
    UIView *bgView=[[UIView alloc]init];
    bgView.backgroundColor=[UIColor whiteColor];
    self.backgroundView=bgView;
    //设置选中颜色
    UIView *selectedView=[[UIView alloc]init];
    selectedView.backgroundColor=[UIColor lightGrayColor];
    self.selectedBackgroundView=selectedView;
    //创建分割线
    
    [self.contentView addSubview:self.lineView];
    //设置小标题的文字颜色和大小
    self.detailTextLabel.textColor=[UIColor grayColor];
    self.detailTextLabel.font=[UIFont systemFontOfSize:11];
    
    
    
}
/**
 *  重写数据源方法
 */
- (void) setItem:(YCMessageItem *) item
{
    _item=item;
    //设置数据
    [self setupData];
    //设置右边显示的内容
    [self setupRightAccessoryView];
    
    
}
/**
 *  设置子控件需要展示的数据
 */
- (void) setupData
{
    self.textLabel.text=_item.title;
    self.imageView.image=[UIImage imageNamed:_item.icon];
    self.detailTextLabel.text=_item.subTitle;
    
}
/**
 *  布局cell右边需要显示的数据
 */
- (void) setupRightAccessoryView
{
    self.selectionStyle=[_item isKindOfClass:[YCMessageItemArrow class]]?UITableViewCellSelectionStyleDefault:
    UITableViewCellSelectionStyleNone;
    
    if ([_item isKindOfClass:[YCMessageItemArrow class]])
    {
        self.accessoryView=self.arrowView;
        
    }
//    else if([_item isKindOfClass:[JYSettingItemSwith class]])
//    {
//        self.accessoryView=self.st;
//        
//    }
//    else  if([_item isKindOfClass:[JYSettingItemLable class]])
//    {
//        
//        
//        JYSettingItemLable *labelText=(JYSettingItemLable *)_item;
//        self.lableView.text=labelText.text;
//        self.accessoryView=self.lableView;
//    }
    else
    {
        self.accessoryView=nil;
    }
    
}
- (void)layoutSubviews
{
    [super  layoutSubviews];
    //计算分割线的frame
    CGFloat lineX=self.textLabel.frame.origin.x;
    CGFloat lineH=1;
    CGFloat lineY=self.frame.size.height-lineH;
    CGFloat lineW=self.frame.size.width-lineX;
    self.lineView.frame=CGRectMake(lineX, lineY, lineW, lineH);
    
    
}
- (void)setShowLineView:(BOOL)showLineView {
    _showLineView = showLineView;
    self.lineView.hidden = !showLineView;
}
@end
