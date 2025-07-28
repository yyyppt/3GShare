//
//  activityTableVC.m
//  3gShare
//
//  Created by yyyyy on 2025/7/24.
//

#import "activityTableVC.h"

@implementation activityTableVC

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.actlabel = [[UILabel alloc] init];
        self.actlabel.font = [UIFont systemFontOfSize: 14];
        self.actlabel.textColor = [UIColor blackColor];
        [self.contentView addSubview: self.actlabel];
        
        self.activityView = [[UIImageView alloc] init];
        self.activityView.contentMode = UIViewContentModeScaleToFill;
        self.activityView.clipsToBounds = YES;
        [self.contentView addSubview: self.activityView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.activityView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 180);
    self.actlabel.frame = CGRectMake(10, 185, self.contentView.bounds.size.width - 20, 30);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
