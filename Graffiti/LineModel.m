//
//  LineModel.m
//  Graffiti
//
//  Created by ClassWizard on 16/4/18.
//  Copyright © 2016年 陈隆威. All rights reserved.
//

#import "LineModel.h"

@implementation LineModel

- (instancetype)initWithPath:(UIBezierPath *)path lineColor:(UIColor *)lineColor {
    self = [super init];
    if (self) {
        _path = path;
        _lineColor = lineColor;
    }
    return self;
}

@end
