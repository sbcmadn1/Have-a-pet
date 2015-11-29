//
//  YCCareSectionHeaderView.m
//  有宠ZJZ
//


#import "YCCareSectionHeaderView.h"
#import "CZStatuse.h"

@interface YCCareSectionHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UIImageView *dogIconView;

@property (weak, nonatomic) IBOutlet UIButton *attentionView;
@end

@implementation YCCareSectionHeaderView

+ (instancetype)sectionHeaderView
{
    return [[NSBundle mainBundle]loadNibNamed:@"YCCareSectionHeaderView" owner:nil options:nil].lastObject;
}

- (IBAction)attention {
    [self.attentionView setImage:[UIImage imageNamed:@"fy_attentioned"] forState:UIControlStateNormal];
}

- (void)setStatuse:(CZStatuse *)statuse
{
    _statuse=statuse;
    
    if (statuse.isAttention)
    {
        self.attentionView.hidden=YES;
    }
    
    _iconView.image=[UIImage circleImageWithName:statuse.icon];
    
    _dogIconView.image=[UIImage circleImageWithName:statuse.icon];
    
    _nameView.text=statuse.name;
    
    if (statuse.isVip)
    {
        _nameView.textColor=[UIColor redColor];
        _vipView.image=[UIImage imageNamed:@"vip"];
    }
    else
    {
        _nameView.textColor=[UIColor blackColor];
        _vipView.image=nil;
    }

}

@end
