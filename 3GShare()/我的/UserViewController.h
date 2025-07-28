//
//  UserViewController.h
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import <UIKit/UIKit.h>
#import "MyinformViewController.h"
#import "SettingsViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MyinformViewController *myinformvc;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SettingsViewController *settingvc;
@end

NS_ASSUME_NONNULL_END
