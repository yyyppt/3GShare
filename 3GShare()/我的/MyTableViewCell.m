//
//  MyTableViewCell.m
//  3gShare
//
//  Created by yyyyy on 2025/7/25.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

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
    self.subtitle.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.subtitle];

    self.looking = [[UIImageView alloc] init];
    self.looking.contentMode = UIViewContentModeScaleAspectFit;
    self.looking.image = [UIImage imageNamed: @"liking.png"];
    [self.contentView addSubview: self.looking];
    
    self.sharing = [[UIImageView alloc] init];
    self.sharing.contentMode = UIViewContentModeScaleAspectFit;
    self.sharing.image = [UIImage imageNamed: @"looking.png"];
    [self.contentView addSubview: self.sharing];
    
    self.name = [[UILabel alloc] init];
    self.time = [[UILabel alloc] init];
    self.name.font = [UIFont systemFontOfSize: 15];
    self.time.font = [UIFont systemFontOfSize: 15];
    self.name.textColor = [UIColor blackColor];
    self.time.textColor = [UIColor blackColor];
    [self.contentView addSubview: self.name];
    [self.contentView addSubview: self.time];
    
    self.likecount = [[UILabel alloc] init];
    [self.contentView addSubview: self.likecount];
    self.sharingcount = [[UILabel alloc] init];
    [self.contentView addSubview: self.sharingcount];
    self.lookingcount = [[UILabel alloc] init];
    [self.contentView addSubview: self.lookingcount];
    
    self.isLiked = NO;
    self.like = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.like setImage:[UIImage imageNamed:@"个人1.png"] forState: UIControlStateNormal];
    [self.contentView addSubview:self.like];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat padding = 10;
    CGFloat imageWidth = 120;
    CGFloat contentWidth = self.contentView.bounds.size.width;
    CGFloat contentHeight = self.contentView.bounds.size.height;

    self.imagelarge.frame = CGRectMake(padding - 5, padding, imageWidth + 15, contentHeight - padding - 5);
    CGFloat textX = CGRectGetMaxX(self.imagelarge.frame) + padding;
    CGFloat textWidth = contentWidth - textX - padding;

    self.titlefir.frame = CGRectMake(textX + 20, padding, textWidth, 28);
    self.subtitle.frame = CGRectMake(textX + 20, CGRectGetMaxY(self.titlefir.frame) + 10, textWidth, 20);
    self.name.frame = CGRectMake(textX + 20, CGRectGetMaxY(self.subtitle.frame) + 15, textWidth, 20);
    
    CGFloat bottomPadding = 12;
    CGFloat likeButtonSize = 24;
    CGFloat likeY = contentHeight - bottomPadding - likeButtonSize;

    self.like.frame = CGRectMake(textX + 10, likeY, likeButtonSize, likeButtonSize);
    self.likecount.frame = CGRectMake(CGRectGetMaxX(self.like.frame) + 6, likeY + 2, 27, 20);
    self.looking.frame = CGRectMake(CGRectGetMaxX(self.likecount.frame), likeY, 40, 22);
    self.lookingcount.frame = CGRectMake(CGRectGetMaxX(self.likecount.frame) + 38, likeY + 2, 27, 20);
    self.sharing.frame = CGRectMake(CGRectGetMaxX(self.looking.frame) + 23, likeY + 2, 40, 20);
    self.sharingcount.frame = CGRectMake(CGRectGetMaxX(self.looking.frame) + 63, likeY + 2, 27, 20);
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
