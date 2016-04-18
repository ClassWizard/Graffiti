//
//  LineModel.h
//  Graffiti
//
//  Created by ClassWizard on 16/4/18.
//  Copyright © 2016年 陈隆威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LineModel : NSObject

@property (nonatomic, strong) UIBezierPath *path;//线条路径
@property (nonatomic, strong) UIColor *lineColor;//线条颜色

- (instancetype)initWithPath:(UIBezierPath *)path lineColor:(UIColor *)lineColor;

@end
