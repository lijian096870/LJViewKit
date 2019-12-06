//
//  UIView+LJView.m
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "UIView+LJView.h"
#import <objc/runtime.h>
#import "LJViewModel.h"

#if defined(DEBUG) && !defined(NDEBUG)
  #define ol_keywordify autoreleasepool {}
#else
  #define ol_keywordify try {} @catch(...) {}

#endif

#define metamacro_concat(A, B) A ## B

#define weakify(_arg_) \
    ol_keywordify      \
    __weak typeof(_arg_) metamacro_concat(weak, _arg_) = _arg_;

#define strongifyAndReturnIfNil(_arg_)                                                    \
    ol_keywordify                                                                         \
    __strong typeof(metamacro_concat(weak, _arg_)) _arg_ = metamacro_concat(weak, _arg_); \
    if (!_arg_) return

@implementation UIView (LJView)

+ (void)methodFrameChangeBlock_MethodExchang {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        SEL sel = sel_registerName("setFrame:");

        SEL NewSel = sel_registerName("LJView_customer_setFrame:");

        Method originalMethod = class_getInstanceMethod(UIView.class, sel);
        Method swizzlingMethod = class_getInstanceMethod(UIView.class, NewSel);

        method_exchangeImplementations(originalMethod, swizzlingMethod);
    });
}

+ (void)methodMoveChangeBlock_MethodExchange {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("willMoveToWindow:");

            SEL NewSel = sel_registerName("LJView_customer_willMoveToWindow:");

            Method originalMethod = class_getInstanceMethod(UIView.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UIView.class, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL sel = sel_registerName("didMoveToWindow");

            SEL NewSel = sel_registerName("LJView_customer_didMoveToWindow");

            Method originalMethod = class_getInstanceMethod(UIView.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(UIView.class, NewSel);

            method_exchangeImplementations(originalMethod, swizzlingMethod);
        });
    }
}

- (void)LJView_customer_willMoveToWindow:(nullable UIWindow *)newWindow {
    LJViewModel *model = [self viewFrameChangeMoveWindowChangeModelMayBenil];

    if ([model isKindOfClass:LJViewModel.class]) {
        if ([newWindow isKindOfClass:UIWindow.class]) {
            model.window = newWindow;

            if (model.willAddBlock) {
                model.willAddBlock(self, newWindow);
            }

            for (viewWindowChangeBlock block in model.willAddArray) {
                if (block) {
                    block(self, newWindow);
                }
            }
        } else {
            UIWindow *window = self.window;

            if ([window isKindOfClass:UIWindow.class]) {
                model.window = window;

                if (model.willMoveBlock) {
                    model.willMoveBlock(self, window);
                }

                for (viewWindowChangeBlock block in model.willMoveArray) {
                    if (block) {
                        block(self, window);
                    }
                }
            }
        }
    }

    [self LJView_customer_willMoveToWindow:newWindow];
}

- (void)LJView_customer_didMoveToWindow {
    [self LJView_customer_didMoveToWindow];

    LJViewModel *model = [self viewFrameChangeMoveWindowChangeModelMayBenil];

    if ([model isKindOfClass:LJViewModel.class]) {
        UIWindow *window = self.window;

        if ([window isKindOfClass:UIWindow.class]) {
            model.window = window;

            if (model.didAddBlock) {
                model.didAddBlock(self, window);
            }

            for (viewWindowChangeBlock block in model.didAddArray) {
                if (block) {
                    block(self, window);
                }
            }
        } else {
            if (model.didMoveBlock) {
                model.didMoveBlock(self, model.window);
            }

            for (viewWindowChangeBlock block in model.didMoveArray) {
                if (block) {
                    block(self, model.window);
                }
            }
        }
    }
}

- (void)LJView_customer_setFrame:(CGRect)frame {
    CGRect oldFrame = self.frame;

    if (CGRectEqualToRect(oldFrame, frame)) {
        [self LJView_customer_setFrame:frame];
    } else {
        LJViewModel *model = [self viewFrameChangeMoveWindowChangeModelMayBenil];

        if ([model isKindOfClass:LJViewModel.class]) {
            if (model.willChangeBlock) {
                model.willChangeBlock(self, oldFrame, frame);
            }

            for (viewFrameChangeBlock block in model.willChangeArray) {
                block(self, oldFrame, frame);
            }

            [self LJView_customer_setFrame:frame];

            if (model.didChangeBlock) {
                model.didChangeBlock(self, oldFrame, frame);
            }

            for (viewFrameChangeBlock block in model.didChangeArray) {
                block(self, oldFrame, frame);
            }
        } else {
            [self LJView_customer_setFrame:frame];
        }
    }
}

- (LJViewModel *)viewFrameChangeMoveWindowChangeModelMayBenil {
    return objc_getAssociatedObject(self, @selector(viewFrameChangeMoveWindowChangeModel));
}

- (LJViewModel *)viewFrameChangeMoveWindowChangeModel
{
    LJViewModel *obj = objc_getAssociatedObject(self, @selector(viewFrameChangeMoveWindowChangeModel));

    if ([obj isKindOfClass:[LJViewModel class]]) {
        return obj;
    } else {
        LJViewModel *mess = [[LJViewModel alloc]initWithView:self AndWindow:self.window];
        objc_setAssociatedObject(self, @selector(viewFrameChangeMoveWindowChangeModel), mess, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return mess;
    }
}

@end
