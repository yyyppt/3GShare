//
//  UserViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import "UserViewController.h"
#import "MyTableViewCell.h"
#import "SetTableViewCell.h"
#import "MySendViewController.h"
#import "MyinformViewController.h"
#import "MyrecommendVC.h"
#import "SettingsViewController.h"
static NSString *str = @"id";

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.navigationItem.title = @"个人信息";

    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    UIImage *bgImage = [UIImage imageNamed:@"导航.png"];
    appearance.backgroundImage = bgImage;
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.frame = CGRectMake( -19, 0, self.view.bounds.size.width + 35, 1000);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor colorWithWhite: 0.95 alpha: 1.0];
    [self.tableView registerClass: [MyTableViewCell class] forCellReuseIdentifier: str];
    [self.tableView registerClass:[SetTableViewCell class] forCellReuseIdentifier:@"SetCell"];
    [self.view addSubview: self.tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0: {
                MySendViewController *mysendvc = [[MySendViewController alloc] init];
                [self.navigationController pushViewController: mysendvc animated: YES];
                break;
             }
            case 1: {
                if (self.myinformvc == nil) {
                    self.myinformvc = [[MyinformViewController alloc] init];
                    [self.navigationController pushViewController: self.myinformvc animated: YES];
                    break;
                } else {
                    [self.navigationController pushViewController: self.myinformvc animated: YES];
                    break;
                }
                
            }
            case 2:{
                MyrecommendVC *myrecommend = [[MyrecommendVC alloc] init];
                [self.navigationController pushViewController: myrecommend animated: YES];
                break;
            }
            case 3: {
                UIAlertController *alert1 = [UIAlertController alertControllerWithTitle: nil message: @"暂无新内容"
                            preferredStyle: UIAlertControllerStyleAlert];
                [alert1 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
                [self presentViewController: alert1 animated: YES completion: nil];
                break;
            }
            case 4: {
                if (self.settingvc == nil) {
                    self.settingvc = [[SettingsViewController alloc] init];
                    [self.navigationController pushViewController: self.settingvc animated: YES];
                    break;
                } else {
                    [self.navigationController pushViewController: self.settingvc animated: YES];
                    break;
                }
            }
            case 5: {
                UIAlertController *alert2 = [UIAlertController alertControllerWithTitle: nil message: @"需求被驳回"
                            preferredStyle: UIAlertControllerStyleAlert];
                [alert2 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
                [self presentViewController: alert2 animated: YES completion: nil];
                break;
            }
            default:
                break;
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 160;
    } else {
        return 65;
    }
        
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
        cell.imagelarge.image = [UIImage imageNamed:@"img03"];
        cell.titlefir.text = @"share小白";
        cell.subtitle.text = @"数媒/设计爱好者";
        cell.name.text = @"原创-插画-练习习作";
        cell.likecount.text = @"101";
        cell.lookingcount.text = @"45";
        cell.sharingcount.text = @"99";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SetCell" forIndexPath:indexPath];
        
        NSArray *titles = @[@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出"];
        NSArray *images = @[@"个人2.png", @"个人4.png", @"liking.png", @"个人5.png", @"个人6.png", @"个人7.png"];
        
        cell.describeLabel.text = titles[indexPath.row];
        cell.img.image = [UIImage imageNamed:images[indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
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
