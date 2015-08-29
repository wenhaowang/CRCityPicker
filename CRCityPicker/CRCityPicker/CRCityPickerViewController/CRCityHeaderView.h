//
//  CRCityHeaderView.h
//  CRCityPicker
//
//  Created by 任超 on 15/8/28.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRCityHeaderView : UIView

@property (nonatomic, copy) NSString* title;

+ (instancetype)headerWithTitle:(NSString *)title;

@end
