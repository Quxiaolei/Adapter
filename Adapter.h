
/**
 *  主要功能:
 *  1,通过代码适配,传入不同的参数进行布局,选择不同的图片,设置字体大小
 *  2,手机号码验证,身份证号码验证,邮箱验证
 *  3,时间戳转换为相应格式的时间字符串
 *  4,字符串处理(包括字体大小,颜色设置)(UILabel)
 *  5,文件路径获取,读写用户默认配置文件,解归档
 *  6,UI效果显示
 */

#pragma mark - 宏定义
//判断IOS8
#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES:NO
//屏幕物理宽度
#define currentScreenWidth [UIScreen mainScreen ].bounds.size.width
//屏幕物理高度
#define currentScreenHeight [UIScreen mainScreen].bounds.size.height
//RGB色
#define RGBColor(a,b,c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1.0]
//RGB色和alpha值
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:a/1.0]
//16进制色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h> //md5


@interface Adapter : NSObject

#pragma mark - 时间戳相关
//获取当前时间戳
+ (NSString *)getTimestampSince1970;
//根据传入格式,转换时间格式
//yyyy-MM-dd HH:mm
+ (NSString *)getDateYMDFromTimerInterval:(NSString *)getDateYMDFromTimerInterval withDateFormat:(NSString *)dateFormat;

#pragma mark - 字符串处理
//md5加密
+ (NSString *)md5:(NSString *)str;
//base64加密
+ (NSString * )getBase64StringWithoutSpace:(NSString *) preBase64String;
//Unicode转换
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

#pragma mark - 字符串处理(UILabel)
//(.attributedText = )
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

#pragma mark - 文件处理
//截屏(传入所截视图)
+ (void)getSnapshotFromView:(UIView *)currentView;

//通过文件夹和文件名获取文件路径
+ (NSString *)getFilePathWithDirectoryName:(NSString *)directoryName fileName:(NSString *)fileName;

//更新用户默认配置文件
+ (BOOL)setUserDefaultsWithObjectArray:(NSArray *)objectArray keyArray:(NSArray *)keyArray;
//查询用户默认配置文件
+ (NSMutableArray * )getUserDefaultsWithKeyArray:(NSArray *)keyArray;

//归档
+ (BOOL)archiverWithObjectArray:(NSArray *)objectArray keyArray:(NSArray *)keyArray;
//解档
+ (NSMutableArray *)unarchiverWithKeyArray:(NSArray *)keyArray;

#pragma mark - UI附加效果展示
//警告窗口
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonString:(NSString *)cancelString delegate:(id)delegate tag:(NSInteger)tag;
@end
