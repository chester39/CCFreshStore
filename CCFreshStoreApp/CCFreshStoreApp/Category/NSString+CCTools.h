//
//  NSString+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CCTools)

#pragma mark - 工具方法

/**
 *  获取缓存目录方法
 */
- (NSString *)acquireCachesDirectory;
/**
 *  获取文档目录方法
 */
- (NSString *)acquireDocumentDirectory;
/**
 *  获取临时目录方法
 */
- (NSString *)acquireTemporaryDirectory;
/**
 *  调整数字表示方法
 */
- (NSString *)adjustDigitalRepresentation;
/**
 *  获取文本尺寸方法
 */
- (CGSize)textSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
