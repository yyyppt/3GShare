//
//  MyinformTableViewCell.m
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import "MyinformTableViewCell.h"

@implementation MyinformTableViewCell

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
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview: self.img];
        
        self.numLabdel = [[UILabel alloc] init];
        self.numLabdel.font = [UIFont systemFontOfSize: 18];
        self.numLabdel.textColor = [UIColor colorWithRed:102/255.0 green:174/255.0 blue:219/255.0 alpha:1.0];
        [self.contentView addSubview: self.numLabdel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.img.frame = CGRectMake(300, 23, 23, 23);
    self.numLabdel.frame = CGRectMake(334, 23, 20, 20);
    self.describeLabel.frame = CGRectMake(20, 20, 300, 35);
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
