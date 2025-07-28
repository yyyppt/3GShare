//
//  SendViewController.m
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import "SendViewController.h"

@interface SendViewController ()

@property (nonatomic, strong) UIButton *like;

@property (nonatomic, strong) UILabel *likecount;
@property (nonatomic, strong) UIImageView *looking;
@property (nonatomic, strong) UIImageView *sharing;

@end

@implementation SendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回白.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:scrollView];
    
    UIImageView *imagehead = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"imgsend1.png"]];
    imagehead.frame = CGRectMake(13, 13, 70, 70);
    [scrollView addSubview:imagehead];
    
    UILabel *title1 = [[UILabel alloc] initWithFrame: CGRectMake(103, 13, 70, 40)];
    title1.text = @"假日";
    title1.font = [UIFont boldSystemFontOfSize: 19];
    UILabel *name = [[UILabel alloc] initWithFrame: CGRectMake(103, 43, 160, 40)];
    name.text = @"share小白";
    name.font = [UIFont systemFontOfSize: 16];
    UILabel *time = [[UILabel alloc] initWithFrame: CGRectMake(250, 13, 70, 40)];
    time.text = @"刚刚";
    time.font = [UIFont systemFontOfSize: 16];
    [scrollView addSubview: title1];
    [scrollView addSubview: name];
    [scrollView addSubview: time];
    

    UIImageView *hImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imgsend2.png"]];
    hImage1.frame = CGRectMake(0, 140, self.view.bounds.size.width, 250);
    [scrollView addSubview:hImage1];

    UIImageView *hImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imgsend3.png"]];
    hImage2.frame = CGRectMake(0, CGRectGetMaxY(hImage1.frame) + 20, self.view.bounds.size.width, 250);
    [scrollView addSubview:hImage2];

    UIImageView *vImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imgsend4.png"]];
    vImage.frame = CGRectMake(13, CGRectGetMaxY(hImage2.frame) + 20, self.view.bounds.size.width, 400);
    [scrollView addSubview:vImage];
    
    self.looking = [[UIImageView alloc] init];
    self.looking.contentMode = UIViewContentModeScaleAspectFit;
    self.looking.image = [UIImage imageNamed: @"looking.png"];
    self.looking.frame = CGRectMake(300, 80, 40, 20);
    
    [scrollView addSubview: self.looking];
    self.sharing = [[UIImageView alloc] init];
    self.sharing.contentMode = UIViewContentModeScaleAspectFit;
    self.sharing.image = [UIImage imageNamed: @"sharing.png"];
    self.sharing.frame = CGRectMake(350, 80, 40, 20);
    [scrollView addSubview: self.sharing];
    
    self.like = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.like setImage:[UIImage imageNamed:@"liking.png"] forState:UIControlStateNormal];
    [self.like addTarget:self action:@selector(toggleLike) forControlEvents:UIControlEventTouchUpInside];
    self.like.frame = CGRectMake(235, 75, 30, 30);
    [self.like setImage:[UIImage imageNamed:(self.isLiked ? @"likingred.png" : @"liking.png")] forState:UIControlStateNormal];
    [scrollView addSubview:self.like];
    
    self.likecount = [[UILabel alloc] init];
    self.likecount.frame = CGRectMake(265, 80, 40, 20);
    self.likecount.text = self.likeCountText;
    [scrollView addSubview: self.likecount];

    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(vImage.frame) + 20);
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
    if ([self.delegate respondsToSelector: @selector(didUpdateLikeStatus:likeCount:)]) {
        [self.delegate didUpdateLikeStatus: self.isLiked likeCount: currentCount];
    }
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
