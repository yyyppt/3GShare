//
//  MySendViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import "MySendViewController.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
@interface MySendViewController ()<UIScrollViewDelegate>

@end

@implementation MySendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.navigationItem.title = @"我上传的";

    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    UIImage *bgImage = [UIImage imageNamed:@"导航.png"];
    appearance.backgroundImage = bgImage;
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回白.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"上传时间", @"推荐最多", @"分享最多"]];
    self.segmentedControl.frame = CGRectMake(0, 100, self.view.bounds.size.width , 40);
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.backgroundColor = [UIColor whiteColor];

    UIFont *font = [UIFont systemFontOfSize:18];
    NSDictionary *attributes = @{NSFontAttributeName: font};
    [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateSelected];
    [self.view addSubview:self.segmentedControl];
    
    self.firstVC = [[FirstVC alloc] init];
    self.secondVC = [[SecondVC alloc] init];
    self.thirdVC = [[ThirdVC alloc] init];

    CGFloat yOffset = CGRectGetMaxY(self.segmentedControl.frame);
    CGFloat scrollHeight = self.view.bounds.size.height - yOffset;

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, yOffset, self.view.bounds.size.width, scrollHeight)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, scrollHeight);
    [self.view addSubview:self.scrollView];

    [self addChildViewController:self.firstVC];
    self.firstVC.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, scrollHeight);
    [self.scrollView addSubview:self.firstVC.view];
    [self.firstVC didMoveToParentViewController:self];

    [self addChildViewController:self.secondVC];
    self.secondVC.view.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, scrollHeight);
    [self.scrollView addSubview:self.secondVC.view];
    [self.secondVC didMoveToParentViewController:self];

    [self addChildViewController:self.thirdVC];
    self.thirdVC.view.frame = CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, scrollHeight);
    [self.scrollView addSubview:self.thirdVC.view];
    [self.thirdVC didMoveToParentViewController:self];
}

- (void)segmentChanged:(UISegmentedControl *)sender {
    CGFloat offsetX = sender.selectedSegmentIndex * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger pageIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.segmentedControl.selectedSegmentIndex = pageIndex;
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
