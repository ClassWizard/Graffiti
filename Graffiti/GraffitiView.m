//
//  GraffitiView.m
//  Graffiti
//
//  Created by 陈隆威 on 4/17/16.
//  Copyright © 2016 陈隆威. All rights reserved.
//

#import "GraffitiView.h"

@interface GraffitiView ()

@property (nonatomic, strong) NSMutableArray *points;
@property (nonatomic, strong) NSMutableArray *colors;

@end

@implementation GraffitiView

- (void)drawRect:(CGRect)rect {
    for (int i = 0; i < self.points.count; i++) {
        UIBezierPath *path = self.points[i];
        UIColor *color = self.colors[i];
        [color setStroke];
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
    UITouch *touch = touches.anyObject;
    CGPoint beginPoint = [touch locationInView:touch.view];
    
    UIBezierPath *currentPath = [UIBezierPath bezierPath];
    [currentPath moveToPoint:beginPoint];
    
    currentPath.lineWidth = self.lineWidth;
    currentPath.lineCapStyle = kCGLineCapRound;
    currentPath.lineJoinStyle = kCGLineJoinRound;
    
    [self.colors addObject:self.lineColer];
    [self.points addObject:currentPath];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint movePoints = [touch locationInView:touch.view];
    
    UIBezierPath *currentPath = self.points.lastObject;
    [currentPath addLineToPoint:movePoints];
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

- (NSMutableArray *)points {
    if (!_points) {
        _points = [NSMutableArray array];
    }
    return _points;
}

- (NSMutableArray *)colors {
    if (!_colors) {
        _colors = [NSMutableArray array];
    }
    return _colors;
}

- (UIColor *)lineColer {
    if (!_lineColer) {
        _lineColer = [UIColor blackColor];
    }
    return _lineColer;
}

- (CGFloat)lineWidth {
    return _lineWidth > 0 ? _lineWidth : 10;
}
@end
