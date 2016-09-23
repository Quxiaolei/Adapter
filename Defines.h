#ifndef Defines_h
#define Defines_h
//获取系统版本
#define IOS_SYSTEM_STRING [[UIDevice currentDevice] systemVersion]
//判断IOS8
#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES:NO
//获取当前的语言版本
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是不是真机
#if TARGET_OS_IPHONE
//iPhone Device
#endif
//判断是不是模拟器
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

#define kAppDelegate [[UIApplication sharedApplication] delegate]
//获得window
#define kUIWindow [[[UIApplication sharedApplication] delegate] window]
#define kPresentNavVC(vc) [[UINavigationController alloc] initWithRootViewController:vc]

//获取temp文件路径
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//屏幕物理宽度
#define kCurrentScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕物理高度
#define kCurrentScreenHeight [UIScreen mainScreen].bounds.size.height

//当允许横屏时使用的屏幕宽高
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上
#define SCREEN_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define SCREENH_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#define SCREEN_SIZE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#endif

//设置随机颜色
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//RGB色
#define kRGBColor(a,b,c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1.0]
//RGB色和alpha值
#define kRGBAColor(r,g,b,a) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:a/1.0]
//16进制色
#define kColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//自定义log
#ifdef DEBUG
#define MSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define MSLog(...)
#endif

//设置控件圆角
#define kViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#endif /* Defines_h */
