//
//  XCStepper.m
//  ActionSheetPicker-3.0
//
//  Created by 刘晓晨 on 2019/5/7.
//

#import "XCStepper.h"

@interface XCStepper ()

@property (nonatomic,weak)NSTimer *firstTimer;
@property (nonatomic,weak)NSTimer *secondTimer;

@end

static int flag = 0;

@implementation XCStepper

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.downButton = [[UIButton alloc] init];
        [self.downButton addTarget:self action:@selector(stepAction:) forControlEvents:UIControlEventTouchDown];
        self.upButton = [[UIButton alloc] init];
        [self.upButton addTarget:self action:@selector(stepAction:) forControlEvents:UIControlEventTouchDown];
        self.beginCount = 4;
    }
    return self;
}

-(void)stepAction:(UIButton *)button {
    if (button == self.upButton) {
        if (self.value >= self.maximumValue) {
            return;
        }
    } else if (button == self.downButton) {
        if (self.value <= self.minimumValue) {
            return;
        }
    }
    [self.firstTimer invalidate];
    [self.secondTimer invalidate];
    self.firstTimer = nil;
    self.secondTimer = nil;
    __block int beginCount = 0;
    XCStepperBlock block;
    float step;
    if (button == self.upButton) {
        step = self.stepValue;
        block = self.upActionBlock;
    } else {
        step = -self.stepValue;
        block = self.downActionBlock;
    }
    flag++;
    __block int currenFlage = flag;
    if (@available(iOS 10.0, *)) {
        NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
            if ((currenFlage == flag && beginCount <= self.beginCount && button.state == UIControlStateHighlighted) || beginCount == 0) {
                beginCount++;
                
                self.value = [self addWithA:[NSString stringWithFormat:@"%f",self.value] b:[NSString stringWithFormat:@"%f",step]].floatValue;
                if (self.value >= self.maximumValue || self.value <= self.minimumValue) {
                    [timer invalidate];
                    timer = nil;
                }
                if (block) {
                    block();
                }
            } else {
                [timer invalidate];
                timer = nil;
                if (currenFlage == flag && beginCount > self.beginCount && button.state == UIControlStateHighlighted) {
                    //依然在长按过程中
                    __block NSTimer *newtimer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                        //                    NSLog(@"current %d ---- flag %d",currenFlage,flag);
                        if (currenFlage == flag && button.state == UIControlStateHighlighted) {
                            self.value = [self addWithA:[NSString stringWithFormat:@"%f",self.value] b:[NSString stringWithFormat:@"%f",step]].floatValue;
                            if (self.value >= self.maximumValue || self.value <= self.minimumValue) {
                                [newtimer invalidate];
                                newtimer = nil;
                            }
                            if (block) {
                                block();
                            }
                        } else {
                            [newtimer invalidate];
                            newtimer = nil;
                        }
                    }];
                    self.secondTimer = newtimer;
                    [[NSRunLoop currentRunLoop] addTimer:newtimer forMode:NSRunLoopCommonModes];
                }
            }
        }];
        self.firstTimer = timer;
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    } else {
        // Fallback on earlier versions
    }
}

-(void)setValue:(float)value {
    _value = value;
    if (self.upActionBlock) {
        self.upActionBlock();
    }
}

-(NSDecimalNumber *)addWithA:(NSString *)a b:(NSString *)b {
    NSDecimalNumber *aNumber = [NSDecimalNumber decimalNumberWithString:a];
    NSDecimalNumber *bNumber = [NSDecimalNumber decimalNumberWithString:b];
    NSDecimalNumber *product = [aNumber decimalNumberByAdding:bNumber];
    return product;
}

@end
