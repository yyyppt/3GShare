//
//  SetTableViewCell.m
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import "SetTableViewCell.h"

@implementation SetTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.describeLabel = [[UILabel alloc] init];
        self.describeLabel.font = [UIFont systemFontOfSize: 18];
        self.describeLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview: self.describeLabel];
        
        self.img = [[UIImageView alloc] init];
        self.img.contentMode = UIViewContentModeScaleAspectFit;
        self.img.clipsToBounds = YES;
        [self.contentView addSubview: self.img];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.img.frame = CGRectMake(20, 20, 30, 30);
    self.describeLabel.frame = CGRectMake(80, 18, 300, 35);
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
