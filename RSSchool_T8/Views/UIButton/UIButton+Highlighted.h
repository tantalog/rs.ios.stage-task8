#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Highlighted)

- (void)setHighlighted;
- (void)setHighlightedColorButton;
- (void)setDefault;
- (void)setDefaultColor:(UIColor *)color;
- (void)setDisabled;

@end

NS_ASSUME_NONNULL_END
