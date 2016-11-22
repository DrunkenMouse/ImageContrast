//
//  Compare.h
//  图像对比
//
//  Created by 王奥东 on 16/11/17.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Compare : UIView

@property (nonatomic, strong) UIView *sliderView;//分割线
@property (nonatomic, assign) float sliderPosition;//分割线位置
@property (nonatomic, assign) BOOL isSliderTouched;//是否滑动Slider
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

-(void)setSliderPosition:(float)sliderPosition animated:(BOOL)animated;

-(id)initWithLeftSideImage:(UIImage *)leftImage rightSideImage:(UIImage *)rightImage;

@end
