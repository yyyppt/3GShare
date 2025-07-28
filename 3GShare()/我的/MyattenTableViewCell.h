//
//  MyattenTableViewCell.h
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyattenTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIButton *attention;
@property (nonatomic, assign) BOOL isAttention;

@end

NS_ASSUME_NONNULL_END
