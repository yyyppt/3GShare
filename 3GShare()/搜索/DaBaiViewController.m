//
//  DaBaiViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/23.
//

#import "DaBaiViewController.h"
#import "DaBaiTableViewCell.h"
static NSString *str = @"id";

@interface DaBaiViewController ()

@end

@implementation DaBaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"大白";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回白.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    
    CGFloat tabBarHeight = self.tabBarController.tabBar.bounds.size.height;
    self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - tabBarHeight);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass: [DaBaiTableViewCell class] forCellReuseIdentifier: str];
    [self.view addSubview: self.tableView];
    // Do any additional setup after loading the view.
    
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DaBaiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.imagelarge.image = [UIImage imageNamed:@"大白1.png"];
        cell.titlefir.text = @"Icon of Baymax";
        cell.subtitle.text = @"share小白";
        cell.name.text = @"原创-UI-icon";
        cell.time.text = @"10分钟前";
        cell.likecount.text = @"101";
        
    } else if (indexPath.row == 1) {
        cell.imagelarge.image = [UIImage imageNamed:@"大白2.png"];
        cell.titlefir.text = @"每个人都需要一个大白";
        cell.subtitle.text = @"share小c";
        cell.name.text = @"原创作品-摄影";
        cell.time.text = @"1个月前";
        cell.likecount.text = @"288";
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
