//
//  Adapter.h
//  
//
//  Created by yiliao on 14/12/3.
//  Copyright (c) 2014年 CYRJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Adapter : NSObject
+(CGRect) set4Frame:(CGRect)rect4 and5Frame:(CGRect)rect5 and6Frame:(CGRect)rect6 and6_Frame:(CGRect) rect6_;
+(NSString *) setImage:(NSString *)image;

+(UIFont *) set4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_;
+(UIFont *) setBold4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_;

+ (BOOL)validateMobile:(NSString *)mobileNum;
@end
