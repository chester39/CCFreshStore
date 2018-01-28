//
//  MineMainModel.m
//      CCFreshStoreApp
//      Chen Chen @ January 28th, 2018
//

#import "MineMainModel.h"

// Tool
#import "CCTConst.h"

// Third Party
#import "YYModel.h"

@implementation MineMainModel

/**
 *  JSON映射Model方法
 */
+ (NSDictionary *)modelCustomPropertyMapper {

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"icon" forKey:@"icon"];
    [dict setObject:@"title" forKey:@"title"];
    [dict setValue:@"type" forKey:@"type"];
    
    return dict;
}

@end
