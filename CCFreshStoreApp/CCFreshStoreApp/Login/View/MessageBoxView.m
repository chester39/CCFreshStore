//
//  MessageBoxView.m
//      CCFreshStoreApp
//      Chen Chen @ June 4th, 2017
//

#import "MessageBoxView.h"

// Tool
#import "Const.h"

// Third Party
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

@interface MessageBoxView () <UITextFieldDelegate>

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
    
    if (!self.imageView) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
    }
    
    if (!self.textField) {
        self.textField = [[UITextField alloc] init];
        self.textField.font = kNormalFont;
        self.textField.textColor = kTextGrayColor;
        self.textField.borderStyle = UITextBorderStyleNone;
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textField.delegate = self;
        [self addSubview:self.textField];
    }
    
    if (!self.divideLine) {
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
        make.left.equalTo(self).offset(kImageViewLeftMargin);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kTextFieldHeight);
        make.centerY.equalTo(self);
        make.left.equalTo(self.imageView).offset(kTextFieldLeftMargin);
        make.right.equalTo(self);
    }];
    
    [self.divideLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kDivideLineHeight);
        make.top.equalTo(self.textField.bottom).offset(kDivideLineTopMarin);
        make.left.equalTo(self).offset(kDivideLineLeftMarin);
        make.right.equalTo(self).offset(-kDivideLineRightMarin);
    }];
}

/**
 *  根据类型布局界面方法
 */
- (void)layoutUIWithType:(MessageBoxType)type placeholder:(NSString *)text isLine:(BOOL)isLine {

    self.textField.placeholder = text;
    self.divideLine.hidden = isLine ? NO : YES;
    
    if (type == MessageBoxTypeAccount) {
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

#pragma mark - UITextFieldDelegate代理方法

/**
 *  将要开始编辑方法
 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

/**
 *  改变文本内容方法
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    self.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return YES;
}

/**d
 *  点击返回按钮方法
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

@end
