//
//  LeoLoadingView.m
//  LoadingAnimation
//
//  Created by lihao on 13-8-21.
//  Copyright (c) 2013年 Leo. All rights reserved.
//

#import "LeoLoadingView.h"

#define AnimationTime   0.3

#define kDotSize                (CGSizeMake(0.4 * self.frame.size.width, 0.4 * self.frame.size.height))

#define LeftTopPosition         (CGPointMake(0, 0))
#define LeftTBottomPosition     (CGPointMake(0, 0.6 * self.frame.size.height))
#define RightBottomPosition     (CGPointMake(0.6 * self.frame.size.width, 0.6 * self.frame.size.height))
#define RightTopPosition        (CGPointMake(0.6 * self.frame.size.width, 0))

#define kDotColor               [UIColor colorWithRed:200/255.0 green:206/255.0 blue:221/255.0 alpha:1.0]

@interface LeoLoadingView()

@property (strong, nonatomic) UIView *dotView0,*dotView1,*dotView2;
@property (strong, nonatomic) NSArray *dotViews;
@property (assign, nonatomic) NSInteger dotIndex;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation LeoLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self initView];
}

- (void)initView
{
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    self.userInteractionEnabled = NO;
    
    _dotView0 = [[UIView alloc]initWithFrame:(CGRect){RightBottomPosition, kDotSize}];
    _dotView0.backgroundColor = kDotColor;
    [self addSubview:_dotView0];
    
    _dotView1 = [[UIView alloc]initWithFrame:(CGRect){LeftTBottomPosition, kDotSize}];
    _dotView1.backgroundColor = kDotColor;
    [self addSubview:_dotView1];
    
    _dotView2 = [[UIView alloc]initWithFrame:(CGRect){LeftTopPosition, kDotSize}];
    _dotView2.backgroundColor = kDotColor;
    [self addSubview:_dotView2];
    
    _dotViews = @[_dotView0, _dotView1, _dotView2];
    _dotIndex = 0;
}

-(void)showView:(BOOL)show
{
    if (show) {
        self.hidden = NO;
        if (!_timer) {
            _timer = [NSTimer timerWithTimeInterval:AnimationTime target:self selector:@selector(beginAnimation) userInfo:nil repeats:YES];
            [[NSRunLoop mainRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
        }
    }
    else{
        [_timer invalidate];
        _timer = nil;
        self.hidden = YES;
    }
}

-(void)beginAnimation
{
    [UIView animateWithDuration:AnimationTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        UIView *dotView = _dotViews[_dotIndex];
        [self moveDotViewToNextPosition:dotView];
        
        _dotIndex ++;
        _dotIndex = _dotIndex > 2 ? 0 : _dotIndex;
        
    } completion:nil];
}

-(void)moveDotViewToNextPosition:(UIView*)dotView
{
    if (CGPointEqualToPoint(dotView.frame.origin, LeftTopPosition)) {
        dotView.frame = (CGRect){LeftTBottomPosition, dotView.frame.size};
    }
    else if (CGPointEqualToPoint(dotView.frame.origin, LeftTBottomPosition)) {
        dotView.frame = (CGRect){RightBottomPosition, dotView.frame.size};
    }
    else if (CGPointEqualToPoint(dotView.frame.origin, RightBottomPosition)) {
        dotView.frame = (CGRect){RightTopPosition, dotView.frame.size};
    }
    else if (CGPointEqualToPoint(dotView.frame.origin, RightTopPosition)) {
        dotView.frame = (CGRect){LeftTopPosition, dotView.frame.size};
    }
}

@end
