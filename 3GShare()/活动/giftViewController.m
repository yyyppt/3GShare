//
//  giftViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import "giftViewController.h"
#import "activityTableVC.h"

static NSString *str = @"id";
@interface giftViewController ()

@end

@implementation giftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.navigationItem.title = @"活动";

    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    UIImage *bgImage = [UIImage imageNamed:@"导航.png"];
    appearance.backgroundImage = bgImage;
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, 800) style: UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    [self.tableView registerClass: [activityTableVC class] forCellReuseIdentifier: str];
    
    [self.view addSubview: self.tableView];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    activityTableVC *cell = [tableView dequeueReusableCellWithIdentifier: str forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.activityView.image = [UIImage imageNamed: @"下厨.png"];
        cell.actlabel.text = @"下厨也要美美的，从一条围裙开始一六月鲜围裙创意设计大赛";
    } else if (indexPath.section == 1) {
        cell.activityView.image = [UIImage imageNamed: @"创意.png"];
        cell.actlabel.text = @"MIUI主题市场让你的创意改变世界！";
    } else {
        cell.activityView.image = [UIImage imageNamed: @"花粉.png"];
        cell.actlabel.text = @"千万花粉，为你而来";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
