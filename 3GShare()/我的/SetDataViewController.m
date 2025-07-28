//
//  SetDataViewController.m
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import "SetDataViewController.h"
#import "SetDataTableViewCell.h"

static NSString *str = @"id";

@interface SetDataViewController ()

@end

@implementation SetDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.navigationItem.title = @"基本资料";

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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.frame = CGRectMake( -24, 0, self.view.bounds.size.width + 35, 1000);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor colorWithWhite: 0.95 alpha: 1.0];
    //[self.tableView registerClass: [MyTableViewCell class] forCellReuseIdentifier: str];
    [self.tableView registerClass:[SetDataTableViewCell class] forCellReuseIdentifier:@"SetDataCell"];
    [self.view addSubview: self.tableView];
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
    return 65;
        
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SetDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SetDataCell" forIndexPath:indexPath];
    
    NSArray *titles = @[@"头像", @"昵称", @"签名", @"性别", @"邮箱"];
    cell.title.text = titles[indexPath.row];
    if (indexPath.row == 0) {
        cell.pic.image = [UIImage imageNamed: @"img12.png"];
    } else if (indexPath.row == 1){
        cell.desctitle.text = @"share小白";
    } else if (indexPath.row == 2) {
        cell.desctitle.text = @"开心了就笑，不开心了就过会再笑";
    } else if (indexPath.row == 4) {
        cell.desctitle.text = @"198****6qq.com";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
