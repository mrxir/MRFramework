//
//  RootViewController.m
//  MRFramework
//
//  Created by MrXir on 2017/6/28.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "RootViewController.h"

#import "UIControl+Extension.h"

#import "UIStoryboard+Extension.h"

#import "NSDictionary+Extension.h"

#import "NSJSONSerialization+Extension.h"

@interface RootViewController ()

@property (nonatomic, weak) IBOutlet UIButton *pushButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.pushButton handleWithEvents:UIControlEventTouchUpInside completion:^(__kindof UIControl *control) {
        
        
        // use this method, you don't need to care which storyboard has owned which controller
        UIViewController *demo = [UIStoryboard matchControllerForIdentifier:@"DEMO"];
        
        demo.title = @"Demo";
        
        [self.navigationController pushViewController:demo animated:YES];
        
    }];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSDictionary *info = @{@"userId": @"mrxir",
                           @"password": @"123456",
                           @"e-mail": @"100885521@qq.com",
                           @"stars": @{@"John": @"26",
                                       @"Danny": @"22",
                                       @"Nano": @"38"}};
    
    NSLog(@"Form %@", info.formattedIntoFormStyleString);
    
    NSLog(@"Json %@", [NSJSONSerialization stringWithJSONObject:info options:0 error:nil]);
    
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
