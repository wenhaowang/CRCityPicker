//
//  CRCityItem.h
//  CRCityPicker
//
//  Created by 任超 on 15/8/28.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRCity;
@interface CRCityItem : UIButton

@property (nonatomic, strong) CRCity* city;

+ (instancetype)itemFrom:(CRCity *)city;

@end
