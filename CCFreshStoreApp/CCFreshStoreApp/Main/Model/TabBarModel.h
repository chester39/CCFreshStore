//
//  TabBarModel.h
//      CCFreshStoreApp
//      Chen Chen @ July 11th, 2017
//

#import <Foundation/Foundation.h>

@interface TabBarModel : NSObject

/// 控制器名
@property (nonatomic, copy) NSString *controllerName;
/// 标题
@property (nonatomic, copy) NSString *title;
/// 图片名
@property (nonatomic, copy) NSString *imageName;

@end
