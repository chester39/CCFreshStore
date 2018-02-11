//
//  MineMainCell.m
//      CCFreshStoreApp
//      Chen Chen @ January 28th, 2018
//

#import "MineMainCell.h"

// Tool
#import "CCTConst.h"

// Model
#import "MineMainModel.h"

// Third Party
#import "Masonry.h"

// 图标图片视图相关常数
static const CGFloat kIconViewWidth = 30;
static const CGFloat kIconViewHeight = 30;
static const CGFloat kIconViewLeftMargin = 15;

// 标题文本标签图相关常数
static const CGFloat kTitleLabelLeftMargin = 10;

// 箭头图片视图相关常数
static const CGFloat kArrowViewWidth = 10;
static const CGFloat kArrowViewHeight = 10;
static const CGFloat kAuxiliaryViewRightMargin = 10;

// 开关视图相关常数
static const CGFloat kSwitchViewWidth = 40;
static const CGFloat kSwitchViewHeight = 20;

@interface MineMainCell ()

/// 图标图片视图
@property (nonatomic, strong) UIImageView *iconView;
/// 标题文本标签
@property (nonatomic, strong) UILabel *titleLabel;
/// 箭头图片视图
@property (nonatomic, strong) UIImageView *arrowView;
/// 开关视图
@property (nonatomic, strong) UISwitch *switchView;
/// 功能文本标签
@property (nonatomic, strong) UILabel *functionLabel;

@end

@implementation MineMainCell

#pragma mark - 初始化方法

/**
 *  Cell初始化方法
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        [self setupConstraints];
    }
    
    return self;
}

#pragma mark - 界面方法

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    if (!self.iconView) {
        self.iconView = [[UIImageView alloc] init];
        self.iconView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.iconView];
    }
    
    if (!self.titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = kMediumFont;
        self.titleLabel.textColor = kTextBlackColor;
        [self.contentView addSubview:self.titleLabel];
    }
    
    if (!self.arrowView) {
        UIImage *arrow = [UIImage imageNamed:@"mine_arrow"];
        self.arrowView = [[UIImageView alloc] initWithImage:arrow];
        self.arrowView.contentMode = UIViewContentModeScaleAspectFill;
        self.arrowView.hidden = YES;
        [self.contentView addSubview:self.arrowView];
    }
    
    if (!self.switchView) {
        self.switchView = [[UISwitch alloc] init];
        self.switchView.onTintColor = kMainColor;
        self.switchView.tintColor = kAuxiliaryColor;
        self.switchView.hidden = YES;
        [self.contentView addSubview:self.switchView];
    }
    
    if (!self.functionLabel) {
        self.functionLabel = [[UILabel alloc] init];
        self.functionLabel.font = kSmallFont;
        self.functionLabel.textColor = kTextBlackColor;
        self.functionLabel.hidden = YES;
        [self.contentView addSubview:self.functionLabel];
    }
}

/**
 *  初始化约束方法
 */
- (void)setupConstraints {
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kIconViewWidth);
        make.height.equalTo(kIconViewHeight);
        make.left.equalTo(self).offset(kIconViewLeftMargin);
        make.centerY.equalTo(self);
    }];
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.right).offset(kTitleLabelLeftMargin);
        make.centerY.equalTo(self);
    }];
}

#pragma mark - 数据方法

/**
 *  绑定数据方法
 */
- (void)setMineModel:(MineMainModel *)mineModel {
    
    if (CCTClassCheck(mineModel, MineMainModel)) {
        return;
    }
        
    if (CCTNSStringCheck(mineModel.icon)) {
        self.iconView.image = [UIImage imageNamed:mineModel.icon];
        
    } else {
        self.iconView.hidden = YES;
    }
    
    if (CCTNSStringCheck(mineModel.title)) {
        self.titleLabel.text = mineModel.title;
        
    } else {
        self.titleLabel.text = @"标题";
    }
    
    if (mineModel.type == MineMainFunctionTypeArrow) {
        self.arrowView.hidden = NO;
        self.switchView.hidden = YES;
        self.functionLabel.hidden = YES;
        
        [self.arrowView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kArrowViewWidth);
            make.height.equalTo(kArrowViewHeight);
            make.right.equalTo(self).offset(-kAuxiliaryViewRightMargin);
            make.centerY.equalTo(self);
        }];
        
    } else if (mineModel.type == MineMainFunctionTypeSwitch) {
        self.switchView.hidden = NO;
        self.arrowView.hidden = YES;
        self.functionLabel.hidden = YES;
        
        [self.switchView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kSwitchViewWidth);
            make.height.equalTo(kSwitchViewHeight);
            make.right.equalTo(self).offset(-kAuxiliaryViewRightMargin);
            make.centerY.equalTo(self);
        }];
        
    } else if (mineModel.type == MineMainFunctionTypeMulti) {
        self.functionLabel.hidden = NO;
        self.arrowView.hidden = NO;
        self.switchView.hidden = YES;
        
        [self.switchView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kSwitchViewWidth);
            make.height.equalTo(kSwitchViewHeight);
            make.right.equalTo(self).offset(-kAuxiliaryViewRightMargin);
            make.centerY.equalTo(self);
        }];
        
        [self.functionLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.switchView.left).offset(-kAuxiliaryViewRightMargin);
            make.centerY.equalTo(self);
        }];
        
    } else if (mineModel.type == MineMainFunctionTypeNone) {
        self.arrowView.hidden = YES;
        self.switchView.hidden = YES;
        self.functionLabel.hidden = YES;
        
    } else {
        self.arrowView.hidden = YES;
        self.switchView.hidden = YES;
        self.functionLabel.hidden = YES;
    }
}

@end
