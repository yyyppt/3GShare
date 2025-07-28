//
//  MessageSetTableViewCell.m
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import "MessageSetTableViewCell.h"

@implementation MessageSetTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.title = [[UILabel alloc] init];
        self.title.font = [UIFont systemFontOfSize: 18];
        self.title.textColor = [UIColor blackColor];
        [self.contentView addSubview: self.title];
        
        self.selectedbtn = [UIButton buttonWithType:UIButtonTypeCustom];

        [self.selectedbtn setImage:[UIImage imageNamed:@"不自动.png"] forState:UIControlStateNormal];
        [self.selectedbtn setImage:[UIImage imageNamed:@"自动.png"] forState:UIControlStateSelected];
        [self.selectedbtn addTarget:self action:@selector(selectedButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

        [self.contentView addSubview:self.selectedbtn];
    }
    return self;
}
- (void)selectedButtonTapped:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.title.frame = CGRectMake(20, 23, 155, 55);
    self.selectedbtn.frame = CGRectMake(360, 24, 40, 40);
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
