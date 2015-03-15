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
    
    /* a UIView flips the Y-coordinate by scaling the Y values by -1. In a flipped coordinate system, specifying a clockwise arc results in a counterclockwise arc after the transformation is applied.
     4.71 = Midday (1.5 M_PI)
     1.75 = 6 (0.5 M_PI)
     6.28 = 3 (2 M_PI) - max value (radius = 2 M_PI)
     3.14 = 9 (M_PI)
     If midday is 4.71 and 6 is 1.75 and 3 is 6.28(max) then need to work out how to represent percentage after midday.
     So 1/4 past = ((2 * M_PI) / 4) + 4.71
     */
    float startAngle = 4.71;
    
    float endAngleArc = 0;
    if ([self.percentageComplete floatValue] > 0)
    {
        endAngleArc = ((2 * M_PI) *[self.percentageComplete floatValue]) + 4.71;
    }


    
    // end angle
    float endAngle = 2 * M_PI; // Used for outline 360 circle

    
    CGContextSetLineWidth(ctx, widthLine);
  
  //  CGContextSetRGBFillColor(ctx,  0.5, 1, 0.5, 1.0);

    CGContextAddArc(ctx, x, y, radius, 0, endAngle, 1);
    //set the fill or stroke color
    CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
    //fill or draw the path
    CGContextFillPath(ctx);
  
    // Give the circle and outline
    CGContextSetLineWidth(ctx, 3);
    CGContextSetRGBStrokeColor(ctx, 0.7, 0.7, 0.7, 1.0);
    CGContextAddArc(ctx, x, y, radius, 0, endAngle, 0);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    if (endAngleArc > 0)
    {
        // Stroke the path
        CGContextSetLineWidth(ctx, widthLine);
        CGContextSetStrokeColorWithColor(ctx, [self.indicatorArcColor CGColor]);
        // CGContextSetRGBStrokeColor(ctx, 0.5, 1, 0.5, 1.0);
        
        CGContextAddArc(ctx, x, y, radius, startAngle, endAngleArc, 0);
        CGContextDrawPath(ctx, kCGPathStroke);
    }

    


    
}


@end
