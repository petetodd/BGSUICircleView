//
//  BGSUICircleView.m
//  BGSCircleWIthPercentageIndicator
//
//  Created by Peter Todd Air on 08/03/2015.
//  Copyright (c) 2015 Bright Green Star. All rights reserved.
//
/*
 Create a stroked circle to give a circle shape.  Then create a second part-circle with a wider line width.  
 The 2nd circle is a progress indicator e..g if the progress is 10% then the 2nd cirle will only go 10% around
 the 1st circle.
 
 Core graphics is Lower left origin based (LLO) but UIKit is Upper left origin based (ULO)
 
 // start angle and end angle, measured in radians where zero is horizontally to the right—the “positive x-axis”
 
 */

#import "BGSUICircleView.h"

@implementation BGSUICircleView
/*
-(void)setLineWidth:(NSNumber *)lineWidth
{
    self.lineWidth = lineWidth;
}
*/
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    // X value
    float x = self.frame.size.width/2;
    float y = self.frame.size.height/2;
    
    float widthLine = 1;
    if (self.lineWidth.floatValue > 1){
        widthLine = self.lineWidth.floatValue;
    }
    // Radius - we want as big a circle as will fit centered in the view
    float radius = (MIN(self.frame.size.width, self.frame.size.height))/2;
    radius = radius - (widthLine / 2);
    // Staert angle
  //  float startAngle = (180 * M_1_PI)/180;
    
    
    // end angle
    float endAngle = 2 * M_PI;
    

    
    CGContextSetLineWidth(ctx, widthLine);
  
  //  CGContextSetRGBFillColor(ctx,  0.5, 1, 0.5, 1.0);
    CGContextSetRGBStrokeColor(ctx, 0.5, 1, 0.5, 1.0);

    CGContextAddArc(ctx, x, y, radius, 0, endAngle, 1);
    //set the fill or stroke color
    CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
    //fill or draw the path
    CGContextFillPath(ctx);
    // Stroke the path
    CGContextAddArc(ctx, x, y, radius, 0, endAngle, 1);
    CGContextDrawPath(ctx, kCGPathStroke);

    
}


@end
