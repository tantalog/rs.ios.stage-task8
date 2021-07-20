#import <UIKit/UIKit.h>
#import "ArtistViewController.h"
#import "DrawingsDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView

@property (weak, nonatomic) ArtistViewController <DrawingsDelegate> *delegate;
@property (strong, nonatomic) NSMutableArray <UIButton *> *paletteButtonsArray;
@property (assign, nonatomic) NSNumber *currentDrawing;
@property (assign, nonatomic) float progress;

- (void)changeStrokeEnd;


@end

NS_ASSUME_NONNULL_END
