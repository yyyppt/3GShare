//
//  ChatVC.m
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import "ChatVC.h"
#import "ChatTableViewCell.h"
#import "ChatWithLanVC.h"
static NSString *str = @"id";
@interface ChatVC ()

@end

@implementation ChatVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.navigationItem.title = @"Chat";

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
    [self.tableView registerClass:[ChatTableViewCell class] forCellReuseIdentifier:@"ChatCell"];
    [self.view addSubview: self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
        
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatCell" forIndexPath:indexPath];
    
    NSArray *names = @[@"share小格", @"share小兰", @"share小明", @"share小雪", @"share萌萌"];
    NSArray *images = @[@"img11.png", @"img12.png", @"img13.png", @"img14.png", @"img15.png"];
    NSArray *sayings = @[@"你的作品我很喜欢！！", @"谢谢，已关注你", @"为你点赞", @"你好可以问问你是怎么拍的吗", @"你好，可以认识一下吗"];
    NSArray *times = @[@"7-25 16:48", @"7-25 11:29", @"7-25 9:40", @"7-24 15:24", @"7-24 10:32"];
    
    cell.name.text = names[indexPath.row];
    cell.img.image = [UIImage imageNamed:images[indexPath.row]];
    cell.saying.text = sayings[indexPath.row];
    cell.time.text = times[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 1: {
            if (self.chatwithLan == nil) {
                self.chatwithLan = [[ChatWithLanVC alloc] init];
                [self.navigationController pushViewController: self.chatwithLan animated: YES];
                break;
            } else {
                [self.navigationController pushViewController: self.chatwithLan animated: YES];
                break;
            }
        }
        default:
            break;
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
