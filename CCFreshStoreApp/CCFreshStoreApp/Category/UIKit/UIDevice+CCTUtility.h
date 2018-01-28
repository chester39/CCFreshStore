//
//  UIDevice+CCTUtility.h
//      CCFreshStoreApp
//      Chen Chen @ January 19th, 2018
//

#import <UIKit/UIKit.h>

/// 系统设备类型
typedef NS_ENUM(NSUInteger, UIDeviceType) {
    /// 未知设备
    UIDeviceTypeUnknown = 0,
    /// iPhone 1
    UIDeviceTypeiPhone1,
    /// iPhone 3G
    UIDeviceTypeiPhone3G,
    /// iPhone 3GS
    UIDeviceTypeiPhone3GS,
    /// iPhone 4
    UIDeviceTypeiPhone4,
    /// iPhone 4S
    UIDeviceTypeiPhone4S,
    /// iPhone 5
    UIDeviceTypeiPhone5,
    /// iPhone 5S
    UIDeviceTypeiPhone5S,
    /// iPhone 5C
    UIDeviceTypeiPhone5C,
    /// iPhone 6
    UIDeviceTypeiPhone6,
    /// iPhone 6 Plus
    UIDeviceTypeiPhone6Plus,
    /// iPhone 6S
    UIDeviceTypeiPhone6S,
    /// iPhone 6S Plus
    UIDeviceTypeiPhone6SPlus,
    /// iPhone SE
    UIDeviceTypeiPhoneSE,
    /// iPhone 7
    UIDeviceTypeiPhone7,
    /// iPhone 7 Plus
    UIDeviceTypeiPhone7Plus,
    /// iPhone 8
    UIDeviceTypeiPhone8,
    /// iPhone 8 Plus
    UIDeviceTypeiPhone8Plus,
    /// iPhone X
    UIDeviceTypeiPhoneX,
    /// iPad 1
    UIDeviceTypeiPad1,
    /// iPad 2
    UIDeviceTypeiPad2,
    /// iPad 3 (The new iPad)
    UIDeviceTypeiPad3,
    /// iPad 4 (iPad with Retina display)
    UIDeviceTypeiPad4,
    /// iPad Air
    UIDeviceTypeiPadAir,
    /// iPad Air 2
    UIDeviceTypeiPadAir2,
    /// iPad 5 (iPad 2017)
    UIDeviceTypeiPad5,
    /// iPad Mini 1
    UIDeviceTypeiPadMini1,
    /// iPad Mini 2
    UIDeviceTypeiPadMini2,
    /// iPad Mini 3
    UIDeviceTypeiPadMini3,
    /// iPad Mini 4
    UIDeviceTypeiPadMini4,
    /// iPad Pro 1 12.9
    UIDeviceTypeiPadPro1Inch129,
    /// iPad Pro 1 9.7
    UIDeviceTypeiPadPro1Inch97,
    /// iPad Pro 2 12.9
    UIDeviceTypeiPadPro2Inch129,
    /// iPad Pro 2 10.5
    UIDeviceTypeiPadPro2Inch105,
    /// iPod Touch 1
    UIDeviceTypeiPodTouch1,
    /// iPod Touch 2
    UIDeviceTypeiPodTouch2,
    /// iPod Touch 3
    UIDeviceTypeiPodTouch3,
    /// iPod Touch 4
    UIDeviceTypeiPodTouch4,
    /// iPod Touch 5
    UIDeviceTypeiPodTouch5,
    /// iPod Touch 6
    UIDeviceTypeiPodTouch6,
    /// Apple TV 1
    UIDeviceTypeAppleTV1,
    /// Apple TV 2
    UIDeviceTypeAppleTV2,
    /// Apple TV 3
    UIDeviceTypeAppleTV3,
    /// Apple TV 4
    UIDeviceTypeAppleTV4,
    /// Apple TV 5 (4K)
    UIDeviceTypeAppleTV5,
    /// 模拟器
    UIDeviceTypeSimulator,
    /// iPhone模拟器
    UIDeviceTypeSimulatoriPhone,
    /// iPad模拟器
    UIDeviceTypeSimulatoriPad,
    /// Apple TV模拟器
    UIDeviceTypeSimulatorAppleTV,
    /// iFPGA
    UIDeviceTypeiFPGA,
    /// iPhone未知设备
    UIDeviceTypeUnknowniPhone,
    /// iPad未知设备
    UIDeviceTypeUnknowniPad,
    /// iPod未知设备
    UIDeviceTypeUnknowniPod,
    /// Apple TV未知设备
    UIDeviceTypeUnknownAppleTV
};

@interface UIDevice (CCTUtility)

/**
 *  获取机器字符串方法
 */
- (NSString *)systemMachineString;
/**
 *  获取模型字符串方法
 */
- (NSString *)systemModelString;
/**
 *  获取CPU频率方法
 */
- (NSUInteger)systemCPUFrequency;
/**
 *  获取总线频率方法
 */
- (NSUInteger)systemBUSFrequency;
/**
 *  获取CPU数量方法
 */
- (NSUInteger)systemNumberOfCPUs;
/**
 *  获取总内存大小方法
 */
- (NSUInteger)systemTotalMemory;
/**
 *  获取用户内存大小方法
 */
- (NSUInteger)systemUserMemory;
/**
 *  获取系统空间大小方法
 */
- (NSNumber *)totalDiskSpace;
/**
 *  获取剩余空间大小方法
 */
- (NSNumber *)freeDiskSpace;
/**
 *  获取系统设备类型方法
 */
- (UIDeviceType)platformDeviceType;
/**
 *  判断是否至少iOS多少版本方法
 */
- (BOOL)isiOSVersion:(NSInteger)version;

@end
