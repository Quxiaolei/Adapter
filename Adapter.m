
#import "Adapter.h"

@implementation Adapter

#pragma mark - 时间戳相关

/**
 *  获取时间戳(距1970年的时间间隔)
 *
 *  @return 时间间隔字符串
 */
+ (NSString * )getTimestampSince1970
{
    //获取当前时间
    NSDate *dateNow = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:dateNow];
    //转换为本地时间,加上时区
    NSDate *localeDate = [dateNow  dateByAddingTimeInterval: interval];
    //转换时间戳
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[localeDate timeIntervalSince1970]];
    NSLog(@"localeDate:%@", localeDate);
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    return timeSp;
}
/**
 *  根据传入格式,转换时间格式
 *
 *  @param timeInterval    时间戳(服务器时间)
 *  @param formatterString 要转换的时间格式
 *
 *  @return 转换后的时间格式
 */
+ (NSString *)getDateYMDFromTimerInterval:(NSString *)timeInterval withDateFormat:(NSString *)formatterString
{
    //服务器时间戳与APP时间戳不一致
    NSDate * rightDate = [NSDate dateWithTimeIntervalSince1970:[timeInterval floatValue]/1000];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatterString];
    NSString * dateStr = [dateFormatter stringFromDate:rightDate];
    return dateStr;
}

#pragma mark - 字符串处理

/**
 *  MD5加密
 *
 *  @param str 未加密字符串
 *
 *  @return 加密字符串
 */
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    
    return [[NSString stringWithFormat:
             @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}
/**
 *  用某个字符替换字符串中的字符
 *
 *  @param preBase64String 传入原始的Base64编码字符串
 *  <28c66a8e 7a589e1e c0cf6757 3ddfb331 135b56a4 92b227ca 1b1bd435 073717b7>
 *
 *  @return 替换后的字符串
 */
+ (NSString * )getBase64StringWithoutSpace:(NSString *) preBase64String
{
    NSString * string = [preBase64String stringByReplacingOccurrencesOfString:@" " withString:@""];
    //    去除两端的括号
    NSRange range = {1,64};
    return  [string substringWithRange:range];
}
/**
 *  unicode转换
 *
 *  @param unicodeStr 传入unicode码
 *
 *  @return 返回替换后的unicode
 */
+ (NSString *)replaceUnicode:(NSString *)unicodeStr
{
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    //NSLog(@"Output = %@", returnStr);
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

#pragma mark - 字符串处理(UILabel)

/**
 *  改变字符串中某些字符的颜色
 *
 *  @param string 传入原始字符串
 *  @param color  传入要改变的字符串的颜色
 *  @param range  传入要改变的字符串的位置
 *
 *  @return 返回改变后的可变字符串(.attributedText = )
 */
+ (NSMutableAttributedString *)changeStringColor:(NSString *)string strColor:(UIColor *)color strRange:(NSRange)range
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    return attributeString;
}
/**
 *  改变字符串中某些字符的字体
 *
 *  @param string 传入原始字符串
 *  @param font   传入要改变的字符串的字体
 *  @param range  传入要改变的字符串的位置
 *
 *  @return 返回改变后的可变字符串(.attributedText = )
 */
+ (NSMutableAttributedString *)changeStringFont:(NSString *)string strFont:(UIFont *)font strRange:(NSRange)range
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString addAttribute:NSFontAttributeName value:font range:range];
    return attributeString;
}
/**
 *  改变字符串中某些字符的颜色和字体
 *
 *  @param string 传入原始字符串
 *  @param color  传入要改变的字符串的颜色
 *  @param font   传入要改变的字符串的字体
 *  @param range  传入要改变的字符串的位置
 *
 *  @return 返回改变后的可变字符串(.attributedText = )
 */
+ (NSMutableAttributedString *)changeStringColor:(NSString *)string strColor:(UIColor *)color andFont:(UIFont *)font strRange:(NSRange)range
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString addAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font} range:range];
    //    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    //    [attributeString addAttribute:NSFontAttributeName value:font range:range];
    return attributeString;
}

#pragma mark - 屏幕适配相关

/**
 *  根据当前屏幕高度选择不同的位置布局
 *
 *  @param rect4  4S的位置布局
 *  @param rect5  5/5S的位置布局
 *  @param rect6  6的位置布局
 *  @param rect6_ 6S的位置布局
 *
 *  @return 返回相应的位置布局
 */

/*
 *	修改意见：
 *	增加横屏竖屏的支持（当前屏幕的宽高，看是否正常的高大于宽）
 *
 *  屏幕适配:autoResizing > autoLayout > 此方法
 *
 */
+(CGRect) set4Frame:(CGRect)rect4 and5Frame:(CGRect)rect5 and6Frame:(CGRect)rect6 and6_Frame:(CGRect) rect6_
{
    if(currentScreenHeight == 480.0f){
        return rect4;
    }else if (currentScreenHeight == 568.0f){
        return rect5;
    }else if (currentScreenHeight == 667.0f){
        return rect6;
    }else if (currentScreenHeight == 736.0f){
        return rect6_;
    }
    return rect4;
}

/**
 *  根据当前屏幕高度选择不同的图片
 *
 *  @param image 图片名字
 *
 *  @return 返回拼后的相应图片名
 */
+(NSString *) setImage:(NSString *)image
{
    if(currentScreenHeight == 480.0f){
        return image;
    }else if (currentScreenHeight == 568.0f){
        return [NSString stringWithFormat:@"%@5",image];
    }else if (currentScreenHeight == 667.0f){
        return [NSString stringWithFormat:@"%@6",image];
    }else if (currentScreenHeight == 736.0f){
        return [NSString stringWithFormat:@"%@6_",image];
    }
    return [NSString stringWithFormat:@"%@",image];
}

/**
 *  设置字体大小
 *
 *  @param rect4  4S的字体大小
 *  @param rect5  5/5S的字体大小
 *  @param rect6  6的字体大小
 *  @param rect6_ 6S的字体大小
 *
 *  @return 字体大小
 */
+(UIFont *)set4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_
{
    if(currentScreenHeight == 480.0f){
        return [UIFont systemFontOfSize:font4];
    }else if (currentScreenHeight == 568.0f){
        return [UIFont systemFontOfSize:font5];
    }else if (currentScreenHeight == 667.0f){
        return [UIFont systemFontOfSize:font6];
    }else if (currentScreenHeight == 736.0f){
        return [UIFont systemFontOfSize:font6_];
    }
    return [UIFont systemFontOfSize:font4];
}

/**
 *  设置加粗字体大小
 *
 *  @param rect4  4S的字体大小
 *  @param rect5  5/5S的字体大小
 *  @param rect6  6的字体大小
 *  @param rect6_ 6S的字体大小
 *
 *  @return 字体大小
 */
+(UIFont *)setBold4Font:(float)font4 and5Font:(float)font5 and6Font:(float)font6 and6_Font:(float)font6_
{
    if(currentScreenHeight == 480.0f){
        return [UIFont boldSystemFontOfSize:font4];
    }else if (currentScreenHeight == 568.0f){
        return [UIFont boldSystemFontOfSize:font5];
    }else if (currentScreenHeight == 667.0f){
        return [UIFont boldSystemFontOfSize:font6];
    }else if (currentScreenHeight == 736.0f){
        return [UIFont boldSystemFontOfSize:font6_];
    }
    return [UIFont boldSystemFontOfSize:font4];
}

#pragma mark - 正则校验

//验证手机号码
+ (BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,181,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|47|5[0127-9]|78|8[23478])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,176,185,186
     */
    NSString * CU = @"^1(3[0-2]|45|5[56]|76|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,153,170,177,180,181,189
     */
    NSString * CT = @"^1((33|53|70|77|8[019])[0-9])\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)){
        return YES;
    }
    else{
        return NO;
    }
}

//验证身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    if (identityCard.length <= 0) {
        return NO;
    }
    NSString * regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate * identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//验证邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString * emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:email];
}

#pragma mark - 文件处理

/**
 *  截屏功能
 *
 *  @param currentView 传入要保存的视图
 *  @param size        传入要保存的视图的尺寸
 */
+ (void)getSnapshotFromView:(UIView *)currentView
{
    //currentView:当前的view  创建一个基于位图的图形上下文并指定大小为size
    UIGraphicsBeginImageContext(currentView.bounds.size);
    //renderInContext呈现接受者及其子范围到指定的上下文
    [currentView.layer renderInContext:UIGraphicsGetCurrentContext()];
    //返回一个基于当前图形上下文的图片
    UIImage * viewImage = UIGraphicsGetImageFromCurrentImageContext();
    //移除栈顶的基于当前位图的图形上下文
    UIGraphicsEndImageContext();
    //然后将该图片保存到图片库
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
}
/**
 *  通过文件夹和文件名获取文件路径
 *
 *  @param directoryName 文件夹名
 *  @param fileName      文件名
 *
 *  @return 文件路径
 */
+ (NSString *)getFilePathWithDirectoryName:(NSString *)directoryName fileName:(NSString *)fileName
{
    NSString * directoryPath = [NSString stringWithFormat:@"%@/%@",directoryName,fileName];
    //判断文件是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath]){
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString * filePath = [NSString stringWithFormat:@"%@/%@",directoryPath,fileName];
    return filePath;
}
/**
 *  更新用户默认配置文件
 *
 *  @param objectArray 编码对象数组
 *  @param keyArray    编码对象关键字
 *
 *  @return 成功标示:YES
 */
+ (BOOL)setUserDefaultsWithObjectArray:(NSArray *)objectArray keyArray:(NSArray *)keyArray
{
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    for (int i = 0; i < objectArray.count; i++){
        [userDefault setObject:objectArray[i] forKey:keyArray[i]];
    }
    [userDefault synchronize];
    return YES;
}
/**
 *  查询用户默认配置文件
 *
 *  @param keyArray 编码对象关键字
 *
 *  @return 可变编码对象数组
 */
+ (NSMutableArray * )getUserDefaultsWithKeyArray:(NSArray *)keyArray
{
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    NSMutableArray * array = [[NSMutableArray alloc]initWithCapacity:keyArray.count];
    for (int i = 0; i < keyArray.count; i++){
        if (![userDefault stringForKey:keyArray[i]]) {
            return nil;
        }
        [array addObject:[userDefault stringForKey:keyArray[i]]];
    }
    return array;
}
/**
 *  归档
 *
 *  @param objectArray 编码对象数组
 *  @param keyArray    编码对象关键字
 *
 *  @return 成功标示:YES
 */
+ (BOOL)archiverWithObjectArray:(NSArray *)objectArray keyArray:(NSArray *)keyArray
{
    //    NSArray *array = [NSArray arrayWithObjects:@"zhangsan",@"lisi",nil];
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //编码
    for (int i = 0; i < objectArray.count; i++){
        [archiver encodeObject:objectArray[i] forKey:keyArray[i]];
    }
    //完成编码，将上面的归档数据填充到data中，此时data中已经存储了归档对象的数据
    [archiver finishEncoding];
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/userData"];
    BOOL success = [data writeToFile:filePath atomically:YES];
    if(success){
        NSLog(@"用户信息,归档成功");
        return YES;
    }
    return NO;
}
/**
 *  解档
 *
 *  @param keyArray 编码对象关键字
 *
 *  @return 可变编码对象数组
 */
+ (NSMutableArray *)unarchiverWithKeyArray:(NSArray *)keyArray
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/userData"];
    //读取归档数据
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    //创建解归档对象，对data中的数据进行解归档
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    NSMutableArray * array = [[NSMutableArray alloc]initWithCapacity:keyArray.count];
    //解归档
    for (int i = 0; i < keyArray.count; i++){
        [array addObject:[unarchiver decodeObjectForKey:keyArray[i]]];
    }
    return array;
}

#pragma mark - UI附加效果展示

/**
 *  警告窗口
 *
 *  @param title        标题
 *  @param message      内容
 *  @param cancelString 取消标题
 *  @param delegate     代理
 *  @param tag          tag值
 */
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonString:(NSString *)cancelString delegate:(id)delegate tag:(NSInteger)tag;
{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelString otherButtonTitles:@"确定", nil];
    alertView.tag = tag;
    [alertView show];
}
@end