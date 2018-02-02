//
//  NSDecimalNumber+Arithmetic.h
//  
//
//  Created by 小磊 on 2018/2/1.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (Arithmetic)

/**
 加法
 */
- (NSDecimalNumber *(^)(NSString *))add;

/**
 减法
 */
- (NSDecimalNumber *(^)(NSString *))subtract;

/**
 乘法
 */
- (NSDecimalNumber *(^)(NSString *))multiply;

/**
 除法
 */
- (NSDecimalNumber *(^)(NSString *))divide;

/**
 向下取整

 @param position 取整的位数(小数点后)
 @return 返回取整后的本地化字符串
 */
- (NSString *)roundingDown:(short )position;
@end
