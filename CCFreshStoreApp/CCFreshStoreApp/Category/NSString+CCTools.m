//
//  NSString+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "NSString+CCTools.h"

@implementation NSString (CCTools)

#pragma mark - 工具方法

/**
 *  获取缓存目录方法
 */
- (NSString *)acquireCachesDirectory {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *name = [self lastPathComponent];
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    return filePath;
}

/**
 *  获取文档目录方法
 */
- (NSString *)acquireDocumentDirectory {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
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
        NSString *newString = [NSString stringWithFormat:@"%lf", newNumber];
        
        return [newString stringByAppendingString:@"k"];
        
    } else {
        return self;
    }
}

/**
 *  获取文本尺寸方法
 */
- (CGSize)textSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGSize textSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    return textSize;
}

@end
