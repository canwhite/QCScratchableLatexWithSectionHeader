//
//  EnvironmentSupervisionViewController.m
//  WitServices
//
//  Created by EricZhang on 2018/12/4.
//  Copyright © 2018年 myself. All rights reserved.
//

#import "EnvironmentSupervisionViewController.h"
#import "EnvironmentSupervisionCollectionViewCell.h"
#import "EnvironmentSupervisionCollectionReusableView.h"

#define CKScreenW ([UIScreen mainScreen].bounds.size.width)
#define CKScreenH ([UIScreen mainScreen].bounds.size.height)

@interface EnvironmentSupervisionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;//表视图
@property (nonatomic,strong) NSMutableArray *nameArr;
@property (nonatomic,strong) NSMutableArray *imageArr;
@property (nonatomic,strong) NSMutableArray *titleArr;

@end

@implementation EnvironmentSupervisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"环境监督";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = RGBA(242, 242, 242, 1);

    self.nameArr = [NSMutableArray new];
    self.imageArr = [NSMutableArray new];
    self.titleArr = [NSMutableArray new];
    

    [self.nameArr addObjectsFromArray:@[@[@"宿舍卫生",@"教室卫生",@"公共卫生"],@[@"宿舍卫生成绩",@"教室卫生成绩",@"公共卫生成绩"]]];
    [self.imageArr addObjectsFromArray:@[@[@"暂无照片(1)",@"暂无照片(1)",@"暂无照片(1)"],@[@"暂无照片(1)",@"暂无照片(1)",@"暂无照片(1)"]]];
    [self.titleArr addObjectsFromArray:@[@"标题一",@"标题二",@"标题三"]];
    

    
    
    NSLog(@"%@",self.nameArr);
    
    

    [self.collectionView reloadData];

}
#pragma mark - added by zack
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumLineSpacing = 10;
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumInteritemSpacing = 10;
        //头部大小
        
        CGFloat tableX = 0;
        CGFloat tableY = 0;
        CGFloat tableW = CKScreenW;
        CGFloat tableH = CKScreenH;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(tableX , tableY, tableW,tableH ) collectionViewLayout:flowLayout];
        //当cell少的时候也能够上下移动
        _collectionView.alwaysBounceVertical = YES;
        //注册cell和ReusableView（头部视图）
        NSArray *cellclassArr = @[[EnvironmentSupervisionCollectionViewCell class]];
        NSArray *reuseID = @[@"cell1"];
        
        for (int i = 0; i<reuseID.count; i++) {
            [_collectionView registerClass:cellclassArr[i] forCellWithReuseIdentifier:reuseID[i]];
        }
        [_collectionView registerClass:[EnvironmentSupervisionCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"QCReusableView"];
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //背景颜色
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
    
}





#pragma mark - UICollectionView delegate dataSource


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.nameArr.count;
}




-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    NSArray *arr = [NSArray new];
    arr = self.nameArr[section];
    
    return  arr.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *identify = @"cell1";
    EnvironmentSupervisionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    
    cell.imgView.image = [UIImage imageNamed:self.imageArr[indexPath.section][indexPath.row]];
    cell.label.text = self.nameArr[indexPath.section][indexPath.row];
    
    return cell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选择%ld",indexPath.item);
    

    
    
    
}


#pragma mark - UICollectionViewDelegateFlowLayoutDelegate

//这个用于设置各个分区之间的间隔, 以及分区左右间的间隔（上左下右）
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return  UIEdgeInsetsMake(10,10,10,10);
    
}



//这个设置每个item的形状大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //得到宽度
    CGFloat width = (CKScreenW - 40)/3;
    return CGSizeMake(width,width);
    
}






#pragma mark - UICollectionViewDelegateFlowLayoutDelegate:分区表头的设置



-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    CGSize size = CGSizeMake(CKScreenW, 30);
    return size;
}





//第三步
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        EnvironmentSupervisionCollectionReusableView *headerView = (EnvironmentSupervisionCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"QCReusableView" forIndexPath:indexPath];
        
        headerView.titleLabel.text = self.titleArr[indexPath.section];
        
        reusableView = headerView;
    }
    
    return reusableView;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
