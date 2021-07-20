#import "AppDelegate.h"
#import "ArtistViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *rootViewController = [ArtistViewController new];
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    [self.window setRootViewController:navigationViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
