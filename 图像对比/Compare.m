//
//  Compare.m
//  图像对比
//
//  Created by 王奥东 on 16/11/17.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "Compare.h"

@implementation Compare

//初始化
-(id)initWithLeftSideImage:(UIImage *)leftImage rightSideImage:(UIImage *)rightImage {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, leftImage.size.width, leftImage.size.height)]) {
        
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, leftImage.size.width, leftImage.size.height)];
        _leftImageView.contentMode = UIViewContentModeLeft;
        _leftImageView.clipsToBounds = YES;
        _leftImageView.image = leftImage;
        
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, leftImage.size.width, leftImage.size.height)];
        _rightImageView.contentMode = UIViewContentModeRight;
        _rightImageView.image = rightImage;
        _rightImageView.clipsToBounds = YES;
        
        _leftImageView.center = self.center;
        _rightImageView.center = self.center;
        
        [self addSubview:_leftImageView];
        [self addSubview:_rightImageView];
         //设置分割线位置，左侧与右侧图片的width
        self.sliderPosition = leftImage.size.width/2;
    }
    return self;
}
//设置分隔线视图
-(void)setSliderView:(UIView *)sliderView {
    [_sliderView removeFromSuperview];
    _sliderView = sliderView;
    _sliderView.center = self.center;
    
    [self addSubview:_sliderView];
}


//设置分隔线的位置以及动画
-(void)setSliderPosition:(float)sliderPosition animated:(BOOL)animated {
    
    if (animated) {
        [UIView animateWithDuration:1.0 animations:^{
            self.sliderPosition = sliderPosition;
        }];
        
    }else {
        self.sliderPosition = sliderPosition;
    }
    
}

//设置分隔线的位置
-(void)setSliderPosition:(float)sliderPosition {
    //一定要在自身范围内
    if ((sliderPosition < self.frame.size.width)&&(sliderPosition > self.bounds.origin.x)) {
       
        _sliderPosition = sliderPosition;
        if (self.sliderView) {
            self.sliderView.center = CGPointMake(sliderPosition, self.sliderView.center.y);
        }
        //设置左侧与右侧图片的width
        CGRect leftImageRect = self.leftImageView.frame;
        leftImageRect.size.width = sliderPosition;
        self.leftImageView.frame = leftImageRect;
        
        CGRect rightImageRect = self.rightImageView.frame;
        rightImageRect.origin.x = sliderPosition;
        rightImageRect.size.width = self.frame.size.width - sliderPosition;
        self.rightImageView.frame = rightImageRect;
        
    }
    
   
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint currentPoint = [touch locationInView:self.sliderView];

    if (CGRectContainsPoint(self.sliderView.bounds, currentPoint)) {
        self.isSliderTouched = YES;
    }
    
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isSliderTouched) {
        UITouch *touch = [touches anyObject];
        
        CGPoint currentPoint = [touch locationInView:self];
        
        //没有到最左边与最右边就移动
        if (currentPoint.x >= self.sliderView.bounds.size.width/2 && currentPoint.x <= self.bounds.size.width - self.sliderView.bounds.size.width/2) {
            self.sliderPosition = currentPoint.x;
        }
        
    }
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //如果不是移动Slider结束手势
    //就让Slider以动画形式移动到触摸点
    if (self.isSliderTouched == NO) {
        
        UITouch *touch = [touches anyObject];
        
        CGPoint currentPoint = [touch locationInView:self];
        
        [self setSliderPosition:currentPoint.x animated:YES];
        
    }
    
    self.isSliderTouched = NO;
}


@end
