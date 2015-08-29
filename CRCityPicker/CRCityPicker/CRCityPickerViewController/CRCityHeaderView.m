//
//  CRCityHeaderView.m
//  CRCityPicker
//
//  Created by 任超 on 15/8/28.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "CRCityHeaderView.h"
#import "CRDefineCityPick.h"

@implementation CRCityHeaderView

+ (instancetype)headerWithTitle:(NSString *)title
{
    CRCityHeaderView* header = [[CRCityHeaderView alloc] init];
    
    header.title  = title;
    header.width  = [[UIScreen mainScreen] bounds].size.width;
    header.height = 45.f;
    header.backgroundColor = rCityPicker_BACKGROUND_COLOR;
    
    return header;
}

- (void)setTitle:(NSString *)title
{
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(15, 5, 40, 40)];
    
//    [button setBorderWith:[UIColor lightGrayColor]];
    [button setRoundCornerWith:2.f];
    
    button.userInteractionEnabled = NO;
    button.backgroundColor        = [UIColor whiteColor];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [self addSubview:button];
}

@end
