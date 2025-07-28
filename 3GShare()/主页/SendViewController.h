//
//  SendViewController.h
//  3gShare
//
//  Created by yyyyy on 2025/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SendViewControllerDelegate <NSObject>

- (void)didUpdateLikeStatus:(BOOL)isLiked likeCount:(NSInteger)likeCount;

@end

@interface SendViewController : UIViewController

@property (nonatomic, copy) NSString *likeCountText;
@property (nonatomic, assign) BOOL isLiked;
@property (nonatomic, weak) id<SendViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
