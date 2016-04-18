//
//  GraffitiView.m
//  Graffiti
//
//  Created by 陈隆威 on 4/17/16.
//  Copyright © 2016 陈隆威. All rights reserved.
//

#import "GraffitiView.h"
#import "LineModel.h"

@interface GraffitiView ()

@property (nonatomic, strong) NSMutableArray<LineModel *> *points;

@end

@implementation GraffitiView

- (void)drawRect:(CGRect)rect {
    for (LineModel *line in self.points) {
        UIBezierPath *path = line.path;
        UIColor *lineColor = line.lineColor;
        [lineColor setStroke];
        [path stroke];
    }
}

- (void)redo {
    [self.points removeLastObject];
    [self setNeedsDisplay];
}

- (void)clear {
    [self.points removeAllObjects];
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    // 1.取出当前点位
    UITouch *touch = touches.anyObject;
    CGPoint beginPoint = [touch locationInView:touch.view];
    
    // 2.生成贝塞尔曲线
    UIBezierPath *currentPath = [UIBezierPath bezierPath];
    
    // 3.起点移动至手势起点
    [currentPath moveToPoint:beginPoint];
    
    // 4.设置线条属性
    currentPath.lineWidth = self.lineWidth;//线条宽度
    currentPath.lineCapStyle = kCGLineCapRound;//线条端点样式
    currentPath.lineJoinStyle = kCGLineJoinRound;//线条接点样式
    
    // 5.生成线条Model,将其存入数据源
    LineModel *line = [[LineModel alloc] initWithPath:currentPath lineColor:self.lineColer];
    [self.points addObject:line];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    // 1.取出当前点位
    UITouch *touch = touches.anyObject;
    CGPoint movePoints = [touch locationInView:touch.view];
    
    // 2.取出当前进行的划线路径
    UIBezierPath *currentPath = self.points.lastObject.path;
    
    // 3.将手势进行移动的点加入路径中
    [currentPath addLineToPoint:movePoints];
    
    // 4.刷新视图
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    // 同移动
    [self touchesMoved:touches withEvent:event];
}

#pragma mark - Lazy Load
- (NSMutableArray *)points {
    if (!_points) {
        _points = [NSMutableArray array];
    }
    return _points;
}

- (UIColor *)lineColer {
    if (!_lineColor) {
        _lineColor = [UIColor blackColor];
    }
    return _lineColor;
}

- (CGFloat)lineWidth {
    return _lineWidth > 0 ? _lineWidth : 10;
}

@end
