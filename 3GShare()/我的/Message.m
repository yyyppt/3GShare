//
//  Message.m
//  3GShare()
//
//  Created by yyyyy on 2025/7/26.
//

#import "Message.h"

@implementation Message

- (instancetype)initWithText:(NSString *)text time:(NSString *)time avatar:(NSString *)avatar type:(MessageType)type {
    self = [super init];
    if (self) {
        _text =  text;
        _time = time;
        _avatar = avatar;
        _type = type;
    }
    return self;
}
@end
