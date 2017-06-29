//
//  NSString+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "NSString+CCTools.h"

// Framework
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (CCTools)

/**
 *  获取缓存目录方法
 */
- (NSString *)cachesDirectory {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *name = [self lastPathComponent];
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    return filePath;
}

/**
 *  获取文档目录方法
 */
- (NSString *)documentDirectory {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *name = [self lastPathComponent];
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    return filePath;
}

/**
 *  获取临时目录方法
 */
- (NSString *)temporaryDirectory {
    
    NSString *path = NSTemporaryDirectory();
    NSString *name = [self lastPathComponent];
    NSString *filePath = [path stringByAppendingPathComponent:name];
    
    return filePath;
}

/**
 *  数字文本表示方法
 */
- (NSString *)digitalRepresentation:(NSInteger)number {
    
    number = number > 0 ? number : 0;
    NSString *string = @"";
    if (number < 10000) {
        string = [NSString stringWithFormat:@"%ld", (long)number];
        
    } else {
        NSString *postfix = @"kw";
        float representation = 10000000;
        if (number < 10000000) {
            postfix = @"w";
            representation = 10000;
        }
        
        float transferNumber = number / representation;
        float roundNumber = roundf(transferNumber * 10) / 10;
        
        int decimal = ((int)(roundNumber * 10)) % 10;
        if (decimal == 0) {
            string = [NSString stringWithFormat:@"%ld%@", (long)roundNumber, postfix];
            
        } else {
            string = [NSString stringWithFormat:@"%.1f%@", roundNumber, postfix];
        }
    }
    
    return string;
}

/**
 *  获取单行文本尺寸方法
 */
- (CGSize)singleTextSizeWithFont:(UIFont *)font {
    
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGSize textSize = [self sizeWithAttributes:dict];
    
    return textSize;
}

/**
 *  获取多行文本尺寸方法
 */
- (CGSize)multiTextSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGSize textSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    return textSize;
}

/**
 *  获取Unicode长度方法
 */
- (NSUInteger)unicodeLength {
    
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < self.length; ++i) {
        unichar uniChar = [self characterAtIndex:i];
        asciiLength += isascii(uniChar) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    if(asciiLength % 2) {
        ++unicodeLength;
    }
    
    return unicodeLength;
}

/**
 *  获取当前日期字符串方法
 */
- (NSString *)nowDateString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSDate *nowDate = [[NSDate alloc] init];
    NSString *dateString = [formatter stringFromDate:nowDate];
    
    return dateString;
}

/**
 *  获取UUID字符串方法
 */
- (NSString *)uuidString {
    
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString *uuidString = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    return uuidString;
}

/**
 *  判断字符串有效方法
 */
- (BOOL)checkString {
    
    if (self && self.length > 0) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  获取MD5加密字符串方法
 */
- (NSString *)md5String {
    
    const char *original = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original, (CC_LONG)strlen(original), result);
    NSMutableString *md5String = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [md5String appendFormat:@"%02x", result[i]];
    }
    
    return md5String;
}

@end
