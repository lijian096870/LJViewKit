//
//  LJViewController.m
//  LJViewKit
//
//  Created by 1358756992@qq.com on 08/19/2019.
//  Copyright (c) 2019 1358756992@qq.com. All rights reserved.
//

#import "LJViewController.h"
#import "LJViewKit.h"
@interface LJViewController ()

@end

@implementation LJViewController

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    
   
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [text removeFromSuperview];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.view addSubview:text];
        });
        
    });
    
    
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
