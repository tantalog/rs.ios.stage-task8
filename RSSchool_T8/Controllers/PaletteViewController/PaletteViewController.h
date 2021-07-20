#import <UIKit/UIKit.h>
#import "ColorDelegate.h"
#import "AppendingViewController.h"
#import "CanvasView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaletteViewController : AppendingViewController <ColorDelegate>

@property (strong, nonatomic) CanvasView *mainPaintView;

@end

NS_ASSUME_NONNULL_END
