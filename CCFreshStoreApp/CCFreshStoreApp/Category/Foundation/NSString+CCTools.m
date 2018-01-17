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
 *  获取文本尺寸方法
 */
- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    
    CGSize textSize;
    if (!font) {
        font = [UIFont systemFontOfSize:12];
    }
    
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        dict[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode = lineBreakMode;
            dict[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        
        CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:nil];
        textSize = rect.size;
        
    } else {
        textSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
    }
    
    return textSize;
}

/**
 *  获取Unicode长度方法
 */
- (NSUInteger)unicodeLength {
    
    __block NSUInteger asciiLength = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        unichar uniChar = [self characterAtIndex:0];
        if (substring.length == 1 && isascii(uniChar)) {
            asciiLength += 1;
            
        } else {
            asciiLength += 2;
        }
    }];

    NSUInteger unicodeLength = asciiLength / 2;
    if (asciiLength % 2) {
        ++unicodeLength;
    }
    
    return unicodeLength;
}

/**
 *  截取指定Unicode长度方法
 */
- (NSString *)unicodeMaxLength:(NSUInteger)length {
    
    __block NSUInteger maxLength = 0;
    __block NSInteger asciiRemainLength = length * 2;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        unichar uniChar = [self characterAtIndex:0];
        if (substring.length == 1 && isascii(uniChar)) {
            asciiRemainLength -= 1;
            
        } else {
            asciiRemainLength -= 2;
        }
        
        if (asciiRemainLength >= 0) {
            maxLength += substring.length;
            
        } else {
            *stop = YES;
        }
    }];
 
    NSString *newString = [self substringToIndex:maxLength];
    return newString;
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

/**
 *  是否字母数字中文且没有空格方法
 */
- (BOOL)isInputRuleWithoutBlank:(NSString *)string {
    
    if (!([string isKindOfClass:[NSString class]] && string.length > 0)) {
        return NO;
    }
    
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    
    BOOL isMatch = [predicate evaluateWithObject:string];
    return isMatch;
}

/**
 *  是否字母数字中文且有空格方法
 */
- (BOOL)isInputRuleWithBlank:(NSString *)string {
    
    if (!([string isKindOfClass:[NSString class]] && string.length > 0)) {
        return NO;
    }
    
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d\\s]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    
    BOOL isMatch = [predicate evaluateWithObject:string];
    return isMatch;
}

/**
 *  查找URL指定值方法
 */
- (NSString *)findURLValueForKey:(NSString *)keyString {
    
    if (self.length <= 0 || keyString.length <= 0) {
        return self;
    }
    
    NSString *keyStringForFind = [NSString stringWithFormat:@"%@=", keyString];
    NSString *value = @"";

    if ([self rangeOfString:keyStringForFind].length <= 0) {
        return value;
    }
    
    NSString *stringWithKey = self;
    NSArray *params = [self componentsSeparatedByString:@"?"];
    if (params.count > 0) {
        for (NSString *string in params) {
            if ([string rangeOfString:keyStringForFind].length > 0) {
                stringWithKey = string;
                break;
            }
        }
    }
    
    NSArray *components = [stringWithKey componentsSeparatedByString:@"&"];
    if ([components count] <= 0) {
        return value;
    }
    
    NSString *subStringWithKey = @"";
    for (NSString *subString in components) {
        if (subString.length > 0 && [subString rangeOfString:keyStringForFind].length > 0) {
            subStringWithKey = subString;
            break;
        }
    }
    
    if (subStringWithKey.length > 0) {
        NSArray *subComponents = [subStringWithKey componentsSeparatedByString:@"="];
        if (subComponents.count >= 2) {
            NSString *firstString = subComponents[0];
            if ([firstString isEqualToString:keyString] ||
                [firstString hasSuffix:keyString]) {
                value = subComponents[1];
            }
        }
    }
    
    return value;
}

/**
 *  改变部分文字颜色方法
 */
- (NSMutableAttributedString *)changeColor:(UIColor *)color subString:(NSString *)subString {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = [self rangeOfString:subString options:NSBackwardsSearch];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return attributedString;
}

/**
 *  改变部分文字行间距方法
 */
- (NSMutableAttributedString *)changeLineSpacing:(CGFloat)spacing subString:(NSString *)subString {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = [self rangeOfString:subString options:NSBackwardsSearch];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = spacing;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    return attributedString;
}

@end
