//
//  PushViewController.h
//  3gShare
//
//  Created by yyyyy on 2025/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PushViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *pushView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *ary;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *imagecounts;
@end

NS_ASSUME_NONNULL_END
