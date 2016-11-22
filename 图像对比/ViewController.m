//
//  ViewController.m
//  图像对比
//
//  Created by 王奥东 on 16/11/17.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "Slider.h"
#import "Compare.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    Compare *before = [[Compare alloc] initWithLeftSideImage:[UIImage imageNamed:@"2"] rightSideImage:[UIImage imageNamed:@"1"]];
    
    
    UIImageView *slider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    
    before.sliderView = [[Slider alloc] initWithFrame:CGRectMake(0, 0, slider.frame.size.width, before.frame.size.height)];
    [before.sliderView addSubview:slider];
    before.sliderView.contentMode = UIViewContentModeCenter;
    
    slider.center = CGPointMake(slider.center.x, before.sliderView.center.y);
    
    [self.view addSubview:before];
    
    before.center = self.view.center;
}


@end
