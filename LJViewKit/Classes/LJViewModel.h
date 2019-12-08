//
//  UIView+LJView.h
//  LJKit
//
//  Created by MacAir on 2018/5/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJViewKit.h"

typedef NS_ENUM(NSInteger, LJViewModelStyle) {
    LJViewModelNone,
    LJViewModelAdd,
    LJViewModelMove,
};


@interface LJViewModel : NSObject


@property(nonatomic,assign)LJViewModelStyle style;


@property(nonatomic, copy) viewFrameChangeBlock superWillChangeBlock;
@property(nonatomic, strong,readonly) NSArray     *_superWillChangeArray;

@property(nonatomic, copy) viewFrameChangeBlock superDidChangeBlock;
@property(nonatomic, strong,readonly) NSArray     *_superDidChangeArray;

@property(nonatomic, copy) viewFrameChangeBlock willChangeBlock;
@property(nonatomic, strong,readonly) NSArray     *_willChangeArray;

@property(nonatomic, copy) viewFrameChangeBlock didChangeBlock;
@property(nonatomic, strong,readonly) NSArray     *_didChangeArray;

@property(nonatomic, copy) viewWindowChangeBlock    willMoveBlock;
@property(nonatomic, strong,readonly) NSArray         *_willMoveArray;

@property(nonatomic, copy) viewWindowChangeBlock    didMoveBlock;
@property(nonatomic, strong,readonly) NSArray         *_didMoveArray;

@property(nonatomic, copy) viewWindowChangeBlock    willAddBlock;
@property(nonatomic, strong,readonly) NSArray         *_willAddArray;

@property(nonatomic, copy) viewWindowChangeBlock    didAddBlock;
@property(nonatomic, strong,readonly) NSArray         *_didAddArray;

- (void)SetFrameWillChangeBlock:(viewFrameChangeBlock)block;
- (void)AddFrameWillChangeBlock:(viewFrameChangeBlock)block;

- (void)SetFrameDidChangeBlock:(viewFrameChangeBlock)block;
- (void)AddFrameDidChangeBlock:(viewFrameChangeBlock)block;

- (void)SetWindowWillMoveBlock:(viewWindowChangeBlock)block;
- (void)AddWindowWillMoveBlock:(viewWindowChangeBlock)block;

- (void)SetWindowDidMoveBlock:(viewWindowChangeBlock)block;
- (void)AddWindowDidMoveBlock:(viewWindowChangeBlock)block;

- (void)SetWindowWillAddBlock:(viewWindowChangeBlock)block;
- (void)AddWindowWillAddBlock:(viewWindowChangeBlock)block;

- (void)SetWindowDidAddBlock:(viewWindowChangeBlock)block;
- (void)AddWindowDidAddBlock:(viewWindowChangeBlock)block;


- (void)AddWindowDidAddKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString*)key;
- (void)AddWindowDidMoveKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString*)key;
- (void)AddWindowWillAddKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString*)key;
- (void)AddWindowWillMoveKeyBlock:(viewWindowChangeBlock)block AndKey:(NSString*)key;
- (void)AddFrameDidChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString*)key;
- (void)AddFrameWillChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString*)key;



- (void)SetSuperViewFrameWillChangeBlock:(viewFrameChangeBlock)block;
- (void)AddSuperViewFrameWillChangeBlock:(viewFrameChangeBlock)block;
- (void)AddSuperViewFrameWillChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString*)key;
- (void)SetSuperViewFrameDidChangeBlock:(viewFrameChangeBlock)block;
- (void)AddSuperViewFrameDidChangeBlock:(viewFrameChangeBlock)block;
- (void)AddSuperViewFrameDidChangeKeyBlock:(viewFrameChangeBlock)block AndKey:(NSString*)key;






- (instancetype)initWithView:(UIView *)view AndWindow:(UIWindow *)window;

@end
