//
//  Slider.m
//  图像对比
//
//  Created by 王奥东 on 16/11/17.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "Slider.h"

@implementation Slider

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//红线
-(void)drawRect:(CGRect)rect {
 
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, rect.size.width/2, 0);
    CGContextAddLineToPoint(context, rect.size.width/2, rect.size.height);
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokePath(context);
    
}


@end
