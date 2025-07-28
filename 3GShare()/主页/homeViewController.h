//
//  homeViewController.h
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface homeViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong, nullable) NSTimer *timerScrollView;
@property (nonatomic, assign) BOOL isDragging;

@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
