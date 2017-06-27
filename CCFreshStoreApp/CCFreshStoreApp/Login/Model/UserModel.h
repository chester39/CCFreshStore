//
//  UserModel.h
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import <Foundation/Foundation.h>

/// 消息框类型
typedef NS_ENUM(NSUInteger, UserSexType) {
    /// 用户性别男
    UserSexTypeMale = 1 << 0,
    /// 用户性别女
    UserSexTypeFemale = 1 << 1,
};

@interface UserModel : NSObject

/// 用户账号
@property (nonatomic, strong) NSString *account;
/// 用户密码
@property (nonatomic, strong) NSString *password;
/// 用户手机
@property (nonatomic, strong) NSString *phone;
/// 用户ID
@property (nonatomic, strong) NSString *userID;
/// 用户头像
@property (nonatomic, strong) NSString *avatar;
/// 用户性别
@property (nonatomic, assign) UserSexType sex;
/// 用户生日
@property (nonatomic, strong) NSString *birthday;

/**
 *  字典初始化方法
 */
- (instancetype)initWithDict:(NSDictionary *)dict;
/**
 *  类初始化方法
 */
+ (instancetype)userWithDict:(NSDictionary *)dict;


@end
