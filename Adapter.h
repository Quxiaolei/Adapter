#define currentScreenHeight [UIScreen mainScreen].bounds.size.height;

#import <Foundation/Foundation.h>

@interface Adapter : NSObject
//设置位置
+(CGRect) set4Frame:(CGRect)rect4 and5Frame:(CGRect)rect5 and6Frame:(CGRect)rect6 and6_Frame:(CGRect) rect6_;
//图片选择
+(NSString *) setImage:(NSString *)image;

//设置字体大小
+(UIFont *) set4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_;
+(UIFont *) setBold4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_;
//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobileNum;
@end
