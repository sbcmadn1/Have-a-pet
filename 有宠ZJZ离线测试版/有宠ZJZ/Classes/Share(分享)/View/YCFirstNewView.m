//
//  YCFirstNewView.m
//  有宠ZJZ
//


#import "YCFirstNewView.h"
#import "YCNewCell.h"

@interface YCFirstNewView () <UICollectionViewDataSource>

@end

@implementation YCFirstNewView
static NSString *ID=@"collectionCell";
+ (instancetype)firstNewView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
//    CGFloat imageW=screenW*0.25;
    layout.itemSize=CGSizeMake(80, 80);
    layout.minimumLineSpacing=5;
    layout.sectionInset=UIEdgeInsetsMake(5, 5, 0, 5);
    
    YCFirstNewView *firstNewView=[[YCFirstNewView alloc]initWithFrame:CGRectMake(2*screenW, 0, screenW, screenH) collectionViewLayout:layout];
    firstNewView.contentInset=UIEdgeInsetsMake(0, 0, 110, 0);
    [firstNewView registerNib:[UINib nibWithNibName:@"YCNewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    firstNewView.backgroundColor=[UIColor whiteColor];
    firstNewView.dataSource=firstNewView;
    
    return firstNewView;
}

#pragma mark - UICollectionViewDataSource数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 60;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YCNewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    return cell;
}

@end
