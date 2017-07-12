//
//  RootViewController.m
//  MRFramework
//
//  Created by MrXir on 2017/7/12.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "RootViewController.h"

#import "UIImage+Extension.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard *storyboardNamedMRUIKit = [UIStoryboard storyboardWithName:@"MRUIKit" bundle:nil];
    UINavigationController *navigationWithMRUIKit = [storyboardNamedMRUIKit instantiateInitialViewController];
    
    UIStoryboard *storyboardNamedMRFoundation = [UIStoryboard storyboardWithName:@"MRFoundation" bundle:nil];
    UINavigationController *navigationWithMRFoundation = [storyboardNamedMRFoundation instantiateInitialViewController];
    
    [self setViewControllers:@[navigationWithMRUIKit, navigationWithMRFoundation]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITabBarItem *)item:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag
{
    return [[UITabBarItem alloc] initWithTitle:title image:image tag:tag];
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    [super setViewControllers:viewControllers];
    
    [viewControllers enumerateObjectsUsingBlock:^(__kindof UINavigationController * _Nonnull nc, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *vc = nc.viewControllers.firstObject;
        
        NSString *title = [NSStringFromClass(vc.class) stringByReplacingOccurrencesOfString:@"Controller"
                                                                                 withString:@""];
        
        NSString *titleForTab = [title stringByReplacingOccurrencesOfString:@"API_MR" withString:@""];
        
        UIImage *imageForTab = [UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(28, 28)];
        
        vc.navigationItem.title = title;
        
        if (idx % 2 == 0) {
            imageForTab = [UIImage resizableImageWithColor:[UIColor whiteColor] cornerRadius:14];
        }
        
        vc.tabBarItem = [self item:titleForTab image:imageForTab tag:idx];
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
