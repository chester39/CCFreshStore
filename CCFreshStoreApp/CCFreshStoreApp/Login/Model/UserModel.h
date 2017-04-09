//
//  UserModel.h
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

/// 用户账号
@property (strong, nonatomic) NSString *userAccount;
/// 用户密码
@property (strong, nonatomic) NSString *userPassword;
/// 用户ID
@property (strong, nonatomic) NSString *userID;
/// 用户头像
@property (strong, nonatomic) NSString *userAvatar;
/// 用户昵称
@property (strong, nonatomic) NSString *screenName;

@end
