//
//  CZHeaderView.m
//  12-团购案例

//

#import "CZHeaderView.h"

@interface CZHeaderView () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControll;
@property (nonatomic,weak) NSTimer *timer;

@property (nonatomic,assign) CGFloat width;
#define count 6
@end

@implementation CZHeaderView

+ (instancetype)headerView
{
    CZHeaderView *headerView=[[[NSBundle mainBundle]loadNibNamed:@"CZHeaderView" owner:nil options:nil] lastObject];
    return headerView;
}

/**
 *  类似ViewControll中的viewDidLoad方法。当.xib控件加载完毕自动执行这个方法
 */
- (void)awakeFromNib
{
    self.scrollView.delegate=self;
    
    self.width=self.scrollView.frame.size.width;
    CGFloat height=self.scrollView.frame.size.height;
    for (int i=0; i<count; i++)
    {
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake((i+1)*self.width, 0, self.width, height)];
        NSString *imgName=[NSString stringWithFormat:@"ad_%02d",i];
        imgView.image=[UIImage imageNamed:imgName];
        [self.scrollView addSubview:imgView];
    }
    UIImageView *firstImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, height)];
    firstImg.image=[UIImage imageNamed:@"ad_05"];
    [self.scrollView addSubview:firstImg];
    
    UIImageView *lastImg=[[UIImageView alloc]initWithFrame:CGRectMake(self.width*(count+1), 0,self.width, height)];
    lastImg.image=[UIImage imageNamed:@"ad_00"];
    [self.scrollView addSubview:lastImg];
    
    self.scrollView.contentOffset=CGPointMake(self.width, 0);
    self.scrollView.contentSize=CGSizeMake(self.width*(count+2), 0);
    self.scrollView.pagingEnabled=YES;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    NSRunLoop *runLoop=[[NSRunLoop alloc]init];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextImg
{
    NSInteger index=self.pageControll.currentPage;
    index++;
    [self.scrollView setContentOffset:CGPointMake(self.width*(index+1), 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index=(self.scrollView.contentOffset.x+0.5*self.width)/self.width;
    if (index==count+1) {
        index=1;
    }
    else if (index==0){
        index=count;
    }
    self.pageControll.currentPage=index-1;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index=(self.scrollView.contentOffset.x+0.5*self.width)/self.width;
    if (index==count+1)
    {
        index=1;
    }
    else if (index==0){
        index=count;
    }
    [self.scrollView setContentOffset:CGPointMake(self.width*index, 0) animated:NO];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"----");
    [self.timer invalidate];
    self.timer=nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    NSRunLoop *runLoop=[[NSRunLoop alloc]init];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

@end
