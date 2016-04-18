//
//  GraffitiView.h
//  Graffiti
//
//  Created by 陈隆威 on 4/17/16.
//  Copyright © 2016 陈隆威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraffitiView : UIView

@property (nonatomic, assign) CGFloat  lineWidth;//当前线条大小
@property (nonatomic, strong) UIColor *lineColor;//当前线条颜色

/**
 *  清除画板中的所有线条
 */
- (void)clear;

/**
 *  撤销上一笔
 */
- (void)redo;

@end
