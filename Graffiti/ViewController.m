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

@property (weak, nonatomic) IBOutlet GraffitiView *graffitView;
@property (weak, nonatomic) IBOutlet UISlider *lineWidthSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *lineColorSegment;

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

- (IBAction)clickRedoBtn:(UIButton *)sender {
    [self.graffitView redo];
}

- (IBAction)clickClearBtn:(UIButton *)sender {
    [self.graffitView clear];
}

@end
