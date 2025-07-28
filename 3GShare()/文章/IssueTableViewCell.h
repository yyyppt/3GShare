//
//  IssueTableViewCell.h
//  3gShare
//
//  Created by yyyyy on 2025/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IssueTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imagelarge;
@property (nonatomic, strong) UILabel *titlefir;
@property (nonatomic, strong) UILabel *subtitle;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UIButton *like;
@property (nonatomic, assign) BOOL isLiked;
@property (nonatomic, strong) UILabel *likecount;
@property (nonatomic, strong) UIImageView *looking;
@property (nonatomic, strong) UIImageView *sharing;

@end

NS_ASSUME_NONNULL_END
