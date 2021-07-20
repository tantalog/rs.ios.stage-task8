#import "AppendingViewController.h"
#import "UIButton+Highlighted.h"

@interface AppendingViewController ()

@end

@implementation AppendingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAppendingBottomView];
}

- (void)setupAppendingBottomView {
    [self.view setFrame:CGRectMake(0, 333, 375, 370)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view.layer setShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor];
    [self.view.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.view.layer setShadowOpacity:1.0f];
    [self.view.layer setShadowRadius:4.0f];
    self.view.layer.cornerRadius = 35;
    [self setupButton];
}

- (void)setupButton {
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(250, 20, 85, 32)];
    self.saveButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 85, 32)];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:[UIColor colorNamed:@"emerald"] forState:UIControlStateNormal];
    [self.saveButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    
    [self.saveButton.layer setCornerRadius:10.0f];
    [self.saveButton setDefault];
    [buttonView addSubview:self.saveButton];
    
    [self.saveButton addTarget:self action:@selector(saveColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.saveButton addTarget:self action:@selector(touchDownSave:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:buttonView];
}

- (void)saveColor:(UIButton *)sender {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    [sender setDefault];
}

- (void)touchDownSave:(UIButton *)sender {
    [sender setHighlighted];
}

@end
