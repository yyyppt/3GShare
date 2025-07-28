//
//  ChangeWordVC.m
//  3GShare()
//
//  Created by yyyyy on 2025/7/28.
//

#import "ChangeWordVC.h"


static NSString *str = @"id";
@interface ChangeWordVC ()



@end

@implementation ChangeWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"修改密码";

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

    CGFloat margin = 15;
    CGFloat labelWidth = 80;
    CGFloat rowHeight = 44;
    CGFloat spacing = 20;
    CGFloat width = self.view.frame.size.width;
    UIFont *labelFont = [UIFont systemFontOfSize:16];
    UIFont *fieldFont = [UIFont systemFontOfSize:16];

    NSArray *labels = @[@"旧密码", @"新密码", @"确认密码"];
    NSArray *placeholders = @[@"请输入旧密码", @"请输入新密码", @"请再次输入新密码"];

    for (int i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(margin, 100 + i * (rowHeight + spacing), labelWidth, rowHeight)];
        label.text = labels[i];
        label.font = labelFont;
        [self.view addSubview:label];

        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(margin + labelWidth, 100 + i * (rowHeight + spacing), width - margin * 2 - labelWidth, rowHeight)];
        textField.placeholder = placeholders[i];
        textField.secureTextEntry = YES;
        textField.borderStyle = UITextBorderStyleNone;
        textField.font = fieldFont;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [self.view addSubview:textField];

        if (i == 0) {
            self.oldpassword = textField;
        } else if (i == 1) {
            self.newpassword = textField;
        } else {
            self.againpassword = textField;
        }
    }

    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    confirmBtn.frame = CGRectMake(margin, 100 + 3 * (rowHeight + spacing) + 10, width - 2 * margin, 44);
    [confirmBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [confirmBtn addTarget:self action:@selector(confirmButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewTapped {
    [self.view endEditing:YES];
}

- (void)confirmButtonTapped {
    NSString *oldPwd = self.oldpassword.text ?: @"";
    NSString *newPwd = self.newpassword.text ?: @"";
    NSString *againPwd = self.againpassword.text ?: @"";
    if (oldPwd.length == 0 || newPwd.length == 0 || againPwd.length == 0) {
        [self showAlertWithTitle:@"提示" message:@"请填写所有密码字段"];
        return;
    }
    if (newPwd.length < 5 || newPwd.length > 16) {
        [self showAlertWithTitle:@"提示" message:@"新密码长度需为6-15位"];
        return;
    }
    if (![newPwd isEqualToString:againPwd]) {
        [self showAlertWithTitle:@"提示" message:@"两次输入的新密码不一致"];
        return;
    }
    if ([oldPwd isEqualToString:newPwd]) {
        [self showAlertWithTitle:@"提示" message:@"新密码不能与原密码相同"];
        return;
    }
    [self showAlertWithTitle:@"成功" message:@"密码修改成功"];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
