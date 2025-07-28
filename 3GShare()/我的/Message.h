//
//  Message.h
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MessageType) {
    MessageTypeSent,
    MessageTypeReceived
};

@interface Message : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, assign) MessageType type;

- (instancetype) initWithText: (NSString *)text time:(NSString *)time avatar: (NSString *)avater type:(MessageType)type;

@end

NS_ASSUME_NONNULL_END
