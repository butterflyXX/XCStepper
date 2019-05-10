//
//  XCStepper.h
//  ActionSheetPicker-3.0
//
//  Created by 刘晓晨 on 2019/5/7.
//

#import <UIKit/UIKit.h>

typedef void(^XCStepperBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface XCStepper : UIView

@property (nonatomic,strong)UIButton *upButton;// +
@property (nonatomic,strong)UIButton *downButton;// -


@property (nonatomic,assign)float stepValue;//步长
@property (nonatomic,assign)float value;//值
@property (nonatomic,assign)float maximumValue;//最大值
@property (nonatomic,assign)float minimumValue;//最小值
@property (nonatomic,copy)XCStepperBlock upActionBlock;// +点击
@property (nonatomic,copy)XCStepperBlock downActionBlock;// -点击
@property (nonatomic,assign)int beginCount;//长按开始慢速次数

@end

NS_ASSUME_NONNULL_END
