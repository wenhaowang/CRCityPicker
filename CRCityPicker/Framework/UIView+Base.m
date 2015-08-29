//
//  UIView.m
//  CRCoreUnit
//
//  Created by abyss on 14/12/18.
//  Copyright (c) 2014年 Abyss Roger. All rights reserved.
//

#import "UIView+Base.h"
//#import "CRBaseStrategy.h"

@implementation UIView (Base)


- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin: (CGPoint) aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}


- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize: (CGSize) aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

- (CGPoint)bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}


- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (void)addSubviews:(UIView *)view,...
{
    [self addSubview:view];
    
    va_list ap;
    va_start(ap, view);
    UIView *akey = va_arg(ap,id);
    while (akey) {
        [self addSubview:akey];
        akey = va_arg(ap,id);
    }
    va_end(ap);
}

- (void)removeAllSubviews
{
    while (self.subviews.count)
    {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (void)setRoundCornerWith:(CGFloat)dgree
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = dgree;
}

- (void)setRoundCorner
{
    [self setRoundCornerWith:5.0f];
}

- (void)setRoundCornerAll
{
    [self setRoundCornerWith:self.height/2.f];
}

- (void)setBorder
{
    [self setBorderWith:[UIColor lightGrayColor]];
}

- (void)setBorderWith:(UIColor *)color
{
    self.layer.borderWidth = .5f;
    self.layer.borderColor = color.CGColor;
}

-(BOOL) containsSubView:(UIView *)subView
{
    for (UIView *view in [self subviews]) {
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

-(BOOL) containsSubViewOfClassType:(Class)class_r {
    for (UIView *view in [self subviews]) {
        if ([view isMemberOfClass:class_r]) {
            return YES;
        }
    }
    return NO;
}

+ (CGRect)viewWith:(CGFloat)width and:(CGFloat)height centerTo:(CGPoint)center
{
    CGFloat x = center.x - width *.5f;
    CGFloat y = center.y - height * .5f;
    
    CGRect frame = (CGRect){CGPointMake(x, y),CGSizeMake(width, height)};
    
    return frame;
}

@end
