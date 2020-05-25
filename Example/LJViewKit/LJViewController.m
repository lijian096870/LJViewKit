//
//  LJViewController.m
//  LJViewKit
//
//  Created by 1358756992@qq.com on 08/19/2019.
//  Copyright (c) 2019 1358756992@qq.com. All rights reserved.
//

#import "LJViewController.h"
#import "LJViewKit.h"
#import "LJTextField.h"
@interface LJViewController ()

@end

@implementation LJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    

    UITextField *text = [[LJTextField alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];

    viewAddFrameChangeBlock(text, ^(UIView *view, CGRect oldFrame, CGRect newFrame) {
       
        NSLog(@"%@,%@",NSStringFromCGRect(oldFrame),NSStringFromCGRect(newFrame));
        
    });
    objectAddObjectDeallocBlock(text, ^(NSObject *object) {
       
        NSLog(@"2222222222");
        
    });
    
    
    [self.view addSubview:text];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        text.frame = CGRectMake(200, 200, 300, 300);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [text removeFromSuperview];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
