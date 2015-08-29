//
//  CRDefineCityPick.h
//  CRCityPicker
//
//  Created by 任超 on 15/8/27.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#ifndef CRCityPicker_CRDefineCityPick_h
#define CRCityPicker_CRDefineCityPick_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "CRCityDataTransformer.h"
#import "UIView+Base.h"
#import "CRCityItem.h"

typedef void(^BlockCRCityPickerChooseCallBack)(CRCity *city);

#define rCityPicker_BACKGROUND_COLOR [UIColor colorWithRed:228/255.f green:228/255.f blue:228/255.f alpha:1]

#endif
