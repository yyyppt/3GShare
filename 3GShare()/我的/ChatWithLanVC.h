//
//  ChatWithLanVC.h
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatWithLanVC : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *messages;
@property (nonatomic, strong) UITextField *inputField;

@end

NS_ASSUME_NONNULL_END
