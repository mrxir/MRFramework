//
//  ViewController.h
//  MRFramework
//
//  Created by MrXir on 2017/7/10.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, assign) int mode;

@property (weak, nonatomic) IBOutlet UILabel *imLabel;

@property (weak, nonatomic) IBOutlet UIButton *pushButton;

@property (weak, nonatomic) IBOutlet UIButton *presentButton;

@end
