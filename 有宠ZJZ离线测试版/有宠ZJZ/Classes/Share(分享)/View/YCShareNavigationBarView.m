//
//  YCShareNavigationBarView.m
//  有宠1.0
//


#import "YCShareNavigationBarView.h"
//线两端超出字体的长度
#define beyondLength (self.attentionBtn.frame.origin.x-CGRectGetMaxX(self.chosenBtn.frame))*0.5

@interface YCShareNavigationBarView ()

@property (weak, nonatomic) IBOutlet UIButton *chosenBtn;

@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;

@property (weak, nonatomic) IBOutlet UIButton *firstNewBtn;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,assign) CGFloat originalLineX;

@end


@implementation YCShareNavigationBarView

+ (instancetype)shareNavigationBarView
{
    return [[NSBundle mainBundle]loadNibNamed:@"YCShareNavigationBarView" owner:nil options:nil].lastObject;
}

- (UIView *)lineView
{
    if (_lineView==nil)
    {
        _lineView=[[UIView alloc]init];
        _lineView.backgroundColor=[UIColor whiteColor];
    }
    return _lineView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
   
    CGFloat lineW=self.chosenBtn.frame.size.width+2*beyondLength;
    CGFloat lineX=self.chosenBtn.frame.origin.x-beyondLength-2;
    self.originalLineX=lineX;
    CGFloat lineY=62;
    CGFloat lineH=2;
    self.lineView.frame=CGRectMake(lineX, lineY, lineW, lineH);
    [self addSubview:self.lineView];
   
}

- (void)setOffsetX:(CGFloat)offsetX
{
    _offsetX=offsetX;
    CGRect frame=self.lineView.frame;
    frame.origin.x=self.originalLineX;
    frame.origin.x+=(offsetX*frame.size.width)/screenW;
    self.lineView.frame=frame;
}

- (IBAction)carefullyChosen {
    [self didClickBtnType:YCShareTypeCarefully];
    //执行动画移动下划线
    [self playAnimation:self.chosenBtn];
}
- (IBAction)attention {
     [self didClickBtnType:YCShareTypeAttention];
     //执行动画移动下划线
    [self playAnimation:self.attentionBtn];
}
- (IBAction)new {
    [self didClickBtnType:YCShareTypeNew];
     //执行动画移动下划线
    [self playAnimation:self.firstNewBtn];
}

/**
 *  动画移动下划线
 *
 *  @param btn 移动到的按钮
 */
- (void)playAnimation:(UIButton *)btn
{
    CGFloat lineX=CGRectGetMinX(btn.frame)-beyondLength-2;
    CGRect frame=self.lineView.frame;
    frame.origin.x=lineX;
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.frame=frame;
    }];
}

- (void)didClickBtnType:(YCShareType)type
{
    if ([self.delegate respondsToSelector:@selector(shareNavigationBarView:DidClickBtnType:)])
    {
        [self.delegate shareNavigationBarView:self DidClickBtnType:type];
    }
}

@end
