//
//  ViewController.m
//  BGSCircleWIthPercentageIndicator
//
//  Created by Peter Todd Air on 08/03/2015.
//  Copyright (c) 2015 Bright Green Star. All rights reserved.
//

#import "ViewController.h"
#import "BGSUICircleView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BGSUICircleView *circleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.circleView setPercentageComplete:[NSNumber numberWithFloat:0.356]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
