//
//  CanvasView.m
//  RSSchool_T8
//
//  Created by Anton Kushnerov on 16.07.21.
//

#import "CanvasView.h"

@implementation CanvasView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
}

- (void)configure {

    self.backgroundColor = [UIColor greenColor];
    self.layer.shadowRadius  = 1.5f;
    self.layer.shadowColor   = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
    self.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
    self.layer.shadowOpacity = 0.9f;
    self.layer.masksToBounds = NO;

    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(self.bounds, shadowInsets)];
    self.layer.shadowPath    = shadowPath.CGPath;
    
}

@end
