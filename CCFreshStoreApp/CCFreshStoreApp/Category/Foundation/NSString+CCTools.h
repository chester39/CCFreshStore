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
 *  获取文本尺寸方法
 */
- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;
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
 *  获取MD5加密字符串方法
 */
- (NSString *)md5String;
/**
 *  是否字母数字中文且没有空格方法
 */
- (BOOL)isInputRuleWithoutBlank:(NSString *)string;
/**
 *  是否字母数字中文且有空格方法
 */
- (BOOL)isInputRuleWithBlank:(NSString *)string;
/**
 *  查找URL指定值方法
 */
- (NSString *)findURLValueForKey:(NSString *)keyString;
/**
 *  改变部分文字颜色方法
 */
- (NSMutableAttributedString *)changeColor:(UIColor *)color subString:(NSString *)subString;
/**
 *  改变部分文字行间距方法
 */
- (NSMutableAttributedString *)changeLineSpacing:(CGFloat)spacing subString:(NSString *)subString;

@end
