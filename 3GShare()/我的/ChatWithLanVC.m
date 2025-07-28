//
//  ChatWithLanVC.m
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import "ChatWithLanVC.h"
#import "Message.h"
#import "MessageTableViewCell.h"
@interface ChatWithLanVC ()

@end

@implementation ChatWithLanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"share小兰";

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
    self.messages = [NSMutableArray array];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];

    CGFloat inputHeight = 50;
    UIView *inputContainer = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - inputHeight, self.view.bounds.size.width, inputHeight)];
    inputContainer.backgroundColor = [UIColor whiteColor];
    inputContainer.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:inputContainer];
    
    
    
    self.inputField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, inputContainer.bounds.size.width - 20, 30)];
    self.inputField.placeholder = @"请输入消息...";
    self.inputField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputField.delegate = self;
    [self.inputField addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventEditingDidEndOnExit];
    [inputContainer addSubview:self.inputField];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}
- (void)dismissKeyboard {
    [self.view endEditing:YES];
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sendMessage {
    if (self.inputField.text.length == 0) {
        return;
    }
    static int count = 0;
    NSString *text = self.inputField.text;
    NSString *avatar = (count % 2 == 0) ? @"img03.png" : @"img12.png";
    MessageType type = (count % 2 == 0) ? MessageTypeSent : MessageTypeReceived;
    NSString *time = [NSString stringWithFormat: @"10:%02d", count];
    Message *message = [[Message alloc] initWithText:text time:time avatar:avatar type:type];
    [self.messages addObject:message];
    [self.tableView reloadData];
    [self scrollToBottom];
    self.inputField.text = @"";
    count++;
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    CGRect keyboardFrameInWindow = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:keyboardFrameInWindow fromView:nil];
    CGFloat keyboardHeight = keyboardFrame.size.height;

    [UIView animateWithDuration:0.25 animations:^{
        CGRect inputFrame = self.inputField.superview.frame;
        CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
        inputFrame.origin.y = self.view.bounds.size.height - keyboardHeight - inputFrame.size.height + tabBarHeight;
        self.inputField.superview.frame = inputFrame;

        CGRect tableFrame = self.tableView.frame;
        tableFrame.size.height = inputFrame.origin.y;
        self.tableView.frame = tableFrame;

        [self scrollToBottom];
    }];
}

// 替换 keyboardWillHide: 方法，确保输入框恢复到底部，并恢复 tableView 的高度
- (void)keyboardWillHide:(NSNotification *)notification {
    CGFloat inputHeight = self.inputField.superview.frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        self.inputField.superview.frame = CGRectMake(0, self.view.bounds.size.height - inputHeight, self.view.bounds.size.width, inputHeight);
        self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - inputHeight);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Message *message = self.messages[indexPath.row];
    CGSize maxSize = CGSizeMake(200, CGFLOAT_MAX);
    CGRect rect = [message.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    return rect.size.height + 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MessageCell";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Message *message = self.messages[indexPath.row];
    [cell setMessage:message];
    return cell;
}

- (void)scrollToBottom {
    if (self.messages.count > 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messages.count - 1 inSection: 0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
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
