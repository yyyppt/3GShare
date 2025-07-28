//
//  MyinformViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import "MyinformViewController.h"
#import "MyinformTableViewCell.h"
#import "ChatVC.h"

static NSString *str = @"id";
@interface MyinformViewController ()

@end

@implementation MyinformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.navigationItem.title = @"我的信息";

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
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.frame = CGRectMake( -24, 0, self.view.bounds.size.width + 35, 1000);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor colorWithWhite: 0.95 alpha: 1.0];
    //[self.tableView registerClass: [MyTableViewCell class] forCellReuseIdentifier: str];
    [self.tableView registerClass:[MyinformTableViewCell class] forCellReuseIdentifier:@"MyinformCell"];
    [self.view addSubview: self.tableView];
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0: {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle: @"目前没有新内容" message:
                                         nil preferredStyle: UIAlertControllerStyleAlert];
               
                
            [alert1 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
            [self presentViewController: alert1 animated: YES completion: nil];
            break;
        }
        case 1: {
            UIAlertController *alert2 = [UIAlertController alertControllerWithTitle: @"目前没有新内容" message: nil
                                                                     preferredStyle: UIAlertControllerStyleAlert];
            [alert2 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
            [self presentViewController: alert2 animated: YES completion: nil];
            break;
        }
        case 2: {
            if (self.myattentionvc == nil) {
                self.myattentionvc = [[MyattenViewController alloc] init];
                [self.navigationController pushViewController: self.myattentionvc animated: YES];
                break;
            } else {
                [self.navigationController pushViewController: self.myattentionvc animated: YES];
                break;
            }
        }
        case 3: {
            if (self.chatvc == nil) {
                self.chatvc = [[ChatVC alloc] init];
                [self.navigationController pushViewController: self.chatvc animated: YES];
                break;
            } else {
                [self.navigationController pushViewController: self.chatvc animated: YES];
                break;
            }
        }
        case 4: {
            UIAlertController *alert3 = [UIAlertController alertControllerWithTitle: @"目前没有新内容" message: nil
                                                                     preferredStyle: UIAlertControllerStyleAlert];
            [alert3 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
            [self presentViewController: alert3 animated: YES completion: nil];
            break;
        }
        default:
            break;
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
    

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
        
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyinformTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyinformCell" forIndexPath:indexPath];
    
    NSArray *titles = @[@"评论", @"推荐我的", @"新关注的", @"私信", @"活动通知"];
    NSArray *images = @[@"个人3.png", @"个人3.png", @"个人3.png", @"个人3.png", @"个人3.png"];
    NSArray *numlabels = @[@"7", @"9", @"5", @"4", @"1"];
    cell.describeLabel.text = titles[indexPath.row];
    cell.img.image = [UIImage imageNamed:images[indexPath.row]];
    cell.numLabdel.text = numlabels[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
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
