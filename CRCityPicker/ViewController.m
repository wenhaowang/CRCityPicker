//
//  ViewController.m
//  CRCityPicker
//
//  Created by 任超 on 15/8/27.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "ViewController.h"
#import "CRCityPicker.h"

@interface ViewController ()
@property (nonatomic, strong) CRCityPicker* picker;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 在view 出现在window上后使用!真实情况不用考虑
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _picker = [CRCityPicker showFromViewController:self choose:^(CRCity* city){
            NSLog(@"Choose: %@",city.name);
            
            [_picker dismiss];
        }];
    });
}
@end
