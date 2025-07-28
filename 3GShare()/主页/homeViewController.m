//
//  homeViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import "homeViewController.h"
#import "HomeTableViewCell.h"
#import "SendViewController.h"
static NSString *str = @"id";
@interface homeViewController ()<SendViewControllerDelegate>

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SHARE";
    
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    UIImage *bgImage = [UIImage imageNamed:@"导航.png"];
    appearance.backgroundImage = bgImage;
    
    UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, 290)];
    

    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    self.images = @[@"img1", @"img2", @"img3", @"img4"];
    self.isDragging = NO;
    
    self.scrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(0, 10, self.view.bounds.size.width, 260)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * (self.images.count + 2), 260);
    [headerView addSubview: self.scrollView];
    for (int i = 0; i < self.images.count + 2; i++) {
        NSString *imageName;
        if (i == 0) {
            imageName = [self.images lastObject];
        } else if (i == self.images.count + 1) {
            imageName = [self.images firstObject];
        } else {
            imageName = self.images[i - 1];
        }
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, 260);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.scrollView addSubview:imageView];
    }
    //[self.view addSubview: self.scrollView];
    CGFloat scrollViewBottom = CGRectGetMaxY(self.scrollView.frame);
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, scrollViewBottom - 60, self.view.bounds.size.width, 30)];
    self.pageControl.numberOfPages = self.images.count;
    self.pageControl.currentPage = 0;
    [self.pageControl addTarget:self action:@selector(pageControlChanged:) forControlEvents:UIControlEventValueChanged];
    [headerView addSubview:self.pageControl];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    
    CGFloat tabBarHeight = self.tabBarController.tabBar.bounds.size.height;
    self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - tabBarHeight);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = headerView;
    [self.tableView registerClass: [HomeTableViewCell class] forCellReuseIdentifier: str];
    [self.view addSubview: self.tableView];

    [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:NO];
    [self startTimerScrollView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 0) {
        SendViewController *sendVC = [[SendViewController alloc] init];
        sendVC.hidesBottomBarWhenPushed = YES;
        sendVC.isLiked = cell.isLiked;
        sendVC.likeCountText = cell.likecount.text;
        sendVC.delegate = self;
        [self.navigationController pushViewController: sendVC animated:YES];
    }
}

- (void) didUpdateLikeStatus:(BOOL)isLiked likeCount:(NSInteger)likeCount {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    HomeTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.isLiked = isLiked;
    cell.likecount.text = [NSString stringWithFormat:@"%ld", (long)likeCount];
    [cell.like setImage:[UIImage imageNamed:(isLiked ? @"likingred.png" : @"liking.png")] forState:UIControlStateNormal];
}
- (void)startTimerScrollView {
   self.timerScrollView = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(pageToNext) userInfo:nil repeats:YES];
   [[NSRunLoop mainRunLoop] addTimer:self.timerScrollView forMode:NSRunLoopCommonModes];
}

- (void)pageToNext {
   if (self.isDragging) {
       return;
   }
   CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
   CGFloat offsetX = self.scrollView.contentOffset.x;
   
   NSInteger pageIndex = offsetX / screenWidth;
   NSInteger nextIndex = pageIndex + 1;
   [self.scrollView setContentOffset:CGPointMake(nextIndex * screenWidth, 0) animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {  
        [self.timerScrollView invalidate];
        self.timerScrollView = nil;
        self.isDragging = YES;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == self.scrollView) {
        self.isDragging = NO;
        self.timerScrollView = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(pageToNext)  userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timerScrollView forMode:NSRunLoopCommonModes];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
   [self updateCurrentPageAndOffset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   [self updateCurrentPageAndOffset];
}

- (void)updateCurrentPageAndOffset {
   CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
   NSInteger pageIndex = self.scrollView.contentOffset.x / screenWidth;
   
   if (pageIndex == 0) {
       [self.scrollView setContentOffset:CGPointMake(screenWidth * self.images.count, 0) animated:NO];
       self.pageControl.currentPage = self.images.count - 1;
   } else if (pageIndex == self.images.count + 1) {
       [self.scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
       self.pageControl.currentPage = 0;
   } else {
       self.pageControl.currentPage = pageIndex - 1;
   }
}

- (void)pageControlChanged:(UIPageControl *)sender {
   NSInteger page = sender.currentPage;
   CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
   [self.scrollView setContentOffset:CGPointMake((page + 1) * screenWidth, 0) animated:YES];
}

- (void)dealloc {
   [self.timerScrollView invalidate];
   self.timerScrollView = nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.imagelarge.image = [UIImage imageNamed:@"img03"];
        cell.titlefir.text = @"假日";
        cell.subtitle.text = @"share小白";
        cell.name.text = @"原创-插画-练习习作";
        cell.time.text = @"刚刚";
        cell.likecount.text = @"101";
        
    } else if (indexPath.row == 1) {
        cell.imagelarge.image = [UIImage imageNamed:@"img02"];
        cell.titlefir.text = @"板书要求";
        cell.subtitle.text = @"share小c";
        cell.name.text = @"平面设计-板书需求";
        cell.time.text = @"5分钟前";
        cell.likecount.text = @"87";
    } else if (indexPath.row == 2) {
        cell.imagelarge.image = [UIImage imageNamed:@"img01"];
        cell.titlefir.text = @"字体故事";
        cell.subtitle.text = @"share小宇";
        cell.name.text = @"漫画-字体的秘密";
        cell.time.text = @"13分钟前";
        cell.likecount.text = @"234";
    } else if (indexPath.row == 3) {
        cell.imagelarge.image = [UIImage imageNamed:@"img04"];
        cell.titlefir.text = @"旅行";
        cell.subtitle.text = @"share小co";
        cell.name.text = @"旅行-路线分享";
        cell.time.text = @"21分钟前";
        cell.likecount.text = @"56";
    }
    cell.isLiked = NO;
    [cell.like setImage:[UIImage imageNamed:(cell.isLiked ? @"likingred.png" : @"liking.png")] forState:UIControlStateNormal];
    return cell;
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
