#import <UIKit/UIKit.h>
#import "ColorDelegate.h"
#import "PaletteViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaletteButton : UIButton

@property (weak, nonatomic) PaletteViewController <ColorDelegate> *delegate;

- (instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
