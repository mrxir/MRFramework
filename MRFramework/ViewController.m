//
//  ViewController.m
//  MRFramework
//
//  Created by MrXir on 2017/7/10.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "ViewController.h"

#import "UIControl+Extension.h"

#import "UIStoryboard+Extension.h"

#import "UIApplication+Extension.h"

#import "UIView+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.pushButton handleWithEvents:UIControlEventTouchUpInside completion:^(__kindof UIControl *control) {
        
        ViewController *vc = [UIStoryboard matchControllerForIdentifier:@"DEMO"];
        vc.mode = 1;
        [self.navigationController pushViewController:vc animated:YES];
       
        
    }];
    
    [self.presentButton handleWithEvents:UIControlEventTouchUpInside completion:^(__kindof UIControl *control) {
        
        ViewController *vc = [UIStoryboard matchControllerForIdentifier:@"DEMO"];
        vc.mode = 2;
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        UITabBarController *tc = [[UITabBarController alloc] init];
        tc.viewControllers = @[nc];
        [self presentViewController:tc animated:YES completion:NULL];
        
    }];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TITLE"
                                                    message:@"MESSAGE"
                                                   delegate:nil
                                          cancelButtonTitle:@"CANCEL"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIViewController *root = [UIApplication sharedApplication].rootWindowTopViewController;
    root.title = @"ROOTDISPLAYING";
    
    UILabel *label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
    label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
    label.textColor = [UIColor darkGrayColor];
    label.text = [NSString stringWithFormat:@"You found me %@", root];
    label.textAlignment = NSTextAlignmentCenter;
    [root.view addSubview:label];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
