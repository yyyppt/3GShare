//
//  SettingsViewController.h
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import <UIKit/UIKit.h>
#import "SetDataViewController.h"
#import "MessageSetVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) MessageSetVC *messagesetvc;
@property (nonatomic, strong) SetDataViewController *setDatavc;
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
