#define currentScreenHeight [UIScreen mainScreen].bounds.size.height;

#import <Foundation/Foundation.h>

@interface Adapter : NSObject

#pragma mark - 时间戳相关
+ (NSString *)getDateYMDFromTimerInterval:(NSString *)getDateYMDFromTimerInterval withDateFormat:(NSString *)dateFormat;

#pragma mark - 字符串处理(UILabel)
//改变字符串中某些字符的颜色
+ (NSMutableAttributedString *)changeStringColor:(NSString *)string strColor:(UIColor *)color strRange:(NSRange)range;
//改变字符串中某些字符的字体
+ (NSMutableAttributedString *)changeStringFont:(NSString *)string strFont:(UIFont *)font strRange:(NSRange)range;

#pragma mark - 屏幕适配相关
//设置位置
+(CGRect) set4Frame:(CGRect)rect4 and5Frame:(CGRect)rect5 and6Frame:(CGRect)rect6 and6_Frame:(CGRect) rect6_;
//图片选择
+(NSString *) setImage:(NSString *)image;
//设置字体大小
+(UIFont *) set4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_;
//设置加粗字体大小
+(UIFont *) setBold4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_;

#pragma mark - 正则校验
//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobileNum;
//身份证号验证
+ (BOOL)validateIdentityCard:(NSString *)identityCard;
//邮箱验证
+ (BOOL)validateEmail:(NSString *)email;
@end
