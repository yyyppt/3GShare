//
//  dictViewController.h
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface dictViewController : UIViewController

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIViewController *firstVC;
@property (nonatomic, strong) UIViewController *secondVC;
@property (nonatomic, strong) UIViewController *thirdVC;
@property (nonatomic, strong) UIViewController *selectedVC;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

NS_ASSUME_NONNULL_END
