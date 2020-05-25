//
//  NSObject+CustomerDealloc.m
//  FBSnapshotTestCase
//
//  Created by temp on 2020/5/25.
//

#import "NSObject+CustomerDealloc.h"
#import <objc/runtime.h>

@implementation NSObject (CustomerDealloc)

+ (void)registerCustomerDeallocArrayObject:(NSObject *)object block:(customerDeallocBlock)block {
    if ([object isKindOfClass:NSObject.class] && block) {
        [self methodCustomerDealloc_MethodExchang];
        NSMutableArray *array = [object LJCustomerDeallocClass_blockArray];
        [array addObject:block];
    }
}

+ (void)registerCustomerDeallocOnceObject:(NSObject *)object block:(customerDeallocBlock)block {
    if ([object isKindOfClass:NSObject.class] && block) {
        [self methodCustomerDealloc_MethodExchang];
        NSMutableArray *array = [object LJCustomerDeallocClass_blockOnce];
        [array removeAllObjects];
        [array addObject:block];
    }
}

+ (void)methodCustomerDealloc_MethodExchang {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        if (objc_getClass("LJCustomerDeallocClass")) {} else {
            objc_allocateClassPair([NSObject class], "LJCustomerDeallocClass", 0);
            SEL sel = sel_registerName("dealloc_customerDealloc_LJView");
            SEL NewSel = sel_registerName("dealloc");

            Method originalMethod = class_getInstanceMethod(NSObject.class, sel);
            Method swizzlingMethod = class_getInstanceMethod(NSObject.class, NewSel);
            method_exchangeImplementations(originalMethod, swizzlingMethod);
        }
    });
}

- (NSMutableArray *)LJCustomerDeallocClass_blockArray_OptionOnce {
    return objc_getAssociatedObject(self, @selector(LJCustomerDeallocClass_blockArray_OptionOnce));
}

- (NSMutableArray *)LJCustomerDeallocClass_blockOnce;
{
    NSMutableArray *obj = [self LJCustomerDeallocClass_blockArray_OptionOnce];

    if ([obj isKindOfClass:[NSMutableArray class]]) {
        return obj;
    } else {
        NSMutableArray *array = [NSMutableArray array];
        objc_setAssociatedObject(self, @selector(LJCustomerDeallocClass_blockArray_OptionOnce), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return array;
    }
}

- (NSMutableArray *)LJCustomerDeallocClass_blockArray_OptionArray {
    return objc_getAssociatedObject(self, @selector(LJCustomerDeallocClass_blockArray_OptionArray));
}

- (NSMutableArray *)LJCustomerDeallocClass_blockArray;
{
    NSMutableArray *obj = [self LJCustomerDeallocClass_blockArray_OptionArray];

    if ([obj isKindOfClass:[NSMutableArray class]]) {
        return obj;
    } else {
        NSMutableArray *array = [NSMutableArray array];
        objc_setAssociatedObject(self, @selector(LJCustomerDeallocClass_blockArray_OptionArray), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return array;
    }
}

- (void)dealloc_customerDealloc_LJView {
    {
        NSMutableArray *array = [self LJCustomerDeallocClass_blockArray_OptionArray];

        if (array) {
            for (customerDeallocBlock blcok in array) {
                if (blcok) {
                    blcok(self);
                }
            }

            [array removeAllObjects];
        }
    }
    {
        NSMutableArray *array = [self LJCustomerDeallocClass_blockArray_OptionOnce];

        if (array) {
            for (customerDeallocBlock blcok in array) {
                if (blcok) {
                    blcok(self);
                }
            }

            [array removeAllObjects];
        }
    }

    [self dealloc_customerDealloc_LJView];
}

@end
