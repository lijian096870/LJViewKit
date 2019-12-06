//
//  UIView+LJView.m
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJViewModel.h"

@interface UIView ()

+ (void)methodFrameChangeBlock_MethodExchang;

+ (void)methodMoveChangeBlock_MethodExchange;

@end

@interface LJViewModel ()

@property(nonatomic, weak) UIView *view;

@end

@implementation LJViewModel

- (void)SetFrameWillChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        [UIView methodFrameChangeBlock_MethodExchang];
        self.willChangeBlock = block;
    }
}

- (void)AddFrameWillChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        [UIView methodFrameChangeBlock_MethodExchang];

        [self.willChangeArray addObject:block];
    }
}

- (void)SetFrameDidChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        [UIView methodFrameChangeBlock_MethodExchang];
        self.didChangeBlock = block;
    }
}

- (void)AddFrameDidChangeBlock:(viewFrameChangeBlock)block {
    if (block) {
        [UIView methodFrameChangeBlock_MethodExchang];
        [self.didChangeArray addObject:block];
    }
}

- (void)SetWindowWillMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        [UIView methodMoveChangeBlock_MethodExchange];
        self.willMoveBlock = block;
    }

    if ([self.view.window isKindOfClass:UIWindow.class]) {
        self.window = self.view.window;
    }
}

- (void)AddWindowWillMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        [UIView methodMoveChangeBlock_MethodExchange];
        [self.willMoveArray addObject:block];
    }

    if ([self.view.window isKindOfClass:UIWindow.class]) {
        self.window = self.view.window;
    }
}

- (void)SetWindowDidMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        [UIView methodMoveChangeBlock_MethodExchange];
        self.didMoveBlock = block;
    }

    if ([self.view.window isKindOfClass:UIWindow.class]) {
        self.window = self.view.window;
    }
}

- (void)AddWindowDidMoveBlock:(viewWindowChangeBlock)block {
    if (block) {
        [UIView methodMoveChangeBlock_MethodExchange];
        [self.didMoveArray addObject:block];
    }

    if ([self.view.window isKindOfClass:UIWindow.class]) {
        self.window = self.view.window;
    }
}

- (void)SetWindowWillAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        [UIView methodMoveChangeBlock_MethodExchange];
        self.willAddBlock = block;
    }

    if ([self.view.window isKindOfClass:UIWindow.class]) {
        self.window = self.view.window;
    }
}

- (void)AddWindowWillAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        [UIView methodMoveChangeBlock_MethodExchange];
        [self.willAddArray addObject:block];
    }

    if ([self.view.window isKindOfClass:UIWindow.class]) {
        self.window = self.view.window;
    }
}

- (void)SetWindowDidAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        [UIView methodMoveChangeBlock_MethodExchange];
        self.didAddBlock = block;
    }

    if ([self.view.window isKindOfClass:UIWindow.class]) {
        self.window = self.view.window;
    }
}

- (void)AddWindowDidAddBlock:(viewWindowChangeBlock)block {
    if (block) {
        [UIView methodMoveChangeBlock_MethodExchange];

        [self.didAddArray addObject:block];
    }

    if ([self.view.window isKindOfClass:UIWindow.class]) {
        self.window = self.view.window;
    }
}

- (instancetype)initWithView:(UIView *)view AndWindow:(UIWindow *)window
{
    self = [super init];

    if (self) {
        self.view = view;

        if ([window isKindOfClass:UIWindow.class]) {
            self.window = window;
        }
    }

    return self;
}

- (UIWindow *)window {
    if ([_window isKindOfClass:UIWindow.class]) {
        return _window;
    } else {
        return self.view.window;
    }
}

- (NSMutableArray *)willChangeArray {
    if (_willChangeArray == nil) {
        _willChangeArray = [NSMutableArray array];
    }

    return _willChangeArray;
}

- (NSMutableArray *)didChangeArray {
    if (_didChangeArray == nil) {
        _didChangeArray = [NSMutableArray array];
    }

    return _didChangeArray;
}

- (NSMutableArray *)didMoveArray {
    if (_didMoveArray == nil) {
        _didMoveArray = [NSMutableArray array];
    }

    return _didMoveArray;
}

- (NSMutableArray *)willMoveArray {
    if (_willMoveArray == nil) {
        _willMoveArray = [NSMutableArray array];
    }

    return _willMoveArray;
}

- (NSMutableArray *)willAddArray {
    if (_willAddArray == nil) {
        _willAddArray = [NSMutableArray array];
    }

    return _willAddArray;
}

- (NSMutableArray *)didAddArray {
    if (_didAddArray == nil) {
        _didAddArray = [NSMutableArray array];
    }

    return _didAddArray;
}

@end
