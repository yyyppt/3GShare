//
//  WallViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/24.
//

#import "WallViewController.h"

@interface WallViewController ()



@end

@implementation WallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"选择图片";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回白.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];
    doneItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = doneItem;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.images = @[@"头像1.jpg", @"头像2.jpg", @"头像3.jpg", @"头像4.jpg", @"头像5.jpg", @"头像6.jpg", @"头像7.jpg", @"头像8.jpg", @"头像9.jpg"];
    
    self.selectedIndexes = [NSMutableArray array];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.images[indexPath.item]]];
    imageView.frame = cell.contentView.bounds;
    imageView.layer.masksToBounds = YES;
    [cell.contentView addSubview:imageView];
    
    // Set selection border
    if ([self.selectedIndexes containsObject:@(indexPath.item)]) {
        cell.layer.borderColor = [UIColor blueColor].CGColor;
        cell.layer.borderWidth = 3.0;
    } else {
        cell.layer.borderColor = [UIColor clearColor].CGColor;
        cell.layer.borderWidth = 0.0;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *indexNumber = @(indexPath.item);
    if ([self.selectedIndexes containsObject:indexNumber]) {
        [self.selectedIndexes removeObject:indexNumber];
    } else {
        [self.selectedIndexes addObject:indexNumber];
    }
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (void)doneAction {
    UIImage *selectedImage = nil;
    if (self.selectedIndexes.count > 0) {
        NSNumber *firstIndex = self.selectedIndexes.firstObject;
        selectedImage = [UIImage imageNamed:self.images[firstIndex.integerValue]];
    }
    if ([self.delegate respondsToSelector:@selector(didSelectImage: andCount:)]) {
        [self.delegate didSelectImage:selectedImage andCount:self.selectedIndexes.count];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
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
