//
//  FirstVC.h
//  3gShare
//
//  Created by yyyyy on 2025/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
