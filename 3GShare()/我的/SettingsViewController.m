//
//  SettingsViewController.m
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"
#import "ChangeWordVC.h"
static NSString *str = @"id";
@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.navigationItem.title = @"设置";

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
    [self.tableView registerClass:[SettingsTableViewCell class] forCellReuseIdentifier:@"SettingCell"];
    [self.view addSubview: self.tableView];
}


- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0: {
            if (self.setDatavc == nil) {
                self.setDatavc = [[SetDataViewController alloc] init];
                [self.navigationController pushViewController: self.setDatavc animated: YES];
                break;
            } else {
                [self.navigationController pushViewController: self.setDatavc animated: YES];
                break;
            }
            
        }
        case 1: {
            ChangeWordVC *vc = [[ChangeWordVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

            break;
        }
        case 2: {
            if (self.messagesetvc == nil) {
                self.messagesetvc = [[MessageSetVC alloc] init];
                [self.navigationController pushViewController: self.messagesetvc animated: YES];
                break;
            } else {
                [self.navigationController pushViewController: self.messagesetvc animated: YES];
                break;
            }
        }
        case 3: {
            UIAlertController *alert3 = [UIAlertController alertControllerWithTitle: @"这是一个古老的软件" message: nil
                                                                     preferredStyle: UIAlertControllerStyleAlert];
            [alert3 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
            [self presentViewController: alert3 animated: YES completion: nil];
            break;
        }
        case 4: {
            UIAlertController *alert4 = [UIAlertController alertControllerWithTitle: @"已清理缓存" message: nil
                                                                     preferredStyle: UIAlertControllerStyleAlert];
            [alert4 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
            [self presentViewController: alert4 animated: YES completion: nil];
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
    
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
    
    NSArray *titles = @[@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存"];
    NSArray *images = @[@"个人3.png", @"个人3.png", @"个人3.png", @"个人3.png", @"个人3.png"];
    
    cell.describeLabel.text = titles[indexPath.row];
    cell.img.image = [UIImage imageNamed:images[indexPath.row]];
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
