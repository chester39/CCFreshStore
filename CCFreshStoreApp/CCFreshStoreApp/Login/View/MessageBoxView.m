//
//  MessageBoxView.m
//      CCFreshStoreApp
//      Chen Chen @ June 4th, 2017
//

#import "MessageBoxView.h"
#import "Const.h"

#import "Masonry.h"

#pragma mark - 界面常数

// 图片视图相关常数
static const CGFloat kImageViewWidth = 30;
static const CGFloat kImageViewHeight = 30;
static const CGFloat kImageViewLeftMargin = 10;

// 文本框相关常数
static const CGFloat kTextFieldHeight = 40;
static const CGFloat kTextFieldLeftMargin = 10;

// 分割线相关常数
static const CGFloat kDivideLineHeight = 1;
static const CGFloat kDivideLineTopMarin = 3;
static const CGFloat kDivideLineLeftMarin = 3;
static const CGFloat kDivideLineRightMarin = 3;

@interface MessageBoxView ()

/// 图片视图
@property (nonatomic, strong) UIImageView *imageView;
/// 文本框
@property (nonatomic, strong) UITextField *textField;
/// 分割线
@property (nonatomic, strong) UIView *divideLine;

@end

@implementation MessageBoxView

#pragma mark - 初始化方法

/**
 *  尺寸初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self != nil) {
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
    
    if (self.imageView == nil) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
    }
    
    if (self.textField == nil) {
        self.textField = [[UITextField alloc] init];
        self.textField.font = kNormalFont;
        self.textField.textColor = kTextGrayColor;
        self.textField.borderStyle = UITextBorderStyleNone;
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:self.textField];
    }
    
    if (self.divideLine == nil) {
        self.divideLine = [[UIView alloc] init];
        self.divideLine.backgroundColor = kAuxiliaryColor;
        [self addSubview:self.divideLine];
    }
}

/**
 *  初始化约束方法
 */
- (void)setupConstraints {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kImageViewWidth);
        make.height.equalTo(kImageViewHeight);
        make.centerY.equalTo(self);
        make.left.equalTo(self.left).with.offset(kImageViewLeftMargin);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kTextFieldHeight);
        make.centerY.equalTo(self);
        make.left.equalTo(self.imageView.right).with.offset(kTextFieldLeftMargin);
        make.right.equalTo(self.right);
    }];
    
    [self.divideLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kDivideLineHeight);
        make.top.equalTo(self.textField.bottom).with.offset(kDivideLineTopMarin);
        make.left.equalTo(self.left).with.offset(kDivideLineLeftMarin);
        make.right.equalTo(self.right).with.offset(-kDivideLineRightMarin);
    }];
}

/**
 *  根据类型布局界面方法
 */
- (void)layoutUIWithType:(MessageBoxType)type placeholder:(NSString *)text isLine:(BOOL)isLine {

    self.textField.placeholder = text;
    self.divideLine.hidden = isLine ? NO : YES;
    
    if (type == MessageBoxTypeUserAccount) {
        UIImage *image = [UIImage imageNamed:@"login_user"];
        self.imageView.image = image;
        self.textField.keyboardType = UIKeyboardTypeDefault;
        
    } else if (type == MessageBoxTypePassword) {
        UIImage *image = [UIImage imageNamed:@"login_password"];
        self.imageView.image = image;
        self.textField.secureTextEntry = YES;
        self.textField.keyboardType = UIKeyboardTypeDefault;
        
    } else if (type == MessageBoxTypePhone) {
        UIImage *image = [UIImage imageNamed:@"login_phone"];
        self.imageView.image = image;
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    }
}

@end
