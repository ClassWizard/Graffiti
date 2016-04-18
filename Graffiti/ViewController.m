//
//  ViewController.m
//  Graffiti
//
//  Created by 陈隆威 on 4/17/16.
//  Copyright © 2016 陈隆威. All rights reserved.
//

#import "ViewController.h"
#import "GraffitiView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet GraffitiView *graffitView;//画板

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)clickRedoBtn:(UIButton *)sender {
    [self.graffitView redo];
}

- (IBAction)clickClearBtn:(UIButton *)sender {
    [self.graffitView clear];
}

- (IBAction)lineWidthChanged:(UISlider *)sender {
    self.graffitView.lineWidth = sender.value;
}

- (IBAction)colorSegmentChanged:(UISegmentedControl *)sender {
    self.graffitView.lineColor = [self colorWithIndex:sender.selectedSegmentIndex];
}

#pragma Helper
/**
 *  根据Segment的selectedIndex决定对应颜色
 *
 *  @param index Segment的选中索引
 *
 *  @return 对应颜色
 */
- (UIColor *)colorWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            return [UIColor blackColor];
        case 1:
            return [UIColor redColor];
        case 2:
            return [UIColor greenColor];
        case 3:
            return [UIColor blueColor];
        default:
            return [UIColor blackColor];
    }
}

@end
