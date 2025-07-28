//
//  IssueTableViewCell.m
//  3gShare
//
//  Created by yyyyy on 2025/7/24.
//

#import "IssueTableViewCell.h"

@implementation IssueTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}
- (void)setupSubviews {
    self.imagelarge = [[UIImageView alloc] init];
    self.imagelarge.contentMode = UIViewContentModeScaleAspectFill;
    self.imagelarge.clipsToBounds = YES;
    [self.contentView addSubview: self.imagelarge];
    self.titlefir = [[UILabel alloc] init];
    self.titlefir.font = [UIFont boldSystemFontOfSize:20];
    [self.contentView addSubview:self.titlefir];

    self.subtitle = [[UILabel alloc] init];
    self.subtitle.font = [UIFont systemFontOfSize:14];
    self.subtitle.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.subtitle];

    self.looking = [[UIImageView alloc] init];
    self.looking.contentMode = UIViewContentModeScaleAspectFit;
    self.looking.image = [UIImage imageNamed: @"looking.png"];
    [self.contentView addSubview: self.looking];
    
    self.sharing = [[UIImageView alloc] init];
    self.sharing.contentMode = UIViewContentModeScaleAspectFit;
    self.sharing.image = [UIImage imageNamed: @"sharing.png"];
    [self.contentView addSubview: self.sharing];
    
    self.name = [[UILabel alloc] init];
    self.time = [[UILabel alloc] init];
    self.name.font = [UIFont systemFontOfSize: 15];
    self.time.font = [UIFont systemFontOfSize: 15];
    self.name.textColor = [UIColor grayColor];
    self.time.textColor = [UIColor grayColor];
    [self.contentView addSubview: self.name];
    [self.contentView addSubview: self.time];
    
    self.likecount = [[UILabel alloc] init];
    [self.contentView addSubview: self.likecount];
    
    self.isLiked = NO;
    
    self.like = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.like setImage:[UIImage imageNamed:@"liking.png"] forState:UIControlStateNormal];
    [self.like addTarget:self action:@selector(toggleLike) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.like];
}

- (void)toggleLike {
    self.isLiked = !self.isLiked;
    NSInteger currentCount = [self.likecount.text integerValue];
    if (self.isLiked) {
        currentCount += 1;
        [self.like setImage:[UIImage imageNamed:@"likingred.png"] forState:UIControlStateNormal];
    } else {
        currentCount -= 1;
        [self.like setImage:[UIImage imageNamed:@"liking.png"] forState:UIControlStateNormal];
    }
    self.likecount.text = [NSString stringWithFormat:@"%ld", (long)currentCount];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat padding = 10;
    CGFloat contentWidth = self.contentView.bounds.size.width;
    CGFloat contentHeight = self.contentView.bounds.size.height;
    self.imagelarge.frame = CGRectMake(padding, padding, 180, contentHeight - padding - 5);
    CGFloat textX = CGRectGetMaxX(self.imagelarge.frame) + padding;
    CGFloat textWidth = contentWidth - textX - padding;
    self.titlefir.frame = CGRectMake(textX, padding, textWidth, 28);
    self.subtitle.frame = CGRectMake(textX, CGRectGetMaxY(self.titlefir.frame), textWidth, 20);
    self.name.frame = CGRectMake(textX , CGRectGetMaxY(self.subtitle.frame) + 5, textWidth, 20);
    self.time.frame = CGRectMake(textX, CGRectGetMaxY(self.name.frame) + 3, textWidth, 18);
    CGFloat bottomPadding = 12;
    CGFloat likeButtonSize = 24;
    CGFloat likeY = contentHeight - bottomPadding - likeButtonSize;

    self.like.frame = CGRectMake(textX + 10, likeY, likeButtonSize, likeButtonSize);
    self.likecount.frame = CGRectMake(CGRectGetMaxX(self.like.frame) + 5, likeY + 2, 40, 20);
    self.looking.frame = CGRectMake(CGRectGetMaxX(self.likecount.frame) + 5, likeY + 2, 40, 20);
    self.sharing.frame = CGRectMake(CGRectGetMaxX(self.looking.frame) + 6, likeY + 2, 40, 20);
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
