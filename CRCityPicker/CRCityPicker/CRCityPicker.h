//
//  CRCityPicker.h
//  CRCityPicker
//
//  Created by 任超 on 15/8/27.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "CRHistoryManager.h"
#import "CRCityPickerViewController.h"

@interface CRCityPicker : NSObject


/** 地理位置,用于显示当前位置 */
@property (nonatomic, strong) CLLocation* location;

/** 历史记录管理器,用于展示历史选择记录 */
@property (nonatomic, strong) CRHistoryManager* historyManager;

/** 城市选择控制器 */
@property (nonatomic, strong) CRCityPickerViewController* cityPickerViewController;



/** 父控制器 */
@property (nonatomic, weak) UIViewController* parent;

/** 选择城市的回调 */
@property (nonatomic, copy) BlockCRCityPickerChooseCallBack chooseCityBlock;




/** 单例实现 */
+ (instancetype)instace;

/**
 *  出现城市选择器
 *
 *  @param viewController 当前的控制器
 *  @param block          点击回调
 *
 *  @return 城市选择器
 */
+ (instancetype)showFromViewController:(UIViewController *)viewController choose:(BlockCRCityPickerChooseCallBack)block;

/** 出现 */
- (void)display;

/** 消失 */
- (void)dismiss;

@end
