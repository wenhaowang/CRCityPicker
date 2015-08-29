//
//  CRCityItem.m
//  CRCityPicker
//
//  Created by 任超 on 15/8/28.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "CRCityItem.h"
#import "CRCityDataTransformer.h"
#import "CRCityPicker.h"

@implementation CRCityItem

+ (instancetype)itemFrom:(CRCity *)city;
{
    CRCityItem* item = [[CRCityItem alloc] init];
    
    item.city            = city;
    item.width           = 62;
    item.height          = 33;
    item.titleLabel.font = [UIFont systemFontOfSize:15];
    item.backgroundColor = [UIColor whiteColor];
    
//    [item setBorderWith:[UIColor lightGrayColor]];
    [item setRoundCornerWith:2.f];
    [item addTarget:[CRCityPicker instace] action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
    
    [item setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    return item;
}

- (void)setCity:(CRCity *)city
{
    _city = city;
    
    [self setTitle:_city.name forState:UIControlStateNormal];
}

@end
