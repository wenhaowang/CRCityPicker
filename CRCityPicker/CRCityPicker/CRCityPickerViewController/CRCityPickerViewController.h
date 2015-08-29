//
//  CRCityPickerViewController.h
//  CRCityPicker
//
//  Created by 任超 on 15/8/27.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "CRDefineCityPick.h"

@class CRCityDataTransformer;
@interface CRCityPickerViewController : UIViewController

/** 定位到的城市 */
@property (nonatomic, strong) NSString* locationName;

/** 热门城市数据 */
@property (nonatomic, strong) NSMutableArray* cityData;

/** 历史记录数据 */
@property (nonatomic, strong) NSMutableArray* historyData;

@end
