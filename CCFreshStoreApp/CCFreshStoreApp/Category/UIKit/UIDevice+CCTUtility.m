//
//  UIDevice+CCTUtility.m
//      CCFreshStoreApp
//      Chen Chen @ January 19th, 2018
//

#import "UIDevice+CCTUtility.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <sys/sysctl.h>
#import <mach/mach.h>

@implementation UIDevice (CCTUtility)

/**
 *  获取系统字符串信息方法
 */
- (NSString *)acquireSystemInfoByName:(char *)typeSpecifier {
    
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *result = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    free(answer);
    
    return result;
}

/**
 *  获取系统数字信息方法
 */
- (NSUInteger)acquireSystemInfo:(uint)typeSpecifier {
    
    size_t size = sizeof(int);
    int result;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &result, &size, NULL, 0);
    
    return (NSUInteger)result;
}

/**
 *  获取机器字符串方法
 */
- (NSString *)systemMachineString {
    
    NSString *machineString = [self acquireSystemInfoByName:"hw.machine"];
    return machineString;
}

/**
 *  获取模型字符串方法
 */
- (NSString *)systemModelString {
    
    NSString *modelString = [self acquireSystemInfoByName:"hw.model"];
    return modelString;
}

/**
 *  获取CPU频率方法
 */
- (NSUInteger)systemCPUFrequency {
    
    NSUInteger cpuFrequency = [self acquireSystemInfo:HW_CPU_FREQ];
    return cpuFrequency;
}

/**
 *  获取总线频率方法
 */
- (NSUInteger)systemBUSFrequency {
    
    NSUInteger busFrequency = [self acquireSystemInfo:HW_BUS_FREQ];
    return busFrequency;
}

/**
 *  获取CPU数量方法
 */
- (NSUInteger)systemNumberOfCPUs {
    
    NSUInteger numberOfCPUs = [self acquireSystemInfo:HW_NCPU];
    return numberOfCPUs;
}

/**
 *  获取总内存大小方法
 */
- (NSUInteger)systemTotalMemory {
    
    NSUInteger totalMemory = [self acquireSystemInfo:HW_PHYSMEM];
    return totalMemory;
}

/**
 *  获取用户内存大小方法
 */
- (NSUInteger)systemUserMemory {
    
    NSUInteger userMemory = [self acquireSystemInfo:HW_USERMEM];
    return userMemory;
}

/**
 *  获取系统空间大小方法
 */
- (NSNumber *)totalDiskSpace {
    
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSNumber *totalDiskSpace = [attributes objectForKey:NSFileSystemSize];
    
    return totalDiskSpace;
}

/**
 *  获取剩余空间大小方法
 */
- (NSNumber *)freeDiskSpace {
    
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSNumber *freeDiskSpace = [attributes objectForKey:NSFileSystemFreeSize];
    
    return freeDiskSpace;
}

/**
 *  获取系统设备类型方法
 */
- (UIDeviceType)platformDeviceType {
    
    NSString *deviceString = [self systemMachineString];
    if ([deviceString isEqualToString:@"iFPGA"]) {
        return UIDeviceTypeiFPGA;
    }
    
    if ([deviceString isEqualToString:@"iPhone1,1"]) {
        return UIDeviceTypeiPhone1;
    }
    
    if ([deviceString isEqualToString:@"iPhone1,2"]) {
        return UIDeviceTypeiPhone3G;
    }
    
    if ([deviceString isEqualToString:@"iPhone2,1"]) {
        return UIDeviceTypeiPhone3GS;
    }
    
    if ([deviceString isEqualToString:@"iPhone3,1"] || [deviceString isEqualToString:@"iPhone3,2"] || [deviceString isEqualToString:@"iPhone3,3"]) {
        return UIDeviceTypeiPhone4;
    }
    
    if ([deviceString isEqualToString:@"iPhone4,1"]) {
        return UIDeviceTypeiPhone4S;
    }
    
    if ([deviceString isEqualToString:@"iPhone5,1"] || [deviceString isEqualToString:@"iPhone5,2"]) {
        return UIDeviceTypeiPhone5;
    }
    
    if ([deviceString isEqualToString:@"iPhone5,3"] || [deviceString isEqualToString:@"iPhone5,4"]) {
        return UIDeviceTypeiPhone5C;
    }
    
    if ([deviceString isEqualToString:@"iPhone6,1"] || [deviceString isEqualToString:@"iPhone6,2"]) {
        return UIDeviceTypeiPhone5S;
    }
    
    if ([deviceString isEqualToString:@"iPhone7,2"]) {
        return UIDeviceTypeiPhone6;
    }
    
    if ([deviceString isEqualToString:@"iPhone7,1"]) {
        return UIDeviceTypeiPhone6Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,1"]) {
        return UIDeviceTypeiPhone6S;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,2"]) {
        return UIDeviceTypeiPhone6SPlus;
    }
    
    if ([deviceString isEqualToString:@"iPhone8,4"]) {
        return UIDeviceTypeiPhoneSE;
    }
    
    if ([deviceString isEqualToString:@"iPhone9,1"] || [deviceString isEqualToString:@"iPhone9,3"]) {
        return UIDeviceTypeiPhone7;
    }
    
    if ([deviceString isEqualToString:@"iPhone9,2"] || [deviceString isEqualToString:@"iPhone9,4"]) {
        return UIDeviceTypeiPhone7Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,1"] || [deviceString isEqualToString:@"iPhone10,4"]) {
        return UIDeviceTypeiPhone8;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,2"] || [deviceString isEqualToString:@"iPhone10,5"]) {
        return UIDeviceTypeiPhone8Plus;
    }
    
    if ([deviceString isEqualToString:@"iPhone10,3"] || [deviceString isEqualToString:@"iPhone10,6"]) {
        return UIDeviceTypeiPhoneX;
    }
    
    if ([deviceString isEqualToString:@"iPad1,1"]) {
        return UIDeviceTypeiPad1;
    }
    
    if ([deviceString isEqualToString:@"iPad2,1"] || [deviceString isEqualToString:@"iPad2,2"] || [deviceString isEqualToString:@"iPad2,3"] || [deviceString isEqualToString:@"iPad2,4"]) {
        return UIDeviceTypeiPad2;
    }
    
    if ([deviceString isEqualToString:@"iPad3,1"] || [deviceString isEqualToString:@"iPad3,2"] || [deviceString isEqualToString:@"iPad3,3"]) {
        return UIDeviceTypeiPad3;
    }
    
    if ([deviceString isEqualToString:@"iPad3,4"] || [deviceString isEqualToString:@"iPad3,5"] || [deviceString isEqualToString:@"iPad3,6"]) {
        return UIDeviceTypeiPad4;
    }
    
    if ([deviceString isEqualToString:@"iPad4,1"] || [deviceString isEqualToString:@"iPad4,2"] || [deviceString isEqualToString:@"iPad4,3"]) {
        return UIDeviceTypeiPadAir;
    }
    
    if ([deviceString isEqualToString:@"iPad5,3"] || [deviceString isEqualToString:@"iPad5,4"]) {
        return UIDeviceTypeiPadAir2;
    }
    
    if ([deviceString isEqualToString:@"iPad6,11"] || [deviceString isEqualToString:@"iPad6,12"]) {
        return UIDeviceTypeiPad5;
    }
    
    if ([deviceString isEqualToString:@"iPad2,5"] || [deviceString isEqualToString:@"iPad2,6"] || [deviceString isEqualToString:@"iPad2,7"]) {
        return UIDeviceTypeiPadMini1;
    }
    
    if ([deviceString isEqualToString:@"iPad4,4"] || [deviceString isEqualToString:@"iPad4,5"] || [deviceString isEqualToString:@"iPad4,6"]) {
        return UIDeviceTypeiPadMini2;
    }
    
    if ([deviceString isEqualToString:@"iPad4,7"] || [deviceString isEqualToString:@"iPad4,8"] || [deviceString isEqualToString:@"iPad4,9"]) {
        return UIDeviceTypeiPadMini3;
    }
    
    if ([deviceString isEqualToString:@"iPad5,1"] || [deviceString isEqualToString:@"iPad5,2"]) {
        return UIDeviceTypeiPadMini4;
    }
    
    if ([deviceString isEqualToString:@"iPad6,7"] || [deviceString isEqualToString:@"iPad6,8"]) {
        return UIDeviceTypeiPadPro1Inch129;
    }
    
    if ([deviceString isEqualToString:@"iPad6,3"] || [deviceString isEqualToString:@"iPad6,4"]) {
        return UIDeviceTypeiPadPro1Inch97;
    }
    
    if ([deviceString isEqualToString:@"iPad7,1"] || [deviceString isEqualToString:@"iPad7,2"]) {
        return UIDeviceTypeiPadPro2Inch129;
    }
    
    if ([deviceString isEqualToString:@"iPad7,3"] || [deviceString isEqualToString:@"iPad7,4"]) {
        return UIDeviceTypeiPadPro2Inch105;
    }
    
    if ([deviceString isEqualToString:@"iPod1,1"]) {
        return UIDeviceTypeiPodTouch1;
    }
    
    if ([deviceString isEqualToString:@"iPod2,1"]) {
        return UIDeviceTypeiPodTouch2;
    }
    
    if ([deviceString isEqualToString:@"iPod3,1"]) {
        return UIDeviceTypeiPodTouch3;
    }
    
    if ([deviceString isEqualToString:@"iPod4,1"]) {
        return UIDeviceTypeiPodTouch4;
    }
    
    if ([deviceString isEqualToString:@"iPod5,1"]) {
        return UIDeviceTypeiPodTouch5;
    }
    
    if ([deviceString isEqualToString:@"iPod7,1"]) {
        return UIDeviceTypeiPodTouch6;
    }
    
    if ([deviceString isEqualToString:@"AppleTV1,1"]) {
        return UIDeviceTypeAppleTV1;
    }
    
    if ([deviceString isEqualToString:@"AppleTV2,1"]) {
        return UIDeviceTypeAppleTV2;
    }
    
    if ([deviceString isEqualToString:@"AppleTV3,1"] || [deviceString isEqualToString:@"AppleTV3,2"]) {
        return UIDeviceTypeAppleTV3;
    }
    
    if ([deviceString isEqualToString:@"AppleTV5,3"]) {
        return UIDeviceTypeAppleTV4;
    }
    
    if ([deviceString isEqualToString:@"AppleTV6,2"]) {
        return UIDeviceTypeAppleTV5;
    }
    
    if ([deviceString hasPrefix:@"iPhone"]) {
        return UIDeviceTypeUnknowniPhone;
    }
    
    if ([deviceString hasPrefix:@"iPad"]) {
        return UIDeviceTypeUnknowniPad;
    }
    
    if ([deviceString hasPrefix:@"iPod"]) {
        return UIDeviceTypeUnknowniPod;
    }
    
    if ([deviceString hasPrefix:@"AppleTV"]) {
        return UIDeviceTypeUnknownAppleTV;
    }
    
    if ([deviceString hasSuffix:@"86"] || [deviceString isEqual:@"x86_64"]) {
        switch ([[UIDevice currentDevice] userInterfaceIdiom]) {
            case UIUserInterfaceIdiomPhone:
                return UIDeviceTypeSimulatoriPhone;
                
            case UIUserInterfaceIdiomPad:
                return UIDeviceTypeSimulatoriPad;
                
            case UIUserInterfaceIdiomTV:
                return UIDeviceTypeSimulatorAppleTV;
                
            default:
                return UIDeviceTypeSimulator;
        }
    }
    
    return UIDeviceTypeUnknown;
}

/**
 *  是否至少iOS多少版本方法
 */
- (BOOL)isiOSVersion:(NSInteger)version {
    
    static NSInteger result = -1;
    if (result == -1) {
        NSString *majorVersion = [self.systemVersion componentsSeparatedByString:@"."][0];
        result = majorVersion.integerValue >= version;
    }
    
    return (BOOL)result;
}

@end
