//
//  CRCityDataTransformer.m
//  CRCityPicker
//
//  Created by 任超 on 15/8/28.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "CRCityDataTransformer.h"

@implementation CRCityDataTransformer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (instancetype)generateCityListFromLocal
{
    NSArray* localData = @[@{@"key":@"A",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           @{@"key":@"B",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           @{@"key":@"C",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           @{@"key":@"D",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           @{@"key":@"E",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           @{@"key":@"F",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           @{@"key":@"G",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           @{@"key":@"H",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           @{@"key":@"I",
                             @"cities":@[@{@"id":@"1",@"name":@"重庆"},@{@"id":@"1",@"name":@"重庆"},],},
                           ];
    
    /** 读取本地数据 */
    return [CRCityDataTransformer generateCityListFromNet:localData];
}

+ (instancetype)generateCityListFromNet:(NSArray *)cityList
{
    CRCityDataTransformer* transformer = [[CRCityDataTransformer alloc] init];
    
    for (NSDictionary* dic in cityList) {
        
        /** TODO: 自定义字段！ */
        CRCityDataSection* section = [CRCityDataSection generateFrom:[dic objectForKey:@"key"]
                                                               array:[dic objectForKey:@"cities"]];
        
        [transformer.data addObject:section];
    }
    
    return transformer;
}

@end

@implementation CRCityDataSection

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (instancetype)generateFrom:(NSString *)key array:(NSArray *)array
{
    CRCityDataSection* section = [[CRCityDataSection alloc] init];
    
    section.key   = key;
    
    for (NSDictionary* dic in array) {
        
        /** TODO: 自定义字段！ */
        CRCity* city = [CRCity generateFrom:[dic objectForKey:@"id"]
                                       name:[dic objectForKey:@"name"]];
        
        [section.array addObject:city];
    }
    
    
    return section;
}

@end

@implementation CRCity

+ (instancetype)generateFrom:(NSString *)ID name:(NSString *)name
{
    CRCity* city = [[CRCity alloc] init];
    
    city.ID   = ID;
    city.name = name;
    
    return city;
}

@end