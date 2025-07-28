//
//  SetDataTableViewCell.m
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import "SetDataTableViewCell.h"

@implementation SetDataTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title = [[UILabel alloc] init];
        self.title.font = [UIFont systemFontOfSize: 18];
        self.title.textColor = [UIColor blackColor];
        [self.contentView addSubview: self.title];
        
        self.pic = [[UIImageView alloc] init];
        self.pic.contentMode = UIViewContentModeScaleAspectFit;
        self.pic.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview: self.pic];
        
        self.desctitle = [[UILabel alloc] init];
        self.desctitle.font = [UIFont systemFontOfSize: 16];
        self.desctitle.textColor = [UIColor blackColor];
        [self.contentView addSubview: self.desctitle];
        
        self.manbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.manbtn setImage:[UIImage imageNamed:@"unselectbtn2.png"] forState:UIControlStateNormal];
        [self.manbtn setImage:[UIImage imageNamed:@"selectbtn1.png"] forState:UIControlStateSelected];
        [self.manbtn setTitle:@"男" forState:UIControlStateNormal];
        [self.manbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self.manbtn addTarget:self action:@selector(selectGender:) forControlEvents:UIControlEventTouchUpInside];
        self.manbtn.selected = YES;
        [self.contentView addSubview:self.manbtn];

        self.womanbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.womanbtn setImage:[UIImage imageNamed:@"unselectbtn2.png"] forState:UIControlStateNormal];
        [self.womanbtn setImage:[UIImage imageNamed:@"selectbtn1.png"] forState:UIControlStateSelected];
        [self.womanbtn setTitle:@"女" forState:UIControlStateNormal];
        [self.womanbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.womanbtn addTarget:self action:@selector(selectGender:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.womanbtn];
    }
    return self;
}
- (void)selectGender:(UIButton *)sender {
    if (sender == self.manbtn) {
        self.manbtn.selected = YES;
        self.womanbtn.selected = NO;
    } else if (sender == self.womanbtn) {
        self.manbtn.selected = NO;
        self.womanbtn.selected = YES;
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.title.frame = CGRectMake(20, 23, 93, 23);
    self.desctitle.frame = CGRectMake(120, 20, 260, 35);
    self.pic.frame = CGRectMake(120, 0, 60, 60);

    if ([self.title.text isEqualToString:@"性别"]) {
        self.manbtn.hidden = NO;
        self.womanbtn.hidden = NO;
        self.desctitle.hidden = YES;
        self.pic.hidden = YES;

        self.manbtn.frame = CGRectMake(120, 15, 80, 35);
        self.womanbtn.frame = CGRectMake(210, 15, 80, 35);
    } else {
        self.manbtn.hidden = YES;
        self.womanbtn.hidden = YES;
        self.desctitle.hidden = NO;
        self.pic.hidden = NO;
    }
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
