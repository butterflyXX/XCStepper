//
//  XCViewController.m
//  XCStepper
//
//  Created by butterflyXX on 05/10/2019.
//  Copyright (c) 2019 butterflyXX. All rights reserved.
//

#import "XCViewController.h"
#import "ELEditView.h"
#import "Masonry.h"

@interface XCViewController ()

@property (nonatomic,strong)ELEditView *editView;

@end

@implementation XCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.editView = [[ELEditView alloc] init];
    __weak typeof(self) weakSelf = self;
    self.editView.upActionBlock = ^{
        weakSelf.editView.countTextField.text = @([NSString stringWithFormat:@"%.1f",weakSelf.editView.value].floatValue).description;
    };
    self.editView.downActionBlock = ^{
        weakSelf.editView.countTextField.text = @([NSString stringWithFormat:@"%.1f",weakSelf.editView.value].floatValue).description;
    };
    [self.view addSubview:self.editView];
    [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.height.offset(44);
        make.width.offset(145);
    }];
    self.editView.stepValue = 0.1;
    self.editView.maximumValue = 10;
    self.editView.minimumValue = 0;
    self.editView.value = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
