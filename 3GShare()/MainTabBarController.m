//
//  MainTabBarController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import "MainTabBarController.h"
#import "homeViewController.h"
#import "UserViewController.h"
#import "giftViewController.h"
#import "searchViewController.h"
#import "dictViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    homeViewController *home = [[homeViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController: home];
    nav1.tabBarItem.title = @"";
    nav1.tabBarItem.image = [[UIImage imageNamed: @"home.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.selectedImage = [[UIImage imageNamed: @"homeselected.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    searchViewController *search = [[searchViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController: search];
    nav2.tabBarItem.title = @"";
    nav2.tabBarItem.image = [[UIImage imageNamed: @"search.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.selectedImage = [[UIImage imageNamed: @"searchselected.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    dictViewController *dict = [[dictViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController: dict];
    nav3.tabBarItem.title = @"";
    nav3.tabBarItem.image = [[UIImage imageNamed: @"dict.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.selectedImage = [[UIImage imageNamed: @"dictselected.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    giftViewController *gift = [[giftViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController: gift];
    nav4.tabBarItem.title = @"";
    nav4.tabBarItem.image = [[UIImage imageNamed: @"gift.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav4.tabBarItem.selectedImage = [[UIImage imageNamed: @"giftselected.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav4.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    UserViewController *user = [[UserViewController alloc] init];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController: user];
    nav5.tabBarItem.title = @"";
    nav5.tabBarItem.image = [[UIImage imageNamed: @"user.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav5.tabBarItem.selectedImage = [[UIImage imageNamed: @"userselected.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav5.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    self.tabBar.backgroundColor = [UIColor blackColor];
    self.viewControllers = @[nav1, nav2, nav3, nav4, nav5];

    self.tabBar.opaque = YES;
    self.tabBar.backgroundImage = [[UIImage alloc] init];
    self.tabBar.shadowImage = [[UIImage alloc] init];
    self.tabBar.barTintColor = [UIColor blackColor];
    self.tabBar.backgroundColor = [UIColor blackColor];
    self.tabBar.translucent = NO;
  
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
