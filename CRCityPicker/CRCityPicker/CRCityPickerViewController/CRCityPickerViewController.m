//
//  CRCityPickerViewController.m
//  CRCityPicker
//
//  Created by 任超 on 15/8/27.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "CRCityPickerViewController.h"

#import "CRCityDataTransformer.h"
#import "CRCityHeaderView.h"
#import "CRCityContentView.h"

#import "CRCityPicker.h"

@interface CRCityPickerViewController () <UITableViewDelegate,UITableViewDataSource>
/** List */
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 城市数据转化器 */
@property (nonatomic, strong) CRCityDataTransformer* dataTransformer;


/** 城市数据 */
@property (weak, nonatomic) NSArray* data;

/** 索引数据 */
@property (strong, nonatomic) NSMutableArray* indexData;

/*************************************************************************
 *                       TableViewHeader
 */

// 定位标签
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

// 默认: 180,  高度需要+ hotCityConst + histortConst
@property (strong, nonatomic) IBOutlet UIView *header;

// 热门城市View, 数据为0时 隐藏
@property (weak, nonatomic) IBOutlet UIView *viewHotCity;

// 热门城市内容
@property (weak, nonatomic) IBOutlet CRCityContentView *viewHotCityContent;

// 历史记录View, 数据为0时 隐藏
@property (weak, nonatomic) IBOutlet UIView *viewHistory;

// 历史记录内容
@property (weak, nonatomic) IBOutlet CRCityContentView *viewHistoryContent;

// 历史记录 栏目高度:30, 数据为0时 为0
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rootHistoryConst;

// 热门城市 栏目高度:30, 数据为0时 为0
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rootHotCityContst;

// 热门城市 每4个增加 45
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hotCityConst;

// 历史记录 每4个增加 45
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *histortConst;
/*
 *
 *************************************************************************/

@end

@implementation CRCityPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureTable];
}

- (void)configureTable
{
    // 初始化数据
    [self setupData];
    
    // 设置列表头
    _tableView.tableHeaderView   = _header;
    _tableView.backgroundColor   = rCityPicker_BACKGROUND_COLOR;
    
    _tableView.separatorStyle    = UITableViewCellSeparatorStyleNone;
    
    // 设置侧边条风格
    _tableView.sectionIndexColor           = [UIColor darkGrayColor];
    _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
}

- (void)setupData
{
    _dataTransformer = [CRCityDataTransformer generateCityListFromLocal];
    
    
    self.cityData    = [NSMutableArray arrayWithArray:@[]];
    self.historyData = [NSMutableArray arrayWithArray:@[]];
    
#warning 测试数据
    {
        for (NSString* string in @[@"重庆",@"深圳",@"成都",@"北京",@"四川"]) {
            CRCity* city = [CRCity generateFrom:@"1" name:string];
            
            [_cityData addObject:city];
        }
        
        self.cityData = _cityData;
    }
    
    // 计算frame , 每排4个
    [self configureLayout];
}

- (void)configureLayout
{
    _hotCityConst.constant = ((_cityData.count/4) + (_cityData.count%4 > 0?1:0)) * 45.f;
    _histortConst.constant = ((_historyData.count/4) + (_historyData.count%4 > 0?1:0)) * 45.f;
    
    _header.height              = 180 + _hotCityConst.constant + _histortConst.constant;
    
    // 历史记录
    if (_historyData.count == 0) {
        _rootHistoryConst.constant = 0;
        _header.height             -= 30;
        _viewHistory.hidden        = YES;
    }
    else
    {
        _viewHistory.hidden        = NO;
        _rootHistoryConst.constant = 30;
    }
    
    // 热门城市
    if (_cityData.count == 0) {
        _rootHotCityContst.constant = 0;
        _header.height              -= 30;
        _viewHotCity.hidden         = YES;
    }
    else
    {
        _viewHotCity.hidden         = NO;
        _rootHotCityContst.constant = 30;
    }
}

#pragma mark - Setter

- (void)setCityData:(NSMutableArray *)cityData
{
    _cityData = cityData;
    [_viewHotCityContent loadCities:_cityData];
    
    [self configureLayout];
}

- (void)setHistoryData:(NSMutableArray *)historyData
{
    _historyData = historyData;
    [_viewHistoryContent loadCities:_historyData];
    
#warning TODO: layout 会报错,不知道为什么
    [self configureLayout];
}

- (void)setLocationName:(NSString *)locationName
{
    _locationLabel.text = locationName;
}

#pragma mark - Reusable

- (NSArray *)data
{
    return _dataTransformer.data;
}

- (NSMutableArray *)indexData
{
    if (!_indexData) {
        _indexData = [[NSMutableArray alloc] init];
        
        for (CRCityDataSection* section in self.data) {
            [_indexData addObject:section.key];
        }
    }
    
    return _indexData;
}

#pragma mark - TableView Delegate and DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        
        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(15, 35, [[UIScreen mainScreen] bounds].size.width - 30, 1)];
        line.backgroundColor = [UIColor lightGrayColor];
        
        [cell addSubview:line];
    }
    
    CRCity* city = ((CRCityDataSection *)[self.data objectAtIndex:indexPath.section]).array[indexPath.row];
    
    cell.backgroundColor = [UIColor colorWithRed:228/255.f green:228/255.f blue:228/255.f alpha:1];
    cell.textLabel.text = city.name;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CRCityDataSection* sectionData = self.data[section];
    
    return sectionData.array.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.f;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexData;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(index == 0)
    {
        // 返回顶端
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_tableView setContentOffset:CGPointMake(0, 0) animated:YES];
        });
    }
    return index;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [CRCityHeaderView headerWithTitle:self.indexData[section]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CRCity* city = ((CRCityDataSection *)[self.data objectAtIndex:indexPath.section]).array[indexPath.row];
    
    if ([CRCityPicker instace].chooseCityBlock) {
        [CRCityPicker instace].chooseCityBlock(city);
    }
}

- (IBAction)dismiss:(id)sender
{
    [[CRCityPicker instace] dismiss];
}

@end
