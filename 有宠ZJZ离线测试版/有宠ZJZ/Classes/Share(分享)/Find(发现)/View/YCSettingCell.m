//
//  YCSettingCell.m
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import "YCSettingCell.h"
#import "YCSettingItem.h"
#import "YCSettingItemSwitch.h"
#import "YCSettingItemArrow.h"
#import "YCSettingItemLabel.h"
@interface YCSettingCell()
/**
 *  箭头
 */
@property(nonatomic,strong) UIImageView *arrowView;
/**
 *  开关
 */
@property(nonatomic,strong) UISwitch *st;
/**
 *  分割线
 */
@property(nonatomic,strong) UIView *lineView;
/**
 *  文本标签
 */
@property(nonatomic,strong) UILabel *labelView;
@end



@implementation YCSettingCell
#pragma mark - 懒加载控件
- (UILabel *)labelView {
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        _labelView.textColor =YCSameColor(124);
        _labelView.textAlignment = NSTextAlignmentRight;
        _labelView.font = YCWshySize(14);
    }
    return _labelView;
}
- (UIImageView *)arrowView {
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _arrowView;
}

- (UISwitch *)st {
    if (_st == nil) {
        _st = [[UISwitch alloc] init];
        // 监听开关值的关闭
        [_st addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    }
    return _st;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor blackColor];
        _lineView.alpha = 0.2;
    }
    return _lineView;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"setting";
    YCSettingCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    // 设置文本标签的字体
    self.textLabel.font = YCWshySize(14);
    // 设置颜色
    self.textLabel.textColor = YCSameColor(102);
    
    self.detailTextLabel.font = YCWshySize(11);
    self.detailTextLabel.textColor = YCColor(119, 75, 56);
    
    // 默认状态显示的控件
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bgView;
    // 设置选中后显示的控件
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = [UIColor yellowColor];
    self.selectedBackgroundView = selectedView;
    
    // 创建分割线
    [self.contentView addSubview:self.lineView];
}

- (void)setItem:(YCSettingItem *)item {
    _item = item;
    // 设置数据
    [self setupData];
    // 设置右边显示的内容
    [self setupRightAccessoryView];
}
/**
 *  设置子控件数据
 */
- (void)setupData{
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
    if (_item.icon) {
        self.imageView.image = [UIImage imageNamed:_item.icon];
    } else {
        self.imageView.image = nil;
    }
}
/**
 *  设置cell右边显示的附件
 */
- (void)setupRightAccessoryView{
    self.selectionStyle = [_item isKindOfClass:[YCSettingItemArrow class]]? UITableViewCellSelectionStyleDefault:UITableViewCellSelectionStyleNone;
    if ([_item isKindOfClass:[YCSettingItemArrow class]]) { // 箭头
        self.accessoryView = self.arrowView;
    } else if ([_item isKindOfClass:[YCSettingItemSwitch class]]) { // 开关
        YCSettingItemSwitch *stItem = (YCSettingItemSwitch *)_item;
        self.st.on = stItem.on;
        self.accessoryView = self.st;
    } else if([_item isKindOfClass:[YCSettingItemLabel class]]) { // 文本标签
        YCSettingItemLabel *lableItem = (YCSettingItemLabel *)_item;
        // 设置文本标签内容
        self.labelView.text = lableItem.text;
        self.accessoryView = self.labelView;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 计算分割线的frame
    CGFloat lineX = self.textLabel.frame.origin.x;
    CGFloat lineH = 0.5;
    CGFloat lineY = self.frame.size.height - lineH;
    CGFloat lineW = self.frame.size.width - lineX;
    self.lineView.frame = CGRectMake(lineX, lineY, lineW, lineH);
}

- (void)setShowLineView:(BOOL)showLineView {
    _showLineView = showLineView;
    self.lineView.hidden = !showLineView;
}

/**
 *  监听开关值的改变
 */
- (void)valueChanged{
    YCSettingItemSwitch *stItem = (YCSettingItemSwitch *)_item;
    stItem.on = self.st.on;
    // 通知控制器
    if(stItem.stBlock) {
        stItem.stBlock(stItem.on);
    }
}

@end
