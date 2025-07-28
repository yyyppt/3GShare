//
//  ChatTableViewCell.m
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.img = [[UIImageView alloc] init];
        self.img.contentMode = UIViewContentModeScaleAspectFit;
        self.img.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview: self.img];
        
        self.name = [[UILabel alloc] init];
        self.name.font = [UIFont systemFontOfSize: 18];
        self.name.textColor = [UIColor blackColor];
        [self.contentView addSubview: self.name];
        
        self.saying = [[UILabel alloc] init];
        self.saying.font = [UIFont systemFontOfSize: 15];
        self.saying.textColor = [UIColor colorWithRed:102/255.0 green:174/255.0 blue:219/255.0 alpha:1.0];
        [self.contentView addSubview: self.saying];
        
        self.time = [[UILabel alloc] init];
        self.time.font = [UIFont systemFontOfSize: 13];
        self.time.textColor = [UIColor grayColor];
        [self.contentView addSubview: self.time];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.img.frame = CGRectMake(20, 23, 55, 55);
    self.name.frame = CGRectMake(100, 18, 180, 30);
    self.saying.frame = CGRectMake(100, 48, 200, 30);
    self.time.frame = CGRectMake(300, 23, 140, 20);
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
