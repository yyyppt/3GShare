//
//  ChatVC.h
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import <UIKit/UIKit.h>
#import "ChatWithLanVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChatVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ChatWithLanVC *chatwithLan;

@end

NS_ASSUME_NONNULL_END
