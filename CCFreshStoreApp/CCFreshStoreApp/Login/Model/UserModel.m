//
//  UserModel.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "UserModel.h"

// Tool
#import "Const.h"

@implementation UserModel

/**
 *  字典初始化方法
 */
- (instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        self.userAccount = dict[kUserAccount];
        self.userPassword = dict[kUserPassword];
        self.userPhone = dict[kUserPhone];
        self.userID = @"";
        self.userAvatar = @"";
    }
    
    return self;
}

/**
 *  类初始化方法
 */
+ (instancetype)userWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

@end
