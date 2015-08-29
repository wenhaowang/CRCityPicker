//
//  CRCityContentView.m
//  CRCityPicker
//
//  Created by 任超 on 15/8/28.
//  Copyright (c) 2015年 Roger Abyss. All rights reserved.
//

#import "CRCityContentView.h"
#import "CRDefineCityPick.h"

#import "CRCityItem.h"

@implementation CRCityContentView

- (void)loadCities:(NSArray *)array
{
    for (int i = 0; i < array.count; i ++) {
        CRCity* city = array[i];
        
        CRCityItem* item = [CRCityItem itemFrom:city];
        item.left = 15 + i%4 * (item.width + 10);
        item.top  = 6  + i/4 * (item.height + 8);
        
        [self addSubview:item];
        
        CGRect frame = item.frame;
        
        item.frame = CGRectZero;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i/6.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.6
                                  delay:0
                 usingSpringWithDamping:.6
                  initialSpringVelocity:10
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 item.frame = frame;
                             }
                             completion:NULL];
        });
    }
}

@end
