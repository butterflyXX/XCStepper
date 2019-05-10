//
//  ELEditView.m
//  ActionSheetPicker-3.0
//
//  Created by 刘晓晨 on 2019/4/22.
//

#import "ELEditView.h"
#import "Masonry.h"

@interface ELEditView ()<UITextFieldDelegate>

@end

@implementation ELEditView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    self.backgroundColor = kColorWithHex(0xF6F6F6);
    
    self.countTextField = [[UITextField alloc] init];
    self.countTextField.text = @"0";
    self.countTextField.backgroundColor = kColorWithHex(0xffffff);
    self.countTextField.textAlignment = NSTextAlignmentCenter;
    self.countTextField.delegate = self;
    self.countTextField.textColor = kColor_TextSubTitle;
    [self addSubview:self.countTextField];
    [self.countTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.leading.offset(34);
        make.top.offset(1);
    }];
    
    [self.downButton setImage:[UIImage imageNamed:@"lesseeParkingDiscount_down"] forState:UIControlStateNormal];
    [self addSubview:self.downButton];
    [self.downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(0);
        make.centerY.offset(0);
        make.top.offset(0);
        make.trailing.equalTo(self.countTextField.mas_leading).offset(0);
    }];
    
    [self.upButton setImage:[UIImage imageNamed:@"lesseeParkingDiscount_up"] forState:UIControlStateNormal];
    [self addSubview:self.upButton];
    [self.upButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.offset(0);
        make.centerY.offset(0);
        make.top.offset(0);
        make.leading.equalTo(self.countTextField.mas_trailing).offset(0);
    }];
}

//MARK: - UITextFieldDelegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"测试");
    return NO;
}

@end
