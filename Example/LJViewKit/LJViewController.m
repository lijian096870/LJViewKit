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

    AddViewDidRemoveKeyBlock(text, @"3.3_sdcd", ^(UIView *view, UIView *superView) {
        NSLog(@"AddViewWillRemoveKeyBlock3.3%@,%@2", view, superView);
    });

    AddViewWillRemoveKeyBlock(text, @"3.2_sfcds", ^(UIView *view, UIView *superView) {
        NSLog(@"AddViewWillRemoveKeyBlock3.2%@,%@2", view, superView);
    });

//    AddViewDidAddSubViewKeyBlock(text, @"3.3_sdcd", ^(UIView *view, UIView *superView) {
//        NSLog(@"AddViewDidAddSubViewKeyBlock%@,%@1", view, superView);
//    });
//
//    AddViewWillAddSubViewKeyBlock(text, @"3.2_sfcds", ^(UIView *view, UIView *superView) {
//        NSLog(@"AddViewWillAddSubViewKeyBlock%@,%@1", view, superView);
//    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view addSubview:text];

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
