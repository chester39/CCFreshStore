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
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:3];
    [dict setObject:@"vcName" forKey:@"controllerName"];
    [dict setObject:@"title" forKey:@"title"];
    [dict setObject:@"imageName" forKey:@"imageName"];
    
    return dict;
}

@end
