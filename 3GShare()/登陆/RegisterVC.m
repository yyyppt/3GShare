//
//  RegisterVC.m
//  3gShare
//
//  Created by yyyyy on 2025/7/21.
//

#import "RegisterVC.h"

@interface RegisterVC ()

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backgroudView = [[UIImageView alloc] initWithFrame: self.view.bounds];
    backgroudView.image =  [UIImage imageNamed: @"背景.png"];
    backgroudView.contentMode = UIViewContentModeScaleToFill;
    UIImageView *pichigh = [[UIImageView alloc] initWithFrame: CGRectMake(130, 130, 130, 130)];
    pichigh.image = [UIImage imageNamed: @"logo1.jpg"];
    pichigh.backgroundColor = [UIColor clearColor];
    [self.view addSubview: backgroudView];
    [self.view addSubview: pichigh];
    
    self.textFieldUser = [[UITextField alloc] initWithFrame: CGRectMake(70, 300, 250, 46)];
    self.textFieldUser.placeholder = @"请输入用户名";
    self.textFieldUser.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldUser.leftView = [self createLefticonViewWithImageName: @"账户.png"];
    self.textFieldUser.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview: self.textFieldUser];
    
    self.textFieldcode = [[UITextField alloc] initWithFrame: CGRectMake(70, 370, 250, 46)];
    self.textFieldcode.placeholder = @"请输入密码";
    self.textFieldcode.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldcode.secureTextEntry = YES;
    self.textFieldcode.leftView = [self createRighticonViewWithImageName: @"解锁.png"];
    self.textFieldcode.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview: self.textFieldcode];
    
    self.sectextFieldcode = [[UITextField alloc] initWithFrame: CGRectMake(70, 440, 250, 46)];
    self.sectextFieldcode.placeholder = @"请再一次输入密码";
    self.sectextFieldcode.borderStyle = UITextBorderStyleRoundedRect;
    self.sectextFieldcode.secureTextEntry = YES;
    self.sectextFieldcode.leftView = [self createRighticonViewWithImageName: @"密码.png"];
    self.sectextFieldcode.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview: self.sectextFieldcode];
    UIButton *registerBtn2 = [UIButton buttonWithType: UIButtonTypeSystem];
    registerBtn2.frame = CGRectMake(146, 510, 90, 40);
    [registerBtn2 setTitle: @"确认注册" forState: UIControlStateNormal];
    [registerBtn2 addTarget: self action: @selector(handleRegisterBtn2) forControlEvents: UIControlEventTouchUpInside];
    registerBtn2.tintColor = [UIColor whiteColor];
    registerBtn2.layer.borderColor = [UIColor whiteColor].CGColor;
    registerBtn2.layer.borderWidth = 1.0;
    registerBtn2.layer.cornerRadius = 8.0;
    registerBtn2.clipsToBounds = YES;
    [self.view addSubview: registerBtn2];
    backgroudView.userInteractionEnabled = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillShow:) name: UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillHide:) name: UIKeyboardWillHideNotification object: nil];
}

- (UIView *)createLefticonViewWithImageName: (NSString *)imageName {
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    icon.frame = CGRectMake(0, 0, 24, 24);
    UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [iconView addSubview:icon];
    icon.center = iconView.center;
    return iconView;
}
- (UIView *)createRighticonViewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *icon = [[UIImageView alloc] initWithImage:image];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    icon.frame = CGRectMake(0, 0, 24, 24);
    UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    icon.center = CGPointMake(iconView.bounds.size.width / 2, iconView.bounds.size.height / 2);
    [iconView addSubview:icon];
    return iconView;
}
- (void)handleRegisterBtn2 {
    NSString *username = self.textFieldUser.text;
    NSString *password = self.textFieldcode.text;
    NSString *confirmPassword = self.sectextFieldcode.text;

    if (username.length == 0 || password.length == 0 || confirmPassword.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:@"请输入完整的注册信息" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userDict = [defaults objectForKey: @"UserAccounts"];
    
    for (NSString *username in userDict) {
        if (self.textFieldUser.text == username) {
            UIAlertController *alertuser = [UIAlertController alertControllerWithTitle: @"错误" message: @"账号出现了重复" preferredStyle: UIAlertControllerStyleAlert];
            [alertuser addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
            [self presentViewController: alertuser animated: YES completion: nil];
            return;
        }
    }
    if (username.length > 15 || password.length > 15 || confirmPassword.length > 15) {
        UIAlertController *alert2 = [UIAlertController alertControllerWithTitle: @"错误" message: @"账号或密码过长" preferredStyle: UIAlertControllerStyleAlert];
        [alert2 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
        [self presentViewController: alert2 animated: YES completion: nil];
        return;
    }
    if (![password isEqualToString:confirmPassword]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:@"两次输入的密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    if (self.registerCompletion) {
        self.registerCompletion(username, password);
    }

    if ([self.delegate respondsToSelector:@selector(registerVC:didRegisterWithUsername:password:)]) {
        [self.delegate registerVC:self didRegisterWithUsername:username password:password];
    }
    UIAlertController *successAlert = [UIAlertController alertControllerWithTitle:@"成功" message:@"注册成功！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.navigationController) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    [successAlert addAction:okAction];
    [self presentViewController:successAlert animated:YES completion:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    if (!userInfo) return;

    CGRect keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyboardFrame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
           self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight / 3);
    }];

}

- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView animateWithDuration:0.3 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
