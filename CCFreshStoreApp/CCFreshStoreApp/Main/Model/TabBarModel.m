//
//  TabBarModel.m
//      CCFreshStoreApp
//      Chen Chen @ July 11th, 2017
//

#import "TabBarModel.h"

// Tool
#import "Const.h"

// Third Party
#import "YYModel.h"

@implementation TabBarModel

/**
 *  JSON映射Model方法
 */
+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"controllerName": @"vcName", @"title": @"title", @"imageName": @"imageName"};
}

@end
