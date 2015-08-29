/**
 *  ==================UIView===================
 *   UIView+Base
 *  ===========================================
 *
 *  Copyright@2015 RogerAbyss
 */
#import <UIKit/UIKit.h>

@interface UIView (Base)

/**
 *  CALayer 属性拓展
 */
@property CGSize size;
@property CGPoint origin;

@property CGFloat width;
@property CGFloat height;

@property CGFloat top;
@property CGFloat left;
@property CGFloat right;
@property CGFloat bottom;

@property (readonly) CGPoint topRight;
@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;

/**
 *  圆角 默认5.f
 */

- (void)setRoundCorner;
- (void)setRoundCornerWith:(CGFloat)dgree;
- (void)setRoundCornerAll;

/**
 *  边界 默认颜色rCOLOR_LINE
 */

- (void)setBorder;
- (void)setBorderWith:(UIColor *)color;

/**
 *  添加或删除 UIView
 */

- (void)addSubviews:(UIView *)view,...NS_REQUIRES_NIL_TERMINATION;
- (void)removeAllSubviews;

/**
 *  UIView判断
 */

- (BOOL)containsSubView:(UIView *)subView;
- (BOOL)containsSubViewOfClassType:(Class)anyClass;

/**
 *  判断居中后的frame
 */
+ (CGRect)viewWith:(CGFloat)width and:(CGFloat)height centerTo:(CGPoint)center;

@end
