//
//  CZStatuseCell.m
//  15-微博案例（屏幕适配）
//

#import "CZStatuseCell.h"
#import "CZStatuse.h"

#define  LabelWidth [UIScreen mainScreen].bounds.size.width-20

@interface CZStatuseCell ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *textView;


@end

@implementation CZStatuseCell


- (void)setStatuse:(CZStatuse *)statuse
{
    _statuse=statuse;

    
//    _textView.text=statuse.text;
    //允许的最大行宽，限制行宽，并设置行数为0，才能使label中的文字换行
    _textView.preferredMaxLayoutWidth=LabelWidth;
    _textView.numberOfLines=0;
    
    
    CGFloat imageW=17;
    CGFloat imageH=imageW;
    CGFloat imageY=CGRectGetMaxY(_textView.frame)+20;
    CGFloat imageX=0;
    CGFloat margin=2;
    for (int index=0; index<14; index++)
    {
        imageX=10+(imageW+margin)*index;
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        NSString *imageName=[NSString stringWithFormat:@"%d",index%7];
        imageView.image=[UIImage circleImageWithName:imageName];
        [self addSubview:imageView];
    }
    CGFloat btnW=50;
    CGFloat btnH=18;
    CGFloat btnX=0;
    CGFloat btnY=imageY+imageH+10;
    NSString *title=nil;
    for (int index=0; index<3; index++)
    {
        btnX=10+index*(btnW +10);
        UIButton *praiseBtn=[[UIButton alloc]init];
        praiseBtn.frame=CGRectMake(btnX, btnY, btnW, btnH);
        NSString *imageName=[NSString stringWithFormat:@"fy_%d",index];
        [praiseBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [praiseBtn setBackgroundColor:YCColor(240, 240, 240)];
        switch (index)
        {
            case 0:
                title=@" 赞";
                break;
            case 1:
                title=@" 评论";
                break;
            case 2:
                title=@" 分享";
                break;
        }
        [praiseBtn setAttributedTitle:[[NSAttributedString alloc]initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:YCWshySize(10)}] forState:UIControlStateNormal];

        [self addSubview:praiseBtn];

    }
    //attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:YCWshySize(10)}
    UILabel *comment=[[UILabel alloc]initWithFrame:CGRectMake(10, btnY+btnH+5, [UIScreen mainScreen].bounds.size.width-20, 20)];
    comment.preferredMaxLayoutWidth=LabelWidth;
    comment.numberOfLines=0;
//    NSString *tit=@"夜良辰：在我的地盘，有一百种让你死的方法，不信你可以试试。";
    NSMutableAttributedString *attributStr=[[NSMutableAttributedString alloc]initWithString:@"夜良辰：在我的地盘，有一百种让死的方法，，代收款。。不信你可以试试。"];
    [attributStr addAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor],NSFontAttributeName:YCWshySize(10)} range:NSMakeRange(0, 3)];
    [attributStr addAttributes:@{NSForegroundColorAttributeName:YCColor(111, 111, 111),NSFontAttributeName:YCWshySize(10)} range:NSMakeRange(3, attributStr.length-3)];     //不知道什么原因，此处减3就正好合适
    comment.attributedText=attributStr;
    [self addSubview:comment];
    
    if (statuse.picture)
    {
        _pictureView.image=[UIImage imageNamed:statuse.picture];
        self.pictureHeight=410;
    }
    else
    {
        _pictureView.image=nil;
        self.pictureHeight=0;
    }
}

@end
