//
//  MessageTableViewCell.m
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (void)setMessage:(Message *)message {
    _message = message;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    Message *message = self.message;
    CGFloat contentWidth = self.bounds.size.width;

    // 移除旧视图
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    // 计算文本尺寸
    CGSize maxSize = CGSizeMake(200, CGFLOAT_MAX);
    CGRect textRect = [message.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    textRect.size.width += 20;
    textRect.size.height += 20;

    UIView *bubbleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textRect.size.width, textRect.size.height)];
    bubbleView.layer.cornerRadius = 10;
    bubbleView.clipsToBounds = YES;

    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, textRect.size.width - 20, textRect.size.height - 20)];
    messageLabel.numberOfLines = 0;
    messageLabel.font = [UIFont systemFontOfSize:16];
    messageLabel.text = message.text;

    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bubbleView.frame) + 2, 100, 14)];
    timeLabel.font = [UIFont systemFontOfSize:10];
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.text = message.time;

    // 头像
    UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    avatarView.layer.cornerRadius = 20;
    avatarView.clipsToBounds = YES;
    avatarView.image = [UIImage imageNamed:message.avatar];

    if (message.type == MessageTypeSent) {
        avatarView.frame = CGRectMake(contentWidth - 50, 10, 40, 40);
        bubbleView.backgroundColor = [UIColor colorWithRed:69 / 255.0 green:148 / 255.0 blue:213 / 255.0 alpha:1.0];
        messageLabel.textColor = [UIColor whiteColor];
        bubbleView.frame = CGRectMake(contentWidth - 60 - textRect.size.width, 10, textRect.size.width, textRect.size.height);
        timeLabel.frame = CGRectMake(contentWidth - 100, CGRectGetMaxY(bubbleView.frame) + 2, 90, 14);
    } else {
        avatarView.frame = CGRectMake(10, 10, 40, 40);
        bubbleView.backgroundColor = [UIColor lightGrayColor];
        messageLabel.textColor = [UIColor blackColor];
        bubbleView.frame = CGRectMake(60, 10, textRect.size.width, textRect.size.height);
        timeLabel.frame = CGRectMake(60, CGRectGetMaxY(bubbleView.frame) + 2, 90, 14);
    }

    [bubbleView addSubview:messageLabel];
    [self.contentView addSubview:avatarView];
    [self.contentView addSubview:bubbleView];
    [self.contentView addSubview:timeLabel];
    // 以下布局同原来，但使用 self.contentView.frame.size.width 是有效的
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
