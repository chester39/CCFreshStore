//
//  MineMainModel.h
//      CCFreshStoreApp
//      Chen Chen @ January 28th, 2018
//

#import <Foundation/Foundation.h>

/// 我的主页功能类型
typedef NS_ENUM(NSUInteger, MineMainFunctionType) {
    /// 无功能
    MineMainFunctionTypeNone = 0,
    /// 箭头功能
    MineMainFunctionTypeArrow,
    /// 开关功能
    MineMainFunctionTypeSwitch,
    /// 文字加箭头复合功能
    MineMainFunctionTypeMulti
};

@interface MineMainModel : NSObject

/// 我的主页图标
@property (nonatomic, strong) NSString *icon;
/// 我的主页标题
@property (nonatomic, strong) NSString *title;
/// 我的主页功能
@property (nonatomic, assign) MineMainFunctionType type;

@end
