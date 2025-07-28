//
//  RegisterVC.h
//  3gShare
//
//  Created by yyyyy on 2025/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@class RegisterVC;

@protocol RegisterVCDelegate <NSObject>

- (void)registerVC:(RegisterVC *)registerVC didRegisterWithUsername:(NSString *)username password:(NSString *)password;

@end

@interface RegisterVC : UIViewController
@property (nonatomic, weak) id<RegisterVCDelegate> delegate;

@property (nonatomic, copy) void (^registerCompletion)(NSString *username, NSString *password);
@property (nonatomic, strong) UITextField *textFieldUser;
@property (nonatomic, strong) UITextField *textFieldcode;
@property (nonatomic, strong) UITextField *sectextFieldcode;

@end

NS_ASSUME_NONNULL_END
