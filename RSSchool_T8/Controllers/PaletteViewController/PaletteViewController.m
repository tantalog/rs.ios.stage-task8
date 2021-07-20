#import "PaletteViewController.h"
#import "PaletteButton.h"
#import "UIButton+Highlighted.h"

@interface PaletteViewController ()

@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupColor];
}

- (void)setupColor {
    PaletteButton *red = [[PaletteButton alloc] initWithFrame:CGRectMake(17, 92, 40, 40) andColor:[UIColor colorNamed:@"customRed"]];
    red.delegate = self;
    
    PaletteButton *blue = [[PaletteButton alloc] initWithFrame:CGRectMake(77, 92, 40, 40) andColor:[UIColor colorNamed:@"customPurple"]];
    blue.delegate = self;
    
    PaletteButton *green = [[PaletteButton alloc] initWithFrame:CGRectMake(137, 92, 40, 40) andColor:[UIColor colorNamed:@"customGreen"]];
    green.delegate = self;
    
    PaletteButton *grey = [[PaletteButton alloc] initWithFrame:CGRectMake(197, 92, 40, 40) andColor:[UIColor colorNamed:@"customGray"]];
    grey.delegate = self;
    
    PaletteButton *purple = [[PaletteButton alloc] initWithFrame:CGRectMake(257, 92, 40, 40) andColor:[UIColor colorNamed:@"customLightPurple"]];
    purple.delegate = self;
    
    PaletteButton *orange = [[PaletteButton alloc] initWithFrame:CGRectMake(317, 92, 40, 40) andColor:[UIColor colorNamed:@"customPeach"]];
    orange.delegate = self;
    
    PaletteButton *yellow = [[PaletteButton alloc] initWithFrame:CGRectMake(17, 152, 40, 40) andColor:[UIColor colorNamed:@"customOrange"]];
    yellow.delegate = self;
    
    PaletteButton *lightBlue = [[PaletteButton alloc] initWithFrame:CGRectMake(77, 152, 40, 40) andColor:[UIColor colorNamed:@"customLightBlue"]];
    lightBlue.delegate = self;
    
    PaletteButton *pink = [[PaletteButton alloc] initWithFrame:CGRectMake(137, 152, 40, 40) andColor:[UIColor colorNamed:@"customPink"]];
    pink.delegate = self;
    
    PaletteButton *black = [[PaletteButton alloc] initWithFrame:CGRectMake(197, 152, 40, 40) andColor:[UIColor colorNamed:@"customBlack"]];
    black.delegate = self;
    
    PaletteButton *darkGreen = [[PaletteButton alloc] initWithFrame:CGRectMake(257, 152, 40, 40) andColor:[UIColor colorNamed:@"customDarkGreen"]];
    darkGreen.delegate = self;
    
    PaletteButton *brown = [[PaletteButton alloc] initWithFrame:CGRectMake(317, 152, 40, 40) andColor:[UIColor colorNamed:@"customBrown"]];
    brown.delegate = self;
    
    [self.view addSubview:red];
    [self.view addSubview:blue];
    [self.view addSubview:green];
    [self.view addSubview:grey];
    [self.view addSubview:purple];
    [self.view addSubview:orange];
    [self.view addSubview:yellow];
    [self.view addSubview:lightBlue];
    [self.view addSubview:pink];
    [self.view addSubview:black];
    [self.view addSubview:darkGreen];
    [self.view addSubview:brown];
}

- (void)saveColorArray:(UIButton *)sender {
    if ([self.mainPaintView.paletteButtonsArray containsObject:sender]) {
        [sender setDefaultColor:sender.backgroundColor];
        [self.mainPaintView.paletteButtonsArray removeObject:sender];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    } else {
        [sender setHighlightedColorButton];
        [self.mainPaintView.paletteButtonsArray addObject:sender];
        
        if (self.mainPaintView.paletteButtonsArray.count == 4) {
            [self.mainPaintView.paletteButtonsArray.firstObject setDefaultColor:self.mainPaintView.paletteButtonsArray.firstObject.backgroundColor];
            [self.mainPaintView.paletteButtonsArray removeObject:self.mainPaintView.paletteButtonsArray.firstObject];
        }
        [self.view setBackgroundColor:sender.backgroundColor];
    }
}


@end
