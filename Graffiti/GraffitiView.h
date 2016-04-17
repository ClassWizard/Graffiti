//
//  GraffitiView.h
//  Graffiti
//
//  Created by 陈隆威 on 4/17/16.
//  Copyright © 2016 陈隆威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraffitiView : UIView

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColer;

- (void)clear;
- (void)redo;

@end
