//
//  CRCityPicker.m
//  CRCityPicker
//
//  Created by 任超 on 15/8/27.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "CRCityPicker.h"
#import "UIView+Base.h"

static CRCityPicker* cityPicker = nil;
@implementation CRCityPicker

+ (instancetype)showFromViewController:(UIViewController *)viewController choose:(BlockCRCityPickerChooseCallBack)block
{
    CRCityPicker* cityPicker = [CRCityPicker instace];
    
    cityPicker.parent          = viewController;
    cityPicker.chooseCityBlock = block;
    
    [cityPicker display];
    
    return cityPicker;
}

- (void)display
{
    UIWindow* window = _parent.view.window;
    
    if (!window) {
        NSLog(@"ERROR: 没有找到Window");
        
        return;
    }
    
    [window addSubview:_cityPickerViewController.view];
    
    [_parent addChildViewController:_cityPickerViewController];
    
    // TODO: 这里出现的动画可以自己设计
    {
        _cityPickerViewController.view.frame  = window.bounds;
        _cityPickerViewController.view.bottom = 0;
        
        [UIView animateWithDuration:0.6f
                              delay:0
             usingSpringWithDamping:0.6f
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             _cityPickerViewController.view.top = 0;
                         }
                         completion:NULL];
    }
}

- (void)dismiss
{
    // TODO: 这里消失的动画可以自己设计
    {
        [UIView animateWithDuration:0.6f
                              delay:0
             usingSpringWithDamping:0.6f
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             _cityPickerViewController.view.bottom = 0;
                         }
                         completion:^(BOOL finished){
                             [_cityPickerViewController.view removeFromSuperview];
                             [_cityPickerViewController removeFromParentViewController];
                         }];
    }
}

#pragma mark - 单例

+ (instancetype)instace
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!cityPicker) {
            cityPicker = [[CRCityPicker alloc] init];
        }
    });
    
    return cityPicker;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cityPickerViewController = [[CRCityPickerViewController alloc] init];
    }
    return self;
}

- (void)touch:(CRCityItem *)sender
{
    if (_chooseCityBlock) {
        _chooseCityBlock(sender.city);
    }
}

@end
