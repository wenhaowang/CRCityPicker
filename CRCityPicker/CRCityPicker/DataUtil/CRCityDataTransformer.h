//
//  CRCityDataTransformer.h
//  CRCityPicker
//
//  Created by 任超 on 15/8/28.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRCityDataTransformer : NSObject

/** 数据<CRCityDataSection> */
@property (nonatomic, strong) NSMutableArray* data;

/** 本地数据 */
+ (instancetype)generateCityListFromLocal;
/** 服务端处理处理返回 TODO: 当然你也可以自己解析,运算能放在服务端就放在服务端吧骚年！ */
+ (instancetype)generateCityListFromNet:(NSArray *)cityList;

@end

@interface CRCityDataSection : NSObject

/** 分区的标示符, 一般为城市第一个字母 */
@property (nonatomic, copy) NSString* key;

/** 一个分区包含的城市 */
@property (nonatomic, strong) NSMutableArray* array;

+ (instancetype)generateFrom:(NSString *)key array:(NSArray *)array;

@end

@interface CRCity : NSObject

/** 城市的id*/
@property (nonatomic, copy) NSString* ID;

/** 城市中文名 */
@property (nonatomic, copy) NSString* name;

+ (instancetype)generateFrom:(NSString *)ID name:(NSString *)name;

@end