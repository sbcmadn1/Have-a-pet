//
//  YCNewCell.m
//  有宠ZJZ
//


#import "YCNewCell.h"

@interface YCNewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YCNewCell

- (void)awakeFromNib
{
    self.imageView.image=[UIImage imageNamed:@"filter0"];
}

@end
