#import "ArtistViewController.h"
#import "UIButton+Highlighted.h"
#import "CanvasView.h"
#import "PaletteViewController.h"
#import "RSSchool_T8-Swift.h"


@interface ArtistViewController ()

@property (strong, nonatomic) PaletteViewController *paletteViewController;
@property (strong, nonatomic) CanvasView *canvasView;
@property (strong, nonatomic) TimerViewController *timerViewController;
@property (strong, nonatomic) DrawingsViewController *drawingsViewController;

@property (strong, nonatomic) UIButton *paletteButton;
@property (strong, nonatomic) UIButton *timerButton;
@property (strong, nonatomic) UIButton *shareButton;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setTintColor:[UIColor colorNamed:@"emerald"]];
    self.drawingsViewController = [DrawingsViewController new];
    self.paletteViewController = [PaletteViewController new];
    self.timerViewController = [TimerViewController new];
    [self setup];
}

- (void)setup {
    [self configureNavigationBar];
    [self configureButtons];
    
    self.canvasView = [[CanvasView alloc] initWithFrame:CGRectMake(38, 104, 300, 300)];
    self.paletteViewController.mainPaintView = self.canvasView;
    self.timerViewController.mainPaintView = self.canvasView;
    self.drawingsViewController.canvasView = self.canvasView;
    self.drawingsViewController.delegate = self;
    self.canvasView.delegate = self;
    [self.view addSubview:self.canvasView];
    
}

- (void)configureNavigationBar {
    self.navigationItem.title = @"Artist";
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f]
    }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(accessDrawings:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorNamed:@"emerald"];
}

- (void)configureButtons {
    self.paletteButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 452, 163, 32)];
    self.drawButton = [[UIButton alloc] initWithFrame:CGRectMake(243, 452, 91, 32)];
    self.timerButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 504, 151, 32)];
    self.shareButton = [[UIButton alloc] initWithFrame:CGRectMake(239, 504, 95, 32)];
    
    [self.paletteButton setDefault];
    [self.timerButton setDefault];
    [self.drawButton setDisabled];
    [self.shareButton setDisabled];
    
    [self.paletteButton.layer setCornerRadius:10];
    [self.drawButton.layer setCornerRadius:10];
    [self.timerButton.layer setCornerRadius:10];
    [self.shareButton.layer setCornerRadius:10];
    
    [self.paletteButton setTitle:@"Open Palette" forState:UIControlStateNormal];
    [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
    [self.timerButton setTitle:@"Timer" forState:UIControlStateNormal];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    
    [self.paletteButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.drawButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.timerButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.shareButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    
    [self.paletteButton setTitleColor:[UIColor colorNamed:@"emerald"] forState:UIControlStateNormal];
    [self.drawButton setTitleColor:[UIColor colorNamed:@"emerald"] forState:UIControlStateNormal];
    [self.timerButton setTitleColor:[UIColor colorNamed:@"emerald"] forState:UIControlStateNormal];
    [self.shareButton setTitleColor:[UIColor colorNamed:@"emerald"] forState:UIControlStateNormal];
    
    [self.paletteButton addTarget:self action:@selector(openPalette:) forControlEvents:UIControlEventTouchUpInside];
    [self.drawButton addTarget:self action:@selector(drawPainting:) forControlEvents:UIControlEventTouchUpInside];
    [self.timerButton addTarget:self action:@selector(openTimer:) forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:self action:@selector(sharePainting:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.paletteButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.drawButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.timerButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.shareButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:self.paletteButton];
    [self.view addSubview:self.drawButton];
    [self.view addSubview:self.timerButton];
    [self.view addSubview:self.shareButton];
}

- (void)addContentController:(UIViewController *)content {
    [self addChildViewController:content];
    [self.view addSubview:content.view];
    content.view.frame = self.paletteViewController.view.frame;
    [content didMoveToParentViewController:self];
}

- (void)accessDrawings:(id)sender {
    [self.navigationController pushViewController:self.drawingsViewController animated:YES];
}

- (void)openPalette:(UIButton *)sender {
    [self addContentController:self.paletteViewController];
    [sender setDefault];
}

- (void)drawPainting:(UIButton *)sender {
    [sender setDefault];
    [self.canvasView setNeedsDisplay];
}

- (void)changeToResetButton:(BOOL)check {
    if (check) {
        [self.drawButton setTitle:@"Reset" forState:UIControlStateNormal];
        [self.drawButton addTarget:self action:@selector(resetDrawing) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
        [self.drawButton removeTarget:self action:@selector(resetDrawing) forControlEvents:UIControlEventTouchUpInside];
        [self.drawButton addTarget:self action:@selector(drawPainting:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)openTimer:(UIButton *)sender {
    [self addContentController:self.timerViewController];
    [sender setDefault];
}

- (void)sharePainting:(UIButton *)sender {
    [sender setDefault];
    [self share:sender];
}

- (void)touchDown:(UIButton *)sender {
    [sender setHighlighted];
}

- (void)share:(UIButton *)sender {
    CGRect rect = [self.canvasView bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.canvasView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSArray *activityItems = @[img];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    activityViewControntroller.popoverPresentationController.sourceView = self.view;
    activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/4, 0, 0);
    [self presentViewController:activityViewControntroller animated:YES completion:nil];
}

- (void)isDrawing:(BOOL)check {
    float timeIntervalForProgress = 1.0/60.0;
    NSTimer *timerForProgress = [NSTimer scheduledTimerWithTimeInterval:timeIntervalForProgress
                                                                 target:self.canvasView
                                                               selector:@selector(changeStrokeEnd)
                                                               userInfo:nil
                                                                repeats:true];
    if (check) {
        [self.paletteButton setDisabled];
        [self changeToResetButton:YES];
        [self.timerButton setDisabled];
        [self.shareButton setDefault];
        [self.navigationController.navigationBar setUserInteractionEnabled:NO];
        self.navigationController.navigationBar.alpha = 0.5;
    } else {
        [timerForProgress invalidate];
        [self.paletteButton setDefault];
        [self changeToResetButton:NO];
        [self.timerButton setDefault];
        [self.navigationController.navigationBar setUserInteractionEnabled:YES];
        self.navigationController.navigationBar.alpha = 1;
    }
}

- (void)resetDrawing {
    self.canvasView.currentDrawing = @0;
    [self.drawingsViewController setAllButtonsDefault];
    [self isDrawing:NO];
    [self.shareButton setDisabled];
    [self.drawButton setDisabled];
}

@end
