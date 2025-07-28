//
//  MyattenTableViewCell.m
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import "MyattenTableViewCell.h"

@implementation MyattenTableViewCell


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
        
        self.attention = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.attention setImage:[UIImage imageNamed:@"未关注.png"] forState:UIControlStateNormal];
        [self.attention addTarget:self action:@selector(toggleAttentionImage) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.attention];
    }
    return self;
}
- (void)toggleAttentionImage {
    self.isAttention = !self.isAttention;
    
    if (self.isAttention) {
        [self.attention setImage:[UIImage imageNamed:@"已关注.png"] forState:UIControlStateNormal];
    } else {
        [self.attention setImage:[UIImage imageNamed:@"未关注.png"] forState:UIControlStateNormal];
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.img.frame = CGRectMake(20, 23, 55, 55);
    self.name.frame = CGRectMake(100, 33, 180, 30);
    self.attention.frame = CGRectMake(320, 33, 70, 35);
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
