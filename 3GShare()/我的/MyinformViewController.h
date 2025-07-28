//
//  MyinformViewController.h
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import <UIKit/UIKit.h>
#import "MyattenViewController.h"
#import "ChatVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyinformViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) ChatVC *chatvc;
@property (nonatomic, strong) MyattenViewController *myattentionvc;
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
