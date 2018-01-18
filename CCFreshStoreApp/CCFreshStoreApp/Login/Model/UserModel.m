//
//  UserModel.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "UserModel.h"

// Tool
#import "CCTConst.h"

@implementation UserModel

/**
 *  字典初始化方法
 */
- (instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        self.account = dict[kUserAccount];
        self.password = dict[kUserPassword];
        self.phone = dict[kUserPhone];
        self.userID = @"";
        self.avatar = @"";
        self.sex = UserSexTypeMale;
        self.birthday = @"";
    }
    
    return self;
}

/**
 *  类初始化方法
 */
+ (instancetype)userWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

/**
 *  释放内存方法
 */
- (void)dealloc {
    
    self.account = nil;
    self.password = nil;
    self.phone = nil;
    self.userID = nil;
    self.avatar = nil;
    self.birthday = nil;
}

@end
