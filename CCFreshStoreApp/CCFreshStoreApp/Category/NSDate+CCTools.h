//
//  NSDate+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <Foundation/Foundation.h>

@interface NSDate (CCTools)

/**
 *  字符串创建日期方法
 */
+ (NSDate *)convertStringToDate:(NSString *)timeString withFormatter:(NSString *)formatterString;
/**
 *  格式化字符串方法
 */
+ (NSString *)formatDateToString:(NSDate *)date;
/**
 *  获取指定天前字符串方法
 */
+ (NSString *)acquireAssignedDaysAgo:(NSTimeInterval)number withFormatter:(NSString *)formatterString;
/**
 *  获取今天星期几方法
 */
- (NSInteger)acquireTodayOfWeek;

@end
