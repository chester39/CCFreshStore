//
//  MineMainCell.h
//      CCFreshStoreApp
//      Chen Chen @ January 28th, 2018
//

#import <UIKit/UIKit.h>

@class MineMainModel;

@interface MineMainCell : UITableViewCell

/// 我的主页模型
@property (nonatomic, strong) MineMainModel *mineModel;

/**
 *  绑定数据方法
 */
- (void)bindMineModel:(MineMainModel *)mineModel;

@end
