//
//  MessageTableViewCell.h
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import <UIKit/UIKit.h>
#import "Message.h"
NS_ASSUME_NONNULL_BEGIN

@interface MessageTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *bubbleView;
@property (nonatomic, strong) Message *message;
- (void)setMessage:(Message *)message;
@end

NS_ASSUME_NONNULL_END
