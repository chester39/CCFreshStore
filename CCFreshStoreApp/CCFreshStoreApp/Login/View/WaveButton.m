//
//  WaveButton.m
//      CCFreshStoreApp
//      Chen Chen @ June 9th, 2017
//

#import "WaveButton.h"

// Tool
#import "CCTConst.h"

@interface WaveButton ()

/// 波纹半径
@property (nonatomic, assign) CGFloat waveRadius;
/// 波纹圆心x坐标
@property (nonatomic, assign) CGFloat circleCenterX;
/// 波纹圆心y坐标
@property (nonatomic, assign) CGFloat circleCenterY;
/// 定时器
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation WaveButton

#pragma mark - 初始化方法

/**
 *  尺寸初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        if (self.state == UIControlStateDisabled) {
            self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" alpha:0.7];
        }
    }
    
    return self;
}

/**
 *  释放内存方法
 */
- (void)dealloc {
    
    [self stopTimer];
}

#pragma mark - 界面方法

/**
 *  界面重绘方法
 */
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat endAngle = M_PI * 2;
    CGContextAddArc(context, self.circleCenterX, self.circleCenterY, self.waveRadius, 0, endAngle, 0);
    [self.waveColor setStroke];
    [self.waveColor setFill];
    CGContextFillPath(context);
}

/**
 *  触摸开始方法
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    
    NSSet *touchSet = [event touchesForView:self];
    NSArray *touchArray = touchSet.allObjects;
    UITouch *firstTouch = touchArray.firstObject;
    CGPoint firstPoint = [firstTouch locationInView:self];
    self.circleCenterX = firstPoint.x;
    self.circleCenterY = firstPoint.y;
    [self startTimer];
}

#pragma mark - 定时器方法

/**
 *  开始定时器方法
 */
- (void)startTimer {
    
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

/**
 *  停止定时器方法
 */
- (void)stopTimer {
    
    if (self.timer) {
        [self.timer invalidate];
    }
    self.timer = nil;
}

/**
 *  定时器动作方法
 */
- (void)timerAction {
    
    self.waveRadius += 5;
    [self setNeedsDisplay];
    if (self.waveRadius > self.bounds.size.width * 0.5) {
        self.waveRadius = 0;
        [self.timer invalidate];
        self.timer = nil;
        [self setNeedsDisplay];
    }
}

@end
