//
//  UserModel.h
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

/// 用户账号
@property (nonatomic, strong) NSString *userAccount;
/// 用户密码
@property (nonatomic, strong) NSString *userPassword;
/// 用户ID
@property (nonatomic, strong) NSString *userID;
/// 用户手机
@property (nonatomic, strong) NSString *userPhone;
/// 用户头像
@property (nonatomic, strong) NSString *userAvatar;

/**
 *  字典初始化方法
 */
- (instancetype)initWithDict:(NSDictionary *)dict;
/**
 *  类初始化方法
 */
+ (instancetype)userWithDict:(NSDictionary *)dict;


@end
