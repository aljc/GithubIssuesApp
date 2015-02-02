//
//  DrawCircle.m
//  GitHubIssues
//
//  Created by ajchang on 1/30/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import "DrawCircle.h"

@implementation DrawCircle


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    //get screen dimensions for circle placement
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    // Drawing code
    // Note: the line widths of the red inner circle is proportionate to how many closed issues there currently are
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.closed);
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor redColor].CGColor);

    CGRect rectangle = CGRectMake(screenWidth/2 - 100.0,screenHeight/2 - 100.0,200,200);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    
    context = UIGraphicsGetCurrentContext();
    // Note: the line widths of the green outer circle is proportionate to how many open issues there currently are
    CGContextSetLineWidth(context, self.open);
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor greenColor].CGColor);
    rectangle = CGRectMake(screenWidth/2 - 120.0,screenHeight/2 - 120.0,240,240);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    
    NSLog (@"DrawCircle open: %ld, closed: %ld", self.open, self.closed);
}

@end
