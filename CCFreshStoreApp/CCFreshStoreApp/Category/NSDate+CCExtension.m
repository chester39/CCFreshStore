//
//  NSDate+CCExtension.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "NSDate+CCExtension.h"

@implementation NSDate (CCExtension)

/**
 *  字符串创建日期方法
 */
+ (NSDate *)convertStringToDate:(NSString *)timeString withFormatter:(NSString *)formatterString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatterString;
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    NSDate *date = [formatter dateFromString:timeString];
    
    return date;
}

/**
 *  格式化字符串方法
 */
+ (NSString *)formatDateToString:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *nowDate = [NSDate date];
    NSTimeInterval time = [nowDate timeIntervalSinceDate:date];
    NSString *dateString = [[NSString alloc] init];
    
    if (time > 0 && time <= 60) {
        dateString = @"刚刚";
        
    } else if (time > 60 && time <= (60 * 60)) {
        int minute = (int)(time / 60);
        dateString = [NSString stringWithFormat:@"%d分钟前", minute];
        
    } else if (time > (60 * 60) && time < (60 * 60 * 24)) {
        formatter.dateFormat = @"yyyy/MM/dd";
        NSString *dateDayString = [formatter stringFromDate:date];
        NSString *nowDayString = [formatter stringFromDate:nowDate];
        
        formatter.dateFormat = @"HH:mm";
        if (dateDayString == nowDayString) {
            dateString = [NSString stringWithFormat:@"今天%@", [formatter stringFromDate:date]];
            
        } else {
            dateString = [NSString stringWithFormat:@"昨天%@", [formatter stringFromDate:date]];
        }
        
    } else {
        formatter.dateFormat = @"yyyy";
        NSString *dateYearString = [formatter stringFromDate:date];
        NSString *nowYearString = [formatter stringFromDate:nowDate];
        
        if (dateYearString == nowYearString) {
            formatter.dateFormat = @"MM-dd";
            dateString = [formatter stringFromDate:date];
            
        } else {
            formatter.dateFormat = @"yyyy/MM/dd";
            dateString = [formatter stringFromDate:date];
        }
    }
    
    return dateString;
}

/**
 *  获取指定天前字符串方法
 */
+ (NSString *)acquireAssignedDaysAgo:(NSTimeInterval)number withFormatter:(NSString *)formatterString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatterString;
    NSDate *nowDate = [NSDate date];
    
    NSTimeInterval aDay = 60 * 60 * 24;
    NSDate *daysAgo = [NSDate dateWithTimeInterval:-(number * aDay) sinceDate:nowDate];
    NSString *daysAgoString = [formatter stringFromDate:daysAgo];
    
    return daysAgoString;
}

/**
 *  获取今天星期几方法
 */
- (NSInteger)acquireTodayOfWeek {
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier: NSCalendarIdentifierGregorian];
    NSInteger component = [calendar component:NSCalendarUnitWeekday fromDate:self];
    
    return component;
}

@end
