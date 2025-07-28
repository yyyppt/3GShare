//
//  ThirdVC.m
//  3gShare
//
//  Created by yyyyy on 2025/7/24.
//

#import "ThirdVC.h"
#import "IssueTableViewCell.h"

static NSString *str = @"id";
@interface ThirdVC ()

@end

@implementation ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 670);
    self.tableView.delegate = self;

    self.tableView.scrollEnabled = YES;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass: [IssueTableViewCell class] forCellReuseIdentifier: str];
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
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IssueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    
    if (indexPath.row == 3) {
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
    } else if (indexPath.row == 0) {
        cell.imagelarge.image = [UIImage imageNamed:@"img04"];
        cell.titlefir.text = @"旅行";
        cell.subtitle.text = @"share小co";
        cell.name.text = @"旅行-路线分享";
        cell.time.text = @"21分钟前";
        cell.likecount.text = @"56";
    } else if (indexPath.row == 4) {
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
