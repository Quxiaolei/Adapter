//
//  NSDecimalNumber+Arithmetic.m
//  
//
//  Created by 小磊 on 2018/2/1.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "NSDecimalNumber+Arithmetic.h"

// 暂时精确到小数点后4位
static int Scale = 4;
@implementation NSDecimalNumber (Arithmetic)

- (NSDecimalNumber *(^)(NSString *))add {
    NSDecimalNumberHandler *decimalNumberHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:Scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    return ^(NSString *decimalString){
        NSDecimalNumber *secondDecimalNumber = [NSDecimalNumber decimalNumberWithString:decimalString];
        NSDecimalNumber *resultDecimalNumber = [self decimalNumberByAdding:secondDecimalNumber withBehavior:decimalNumberHandler];
        return resultDecimalNumber;
    };
}

- (NSDecimalNumber *(^)(NSString *))subtract {
    NSDecimalNumberHandler *decimalNumberHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:Scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    return ^(NSString *decimalString){
        NSDecimalNumber *secondDecimalNumber = [NSDecimalNumber decimalNumberWithString:decimalString];
        NSDecimalNumber *resultDecimalNumber = [self decimalNumberBySubtracting:secondDecimalNumber withBehavior:decimalNumberHandler];
        return resultDecimalNumber;
    };
}

- (NSDecimalNumber *(^)(NSString *))multiply {
    NSDecimalNumberHandler *decimalNumberHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:Scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    return ^(NSString *decimalString){
        NSDecimalNumber *secondDecimalNumber = [NSDecimalNumber decimalNumberWithString:decimalString];
        NSDecimalNumber *resultDecimalNumber = [self decimalNumberByMultiplyingBy:secondDecimalNumber withBehavior:decimalNumberHandler];
        return resultDecimalNumber;
    };
}

- (NSDecimalNumber *(^)(NSString *))divide {
    NSDecimalNumberHandler *decimalNumberHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:Scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    return ^(NSString *decimalString){
        NSDecimalNumber *secondDecimalNumber = [NSDecimalNumber decimalNumberWithString:decimalString];
        NSDecimalNumber *resultDecimalNumber = [self decimalNumberByDividingBy:secondDecimalNumber withBehavior:decimalNumberHandler];
        return resultDecimalNumber;
    };
}

// 向下取整
- (NSString *)roundingDown:(short )position {
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *roundedOunces = [self decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [NSString stringWithFormat:@"%@",[roundedOunces descriptionWithLocale:nil]];
}
@end
