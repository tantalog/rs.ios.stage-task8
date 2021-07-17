//
//  ViewController.m
//  RSSchool_T8
//
//  Created by Anton Kushnerov on 15.07.21.
//

#import "ViewController.h"
#import "CanvasView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *navigationButton;
@property (weak, nonatomic) IBOutlet CanvasView *canvasView;
@property (weak, nonatomic) IBOutlet UIButton *openPaletteButton;
@property (weak, nonatomic) IBOutlet UIButton *openTimerButton;
@property (weak, nonatomic) IBOutlet UIButton *drawButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)openPaletteTapped:(id)sender {
}
- (IBAction)openTimerTapped:(id)sender {
}
- (IBAction)drawTapped:(id)sender {
}
- (IBAction)shareTapped:(id)sender {
}

- (void) configureUI {
    self.canvasView.layer.cornerRadius = 20;
    
}


@end
