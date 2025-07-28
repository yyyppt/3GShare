//
//  searchViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import "searchViewController.h"
#import "DaBaiViewController.h"
#import "PushViewController.h"
#import "WallViewController.h"
@interface searchViewController () <UITextFieldDelegate>

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.navigationItem.title = @"搜索";

    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    UIImage *bgImage = [UIImage imageNamed:@"导航.png"];
    appearance.backgroundImage = bgImage;
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;

    UIImage *image = [[UIImage imageNamed:@"上传.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonTapped)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UITextField *searchField = [[UITextField alloc] initWithFrame:CGRectMake(16, 150, self.view.frame.size.width - 32, 36)];
    searchField.borderStyle = UITextBorderStyleRoundedRect;
    searchField.placeholder = @"搜索 用户名 作品分类 文章";
    searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchField.returnKeyType = UIReturnKeySearch;
    searchField.delegate = self;
    
    
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"搜索.png"]];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    leftImageView.frame = CGRectMake(0, 0, 20, 20);

    UIView *leftViewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    [leftViewContainer addSubview:leftImageView];
    leftImageView.center = leftViewContainer.center;

    searchField.leftView = leftViewContainer;
    searchField.leftViewMode = UITextFieldViewModeAlways;

    searchField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];

    UIImageView *img1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"search1.png"]];
    img1.frame = CGRectMake(0, 250, 80, 30);
    UIImageView *line1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"line1.png"]];
    line1.frame = CGRectMake(0, 280, self.view.bounds.size.width, 5);
    
    UIImageView *img2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"search2.png"]];
    img2.frame = CGRectMake(0, 400, 80, 30);
    UIImageView *line2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"line1.png"]];
    line2.frame = CGRectMake(0, 430, self.view.bounds.size.width, 5);
    
    
    UIImageView *img3 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"search3.png"]];
    img3.frame = CGRectMake(0, 530, 80, 30);
    UIImageView *line3 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"line1.png"]];
    line3.frame = CGRectMake(0, 560, self.view.bounds.size.width, 5);
    
    UIButton *customButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton1.frame = CGRectMake(10, 290, 90, 40);
    [customButton1 setTitle:@"平面设计" forState:UIControlStateNormal];
    [customButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton1.backgroundColor = [UIColor whiteColor];
    [customButton1 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton1.layer.masksToBounds = YES;
    customButton1.layer.borderWidth = 1;
    customButton1.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton1];
    
    UIButton *customButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton2.frame = CGRectMake(110, 290, 90, 40);
    [customButton2 setTitle:@"网页设计" forState:UIControlStateNormal];
    [customButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton2.backgroundColor = [UIColor whiteColor];
    [customButton2 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton2.layer.masksToBounds = YES;
    customButton2.layer.borderWidth = 1;
    customButton2.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton2];
    
    UIButton *customButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton3.frame = CGRectMake(210, 290, 90, 40);
    [customButton3 setTitle:@"UI/icon" forState:UIControlStateNormal];
    [customButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton3.backgroundColor = [UIColor whiteColor];
    [customButton3 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton3.layer.masksToBounds = YES;
    customButton3.layer.borderWidth = 1;
    customButton3.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton3];
    
    UIButton *customButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton4.frame = CGRectMake(310, 290, 90, 40);
    [customButton4 setTitle:@"插画/手绘" forState:UIControlStateNormal];
    [customButton4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton4.backgroundColor = [UIColor whiteColor];
    [customButton4 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton4.layer.masksToBounds = YES;
    customButton4.layer.borderWidth = 1;
    customButton4.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton4];
    
    UIButton *customButton5 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton5.frame = CGRectMake(10, 350, 90, 40);
    [customButton5 setTitle:@"虚拟设计" forState:UIControlStateNormal];
    [customButton5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton5.backgroundColor = [UIColor whiteColor];
    [customButton5 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton5.layer.masksToBounds = YES;
    customButton5.layer.borderWidth = 1;
    customButton5.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton5];
    
    UIButton *customButton6 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton6.frame = CGRectMake(110, 350, 90, 40);
    [customButton6 setTitle:@"影视" forState:UIControlStateNormal];
    [customButton6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton6.backgroundColor = [UIColor whiteColor];
    [customButton6 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton6.layer.masksToBounds = YES;
    customButton6.layer.borderWidth = 1;
    customButton6.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton6];
    
    UIButton *customButton7 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton7.frame = CGRectMake(210, 350, 90, 40);
    [customButton7 setTitle:@"摄影" forState:UIControlStateNormal];
    [customButton7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton7.backgroundColor = [UIColor whiteColor];
    [customButton7 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton7.layer.masksToBounds = YES;
    customButton7.layer.borderWidth = 1;
    customButton7.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton7];
    
    UIButton *customButton8 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton8.frame = CGRectMake(310, 350, 90, 40);
    [customButton8 setTitle:@"其他" forState:UIControlStateNormal];
    [customButton8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton8.backgroundColor = [UIColor whiteColor];
    [customButton8 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton8.layer.masksToBounds = YES;
    customButton8.layer.borderWidth = 1;
    customButton8.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton8];
    
    UIButton *customButton01 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton01.frame = CGRectMake(10, 450, 90, 40);
    [customButton01 setTitle:@"人气最高" forState:UIControlStateNormal];
    [customButton01 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton01.backgroundColor = [UIColor whiteColor];
    [customButton01 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton01.layer.masksToBounds = YES;
    customButton01.layer.borderWidth = 1;
    customButton01.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton01];
    
    UIButton *customButton02 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton02.frame = CGRectMake(110, 450, 90, 40);
    [customButton02 setTitle:@"收藏最多" forState:UIControlStateNormal];
    [customButton02 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton02.backgroundColor = [UIColor whiteColor];
    [customButton02 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton02.layer.masksToBounds = YES;
    customButton02.layer.borderWidth = 1;
    customButton02.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton02];
    
    UIButton *customButton03 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton03.frame = CGRectMake(210, 450, 90, 40);
    [customButton03 setTitle:@"评论最多" forState:UIControlStateNormal];
    [customButton03 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton03.backgroundColor = [UIColor whiteColor];
    [customButton03 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton03.layer.masksToBounds = YES;
    customButton03.layer.borderWidth = 1;
    customButton03.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton03];
    
    UIButton *customButton04 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton04.frame = CGRectMake(310, 450, 90, 40);
    [customButton04 setTitle:@"编辑精选" forState:UIControlStateNormal];
    [customButton04 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton04.backgroundColor = [UIColor whiteColor];
    [customButton04 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton04.layer.masksToBounds = YES;
    customButton04.layer.borderWidth = 1;
    customButton04.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton04];
    
    UIButton *customButton05 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton05.frame = CGRectMake(10, 580, 90, 40);
    [customButton05 setTitle:@"30分钟前" forState:UIControlStateNormal];
    [customButton05 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton05.backgroundColor = [UIColor whiteColor];
    [customButton05 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton05.layer.masksToBounds = YES;
    customButton05.layer.borderWidth = 1;
    customButton05.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton05];
    
    UIButton *customButton06 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton06.frame = CGRectMake(110, 580, 90, 40);
    [customButton06 setTitle:@"1小时前" forState:UIControlStateNormal];
    [customButton06 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton06.backgroundColor = [UIColor whiteColor];
    [customButton06 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton06.layer.masksToBounds = YES;
    customButton06.layer.borderWidth = 1;
    customButton06.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton06];
    
    UIButton *customButton07 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton07.frame = CGRectMake(210, 580, 90, 40);
    [customButton07 setTitle:@"1月前" forState:UIControlStateNormal];
    [customButton07 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton07.backgroundColor = [UIColor whiteColor];
    [customButton07 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton07.layer.masksToBounds = YES;
    customButton07.layer.borderWidth = 1;
    customButton07.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton07];
    
    UIButton *customButton08 = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton08.frame = CGRectMake(310, 580, 90, 40);
    [customButton08 setTitle:@"1年前" forState:UIControlStateNormal];
    [customButton08 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customButton08.backgroundColor = [UIColor whiteColor];
    [customButton08 addTarget:self action:@selector(toggleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    customButton08.layer.masksToBounds = YES;
    customButton08.layer.borderWidth = 1;
    customButton08.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:customButton08];
    
    [self.view addSubview: img1];
    [self.view addSubview: img2];
    [self.view addSubview: img3];
    [self.view addSubview: line1];
    [self.view addSubview: line2];
    [self.view addSubview: line3];
    [self.view addSubview:searchField];
}
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    if ([textField.text isEqualToString:@"大白"] || [textField.text isEqualToString:@"dabai"]) {
        DaBaiViewController *dabaiVC = [[DaBaiViewController alloc] init];
        [self.navigationController pushViewController:dabaiVC animated:YES];
    }
    
    return YES;
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
- (void)rightBarButtonTapped {
    PushViewController *writeVC = [[PushViewController alloc] init];

    [self.navigationController pushViewController:writeVC animated:YES];
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
