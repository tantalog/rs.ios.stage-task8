#import <UIKit/UIKit.h>
#import "DrawingsDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistViewController : UIViewController <DrawingsDelegate>

@property (strong, nonatomic) UIButton *drawButton;

@end

NS_ASSUME_NONNULL_END
