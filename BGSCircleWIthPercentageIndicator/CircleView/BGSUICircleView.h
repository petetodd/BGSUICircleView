//
//  BGSUICircleView.h
//  BGSCircleWIthPercentageIndicator
//
//  Created by Peter Todd Air on 08/03/2015.
//  Copyright (c) 2015 Bright Green Star. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGSUICircleView : UIView

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) NSNumber *lineWidth;

// Line color of indicator arc
@property (nonatomic, strong) UIColor *indicatorArcColor;
@property (nonatomic, strong) NSNumber *indicatorArcWidth;


// Percentage Complete
@property (nonatomic, strong) NSNumber *percentageComplete;


@end
