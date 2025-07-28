//
//  ChatTableViewCell.h
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *saying;
@property (nonatomic, strong) UILabel *time;
@end

NS_ASSUME_NONNULL_END
