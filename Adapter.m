#import "Adapter.h"

@implementation Adapter

+(CGRect) set4Frame:(CGRect)rect4 and5Frame:(CGRect)rect5 and6Frame:(CGRect)rect6 and6_Frame:(CGRect) rect6_
{
    int height=(int) [UIScreen mainScreen].bounds.size.height;
    if(height==480){
        return rect4;
    }else if (height==568){
        return rect5;
    }else if (height==667){
        return rect6;
    }else if (height==736){
        return rect6_;
    }
    return rect4;
}

+(NSString *) setImage:(NSString *)image
{
    int height=(int) [UIScreen mainScreen].bounds.size.height;
    if(height==480){
        return image;
    }else if (height==568){
        return [NSString stringWithFormat:@"%@5",image];
    }else if (height==667){
        return [NSString stringWithFormat:@"%@6",image];
    }else if (height==736){
        return [NSString stringWithFormat:@"%@6_",image];
    }
    return [NSString stringWithFormat:@"%@",image];
}

+(UIFont *)set4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_
{
    int height=(int) [UIScreen mainScreen].bounds.size.height;
    if(height==480){
        return [UIFont systemFontOfSize:font4];
    }else if (height==568){
        return [UIFont systemFontOfSize:font5];
    }else if (height==667){
        return [UIFont systemFontOfSize:font6];
    }else if (height==736){
        return [UIFont systemFontOfSize:font6_];
    }
    return [UIFont systemFontOfSize:font4];
}
+(UIFont *)setBold4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_
{
    int height=(int) [UIScreen mainScreen].bounds.size.height;
    if(height==480){
        return [UIFont boldSystemFontOfSize:font4];
    }else if (height==568){
        return [UIFont boldSystemFontOfSize:font5];
    }else if (height==667){
        return [UIFont boldSystemFontOfSize:font6];
    }else if (height==736){
        return [UIFont boldSystemFontOfSize:font6_];
    }
    return [UIFont boldSystemFontOfSize:font4];
}

//验证手机号码
+ (BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|77|70|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
