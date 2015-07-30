/**
 *  主要功能:
 *  1,通过代码适配,传入不同的参数进行布局,选择不同的图片,设置字体大小
 *  2,手机号码验证
 *
 */

#import "Adapter.h"

@implementation Adapter

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
 
 /
 *	修改意见：
 *	增加横屏竖屏的支持（当前屏幕的宽高，看是否正常的高大于宽）
 *
 /
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


@end
