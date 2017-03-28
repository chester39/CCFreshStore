//
//  NSString+CCExtension.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "NSString+CCExtension.h"

@implementation NSString (CCExtension)

/**
 *  获取缓存目录方法
 */
- (NSString *)acquireCachesDirectory {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true) lastObject];
    NSString *name = [self lastPathComponent];
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    return filePath;
}

/**
 *  获取文档目录方法
 */
- (NSString *)acquireDocumentDirectory {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) lastObject];
    NSString *name = [self lastPathComponent];
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    return filePath;
}

/**
 *  获取临时目录方法
 */
- (NSString *)acquireTemporaryDirectory {
    
    NSString *path = NSTemporaryDirectory();
    NSString *name = [self lastPathComponent];
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    return filePath;
}

/**
 *  调整数字表示方法
 */
- (NSString *)adjustDigitalRepresentation {
    
    NSUInteger length = self.length;
    if (length > 5) {
        float oldNumber = [self floatValue] / 1000;
        float newNumber = lroundf(oldNumber);
        NSString *newString = [NSString stringWithFormat:@"%lf k", newNumber];
        
        return newString;
        
    } else {
        return self;
    }
}

@end
