#Graffiti
---
![icon](http://git.oschina.net/uploads/85/122285_ClassWizard.jpg)
##Overview
A Demo for Draw Line with UIBezierPath

一个关于使用UIBezierPath进行画线的Demo

##Usage
---

###GraffitiView

```
// current line width
// 当前线条大小
@property (nonatomic, assign) CGFloat  lineWidth;

// current line color
// 当前线条颜色
@property (nonatomic, strong) UIColor *lineColor;

/**
 *  clear all lines in the drawing board
 *  清除画板中的所有线条 
 */
- (void)clear;

/**
 *  remove last line in the drawing board
 *  撤销上一笔
 */
- (void)redo;

```