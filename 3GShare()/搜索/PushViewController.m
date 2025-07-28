//
//  PushViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/23.
//

#import "PushViewController.h"
#import "WallViewController.h"
@interface PushViewController ()<UITextFieldDelegate, UITextViewDelegate, WallViewDelegate>

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"上传";
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回白.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.pushView = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.pushView setImage: [UIImage imageNamed: @"pictrue.png"] forState: UIControlStateNormal];
    [self.pushView addTarget:self action: @selector(pushWallView) forControlEvents: UIControlEventTouchUpInside];
    self.pushView.frame = CGRectMake(10, 120, 200, 200);
    [self.view addSubview: self.pushView];
    
    self.imagecounts = [[UILabel alloc] initWithFrame: CGRectMake(190, 120, 30, 30)];
    self.imagecounts.text = @"";
    self.imagecounts.font = [UIFont boldSystemFontOfSize: 18];
    self.imagecounts.textColor = [UIColor blueColor];
    [self.view addSubview: self.imagecounts];
    
    UIImageView *address1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"地址.png"]];
    address1.frame = CGRectMake(250, 156, 30, 30);
    [self.view addSubview: address1];
    
    UIImageView *address2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"西安.png"]];
    address2.frame = CGRectMake(282, 150, 116, 40);
    address2.layer.cornerRadius = 20;
    address2.layer.masksToBounds = YES;
    
    self.ary = [NSMutableArray arrayWithArray:@[@"原创作品", @"设计资料", @"设计师观点", @"设计教程"]];
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(370, 225, 30, 20);
    [self.btn setImage: [UIImage imageNamed: @"个人3.png"] forState: UIControlStateNormal];
    [self.btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    UIButton *customButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton1.frame = CGRectMake(10, 340, 90, 40);
    [customButton1 setTitle:@"平面设计" forState:UIControlStateNormal];
    [customButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton1.backgroundColor = [UIColor whiteColor];
    [customButton1 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton1.layer.masksToBounds = YES;
    customButton1.layer.borderWidth = 1;
    customButton1.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton1];
    
    UIButton *customButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton2.frame = CGRectMake(110, 340, 90, 40);
    [customButton2 setTitle:@"网页设计" forState:UIControlStateNormal];
    [customButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton2.backgroundColor = [UIColor whiteColor];
    [customButton2 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton2.layer.masksToBounds = YES;
    customButton2.layer.borderWidth = 1;
    customButton2.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton2];
    
    UIButton *customButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton3.frame = CGRectMake(210, 340, 90, 40);
    [customButton3 setTitle:@"UI/icon" forState:UIControlStateNormal];
    [customButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton3.backgroundColor = [UIColor whiteColor];
    [customButton3 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton3.layer.masksToBounds = YES;
    customButton3.layer.borderWidth = 1;
    customButton3.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton3];
    
    UIButton *customButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton4.frame = CGRectMake(310, 340, 90, 40);
    [customButton4 setTitle:@"插画/手绘" forState:UIControlStateNormal];
    [customButton4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton4.backgroundColor = [UIColor whiteColor];
    [customButton4 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton4.layer.masksToBounds = YES;
    customButton4.layer.borderWidth = 1;
    customButton4.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton4];
    
    UIButton *customButton5 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton5.frame = CGRectMake(10, 390, 90, 40);
    [customButton5 setTitle:@"虚拟设计" forState:UIControlStateNormal];
    [customButton5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton5.backgroundColor = [UIColor whiteColor];
    [customButton5 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton5.layer.masksToBounds = YES;
    customButton5.layer.borderWidth = 1;
    customButton5.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton5];
    
    UIButton *customButton6 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton6.frame = CGRectMake(110, 390, 90, 40);
    [customButton6 setTitle:@"影视" forState:UIControlStateNormal];
    [customButton6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton6.backgroundColor = [UIColor whiteColor];
    [customButton6 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton6.layer.masksToBounds = YES;
    customButton6.layer.borderWidth = 1;
    customButton6.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton6];
    
    UIButton *customButton7 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton7.frame = CGRectMake(210, 390, 90, 40);
    [customButton7 setTitle:@"摄影" forState:UIControlStateNormal];
    [customButton7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton7.backgroundColor = [UIColor whiteColor];
    [customButton7 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton7.layer.masksToBounds = YES;
    customButton7.layer.borderWidth = 1;
    customButton7.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton7];
    
    UIButton *customButton8 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton8.frame = CGRectMake(310, 390, 90, 40);
    [customButton8 setTitle:@"其他" forState:UIControlStateNormal];
    [customButton8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton8.backgroundColor = [UIColor whiteColor];
    [customButton8 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton8.layer.masksToBounds = YES;
    customButton8.layer.borderWidth = 1;
    customButton8.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton8];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(240, 220, 120, 30) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"id"];
    
    UITextField *name = [[UITextField alloc] initWithFrame: CGRectMake(0, 445, self.view.bounds.size.width, 40)];
    name.placeholder = @"作品名称";
    name.backgroundColor = [UIColor whiteColor];
    name.borderStyle = UITextBorderStyleRoundedRect;
    name.clearButtonMode = UITextFieldViewModeWhileEditing;
    name.returnKeyType = UIReturnKeyDone;
    name.delegate = self;
    [self.view addSubview: name];
    
    UITextView *state = [[UITextView alloc] initWithFrame:CGRectMake(0, 505, self.view.bounds.size.width, 95)];
    state.text = @"请添加作品说明/文章内容...";
    state.textColor = [UIColor lightGrayColor];
    state.backgroundColor = [UIColor whiteColor];
    state.font = [UIFont systemFontOfSize:16];
    state.delegate = self;
    [self.view addSubview:state];
    
    UIButton *pushBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    pushBtn.frame = CGRectMake(100, 610, 180, 40);
    [pushBtn setTitle: @"发布" forState: UIControlStateNormal];
    [pushBtn addTarget: self action: @selector(pushtheView) forControlEvents: UIControlEventTouchUpInside];
    pushBtn.tintColor = [UIColor blackColor];
    pushBtn.layer.borderColor = [UIColor blueColor].CGColor;
    pushBtn.layer.borderWidth = 1.0;
    pushBtn.layer.cornerRadius = 8.0;
    pushBtn.clipsToBounds = YES;
    [self.view addSubview: pushBtn];
    
    UILabel *autoLabel = [[UILabel alloc] initWithFrame: CGRectMake(73, 666, 90, 23)];
    autoLabel.text = @"禁止下载";
    autoLabel.textColor = [UIColor blackColor];
    autoLabel.font = [UIFont systemFontOfSize: 17];
    [self.view addSubview: autoLabel];
    
    UIButton *autoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    autoBtn.frame = CGRectMake(50, 670, 17, 17);
    [autoBtn setImage:[UIImage imageNamed:@"不自动.png"] forState:UIControlStateNormal];
    [autoBtn setImage:[UIImage imageNamed:@"自动.png"] forState:UIControlStateSelected];
    [autoBtn addTarget:self action:@selector(toggleAutoLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: autoBtn];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview: address2];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"请添加作品说明/文章内容..."]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}

- (void)toggleAutoLogin:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)didSelectImage:(UIImage *)image {
    [self.pushView setImage: image forState: UIControlStateNormal];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length == 0) {
        textView.text = @"请添加作品说明/文章内容...";
        textView.textColor = [UIColor lightGrayColor];
    }
}

- (void)pushtheView {
    UIAlertController *alertright = [UIAlertController alertControllerWithTitle: @"提示" message: @"发布成功" preferredStyle: UIAlertControllerStyleAlert];
    [alertright addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
    [self presentViewController:alertright animated:YES completion:nil];
    
}

- (void)toggleButtonTapped:(UIButton *)sender {
    BOOL selected = sender.selected;
    sender.selected = !selected;
    if (!selected) {
        sender.backgroundColor = [UIColor systemBlueColor];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else {
        sender.backgroundColor = [UIColor whiteColor];
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}
- (void)pushWallView {
    WallViewController *wallView = [[WallViewController alloc] init];
    wallView.delegate = self;
    [self.navigationController pushViewController: wallView animated: YES];
}

- (void)didSelectImage:(UIImage *)image andCount:(NSInteger)count {
    if (image) {
        [self.pushView setImage:image forState:UIControlStateNormal];
    } else {
        [self.pushView setImage:[UIImage imageNamed:@"pictrue.png"] forState:UIControlStateNormal];
    }
    self.imagecounts.text = [NSString stringWithFormat:@"%ld", (long)count];
}

- (void)press:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.tableView.frame = CGRectMake(240, 220, 120, self.ary.count * 30);
    } else {
        self.tableView.frame = CGRectMake(240, 220, 120, 30);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.ary.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.text = self.ary[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* str = self.ary[indexPath.section];
    [self.ary removeObjectAtIndex:indexPath.section];
    [self.ary insertObject:str atIndex:0];
    [tableView reloadData];
    [self press:self.btn];
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end
