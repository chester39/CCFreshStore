//
//  NSString+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CCTools)

/**
 *  获取缓存目录方法
 */
- (NSString *)cachesDirectory;
/**
 *  获取文档目录方法
 */
- (NSString *)documentDirectory;
/**
 *  获取临时目录方法
 */
- (NSString *)temporaryDirectory;
/**
 *  数字文本表示方法
 */
- (NSString *)digitalRepresentation:(NSInteger)number;
/**
 *  获取单行文本尺寸方法
 */
- (CGSize)singleTextSizeWithFont:(UIFont *)font;
/**
 *  获取多行文本尺寸方法
 */
- (CGSize)multiTextSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
/**
 *  获取Unicode长度方法
 */
- (NSUInteger)unicodeLength;
/**
 *  截取指定Unicode长度方法
 */
- (NSString *)unicodeMaxLength:(NSUInteger)length;
/**
 *  获取当前日期字符串方法
 */
- (NSString *)nowDateString;
/**
 *  获取UUID字符串方法
 */
- (NSString *)uuidString;
/**
 *  判断字符串有效方法
 */
- (BOOL)checkString;
/**
 *  获取MD5加密字符串方法
 */
- (NSString *)md5String;

@end
