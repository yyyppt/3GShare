//
//  LoginVC.m
//  3gShare
//
//  Created by yyyyy on 2025/7/21.
//

#import "LoginVC.h"
#import "RegisterVC.h"
#import "MainTabBarController.h"
@interface LoginVC () <UITextFieldDelegate, RegisterVCDelegate>

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey: @"UserAccounts"]) {
        NSDictionary *defaultUser = @{@"a": @"1"};
        [defaults setObject: defaultUser forKey: @"UserAccounts"];
        
    }
    
    UIImageView *backgroudView = [[UIImageView alloc] initWithFrame: self.view.bounds];
    backgroudView.image =  [UIImage imageNamed: @"背景.png"];
    backgroudView.contentMode = UIViewContentModeScaleToFill;
    UIImageView *pichigh = [[UIImageView alloc] initWithFrame: CGRectMake(130, 150, 130, 130)];
    pichigh.image = [UIImage imageNamed: @"logo1.jpg"];
    pichigh.backgroundColor = [UIColor clearColor];
    
    self.textFieldUser = [[UITextField alloc] initWithFrame: CGRectMake(70, 320, 250, 46)];
    self.textFieldUser.placeholder = @"请输入用户名";
    self.textFieldUser.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldUser.leftView = [self createLefticonViewWithImageName: @"账户.png"];
    self.textFieldUser.leftViewMode = UITextFieldViewModeAlways;
    
    self.textFieldcode = [[UITextField alloc] initWithFrame: CGRectMake(70, 390, 250, 46)];
    self.textFieldcode.placeholder = @"请输入密码";
    self.textFieldcode.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldcode.secureTextEntry = YES;
    self.textFieldcode.leftView = [self createRighticonViewWithImageName: @"解锁.png"];
    self.textFieldcode.leftViewMode = UITextFieldViewModeAlways;
    
    UIButton *loginBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(85, 470, 90, 40);
    [loginBtn setTitle: @"登陆" forState: UIControlStateNormal];
    [loginBtn addTarget: self action: @selector(handleLoginBtn) forControlEvents: UIControlEventTouchUpInside];
    loginBtn.tintColor = [UIColor whiteColor];
    loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    loginBtn.layer.borderWidth = 1.0;
    loginBtn.layer.cornerRadius = 8.0;
    loginBtn.clipsToBounds = YES;
    [self.view addSubview: loginBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    registerBtn.frame = CGRectMake(205, 470, 90, 40);
    [registerBtn setTitle: @"注册" forState: UIControlStateNormal];
    [registerBtn addTarget: self action: @selector(handleRegisterBtn) forControlEvents: UIControlEventTouchUpInside];
    registerBtn.tintColor = [UIColor whiteColor];
    registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    registerBtn.layer.borderWidth = 1.0;
    registerBtn.layer.cornerRadius = 8.0;
    registerBtn.clipsToBounds = YES;
    [self.view addSubview: registerBtn];
    
    UILabel *autoLabel = [[UILabel alloc] initWithFrame: CGRectMake(83, 515, 90, 23)];
    autoLabel.text = @"自动登录";
    autoLabel.textColor = [UIColor whiteColor];
    autoLabel.font = [UIFont systemFontOfSize: 14];
    [self.view addSubview: autoLabel];
    
    self.autoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.autoBtn.frame = CGRectMake(60, 518, 17, 17);
    [self.autoBtn setImage:[UIImage imageNamed:@"不自动.png"] forState:UIControlStateNormal];
    [self.autoBtn setImage:[UIImage imageNamed:@"自动.png"] forState:UIControlStateSelected];
    [self.autoBtn addTarget:self action:@selector(toggleAutoLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.autoBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillShow:) name: UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillHide:) name: UIKeyboardWillHideNotification object: nil];
    [self.view addSubview: backgroudView];
    [self.view sendSubviewToBack: backgroudView];
    [self.view addSubview: pichigh];
    [self.view addSubview: self.textFieldUser];
    [self.view addSubview: self.textFieldcode];
}
- (void)toggleAutoLogin:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (void)handleLoginBtn {
    NSString *username = self.textFieldUser.text;
    NSString *password = self.textFieldcode.text;
    if (username.length > 15 || password.length > 15) {
        UIAlertController *alert2 = [UIAlertController alertControllerWithTitle: @"错误" message: @"账号或密码过长" preferredStyle: UIAlertControllerStyleAlert];
        [alert2 addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
        [self presentViewController: alert2 animated: YES completion: nil];
        return;
    }
    NSDictionary *userDict = [[NSUserDefaults standardUserDefaults] objectForKey: @"UserAccounts"];
    NSString *savedPassword = userDict[username];
    if (savedPassword && [savedPassword isEqualToString: password]) {
        MainTabBarController *mainTabBar = [[MainTabBarController alloc] init];
        self.view.window.rootViewController = mainTabBar;
    } else {
        UIAlertController *alertright = [UIAlertController alertControllerWithTitle: @"错误" message: @"账号或密码错误" preferredStyle: UIAlertControllerStyleAlert];
        [alertright addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
        [self presentViewController: alertright animated: YES completion: nil];
        return;
    }
    
}

- (void)handleRegisterBtn {
    RegisterVC *vcRegister = [[RegisterVC alloc] init];
    vcRegister.delegate = self;
    [self presentViewController: vcRegister animated: YES completion: nil];
}

- (void)registerVC:(RegisterVC *)registerVC didRegisterWithUsername:(NSString *)username password:(NSString *)password {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *userDict = [[defaults objectForKey:@"UserAccounts"] mutableCopy];
    if (!userDict) {
        userDict = [NSMutableDictionary dictionary];
    }
    userDict[username] = password;
    [defaults setObject:userDict forKey:@"UserAccounts"];
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
- (UIView *)createRighticonViewWithImageName: (NSString *)imageName {
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    icon.frame = CGRectMake(0, 0, 24, 24);
    UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [iconView addSubview:icon];
    icon.center = iconView.center;
    return iconView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyboardFrame.size.height;

    [UIView animateWithDuration:0.3 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight / 2);
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
