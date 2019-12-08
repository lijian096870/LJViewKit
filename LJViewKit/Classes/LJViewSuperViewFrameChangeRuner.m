//
//  LJViewSuperViewFrameChangeRuner.m
//  FBSnapshotTestCase
//
//  Created by lijian on 2019/12/8.
//

#import "LJViewSuperViewFrameChangeRuner.h"
#import "UIView+LJView.h"
#import "LJViewModel.h"

@implementation LJViewSuperViewFrameChangeRuner


+(void)viewWillChange:(UIView*)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame{
    
    [self viewWillChangeloop:view AndOldFrame:oldframe AndNewFrame:NewFrame andSuperView:view];
    
}

+(void)viewWillChangeloop:(UIView*)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame andSuperView:(UIView*)superView{
    
    LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];
    
    if ([model isKindOfClass:LJViewModel.class]) {
        
        if(model.superWillChangeBlock){
            model.superWillChangeBlock(view, superView, oldframe, NewFrame);
        }
        
        for (viewSuperFrameChangeBlock Block in model._superWillChangeArray) {
            if(Block){
                Block(view, superView, oldframe, NewFrame);
            }
        }
        
    }
    
    NSArray *array = [NSArray arrayWithArray:view.subviews];
    for (UIView *subView in array) {
        
        [self viewWillChangeloop:subView AndOldFrame:oldframe AndNewFrame:NewFrame andSuperView:subView];
        
    }
    
    
}

+(void)viewDidChange:(UIView*)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame{
    
    [self viewDidChangeLoop:view AndOldFrame:oldframe AndNewFrame:NewFrame andSuperView:view];
    
}

+(void)viewDidChangeLoop:(UIView*)view AndOldFrame:(CGRect)oldframe AndNewFrame:(CGRect)NewFrame andSuperView:(UIView*)superView{
 
    LJViewModel *model = [view viewFrameChangeMoveWindowChangeModelMayBenil];
    
    if ([model isKindOfClass:LJViewModel.class]) {
        
        if(model.superDidChangeBlock){
            model.superDidChangeBlock(view, superView, oldframe, NewFrame);
        }
        
        for (viewSuperFrameChangeBlock Block in model._superDidChangeArray) {
            if(Block){
                Block(view, superView, oldframe, NewFrame);
            }
        }
    }
    
    NSArray *array = [NSArray arrayWithArray:view.subviews];
    for (UIView *subView in array) {
        
        [self viewDidChangeLoop:subView AndOldFrame:oldframe AndNewFrame:NewFrame andSuperView:subView];
        
    }
    
}

@end