//
//  WallViewController.h
//  3gShare
//
//  Created by yyyyy on 2025/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WallViewDelegate <NSObject>

- (void)didSelectImage: (UIImage *)image andCount: (NSInteger)count;

@end


@interface WallViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) id<WallViewDelegate> delegate;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSMutableArray *selectedIndexes;

@end

NS_ASSUME_NONNULL_END
