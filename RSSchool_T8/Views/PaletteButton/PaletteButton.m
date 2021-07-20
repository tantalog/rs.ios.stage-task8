#import "PaletteButton.h"
#import "UIButton+Highlighted.h"

@interface PaletteButton()

@end

@implementation PaletteButton

- (instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupColorButton:color];
    }
    return self;
}

- (void)setupColorButton:(UIColor *)color {
    UIButton *subViewOfColor = [[UIButton alloc] initWithFrame:CGRectMake(8, 8, 24, 24)];
    [subViewOfColor setDefaultColor:color];
    
    [self.layer setCornerRadius:10.0f];
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.layer setShadowRadius:1.0f];
    [self.layer setShadowOpacity:1.0f];
    [self.layer setShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:subViewOfColor];
    
    [subViewOfColor addTarget:self.delegate action:@selector(saveColorArray:) forControlEvents:UIControlEventTouchUpInside];
}

@end
