//
//  XIActionSheetButtonItem.m
//  XIActionSheet
//
//  Created by YXLONG on 2017/5/17.
//  Copyright © 2017年 yxlong. All rights reserved.
//

#import "XIActionSheetButtonItem.h"
#import "XIActionSheet.h"
#import "XIBlurView.h"

@implementation XIActionSheetButtonItem

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        
        [self addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        _blurEnabled = YES;
        
        _backgroundView = [[XIBlurView alloc] initWithFrame:self.bounds];
        _backgroundView.userInteractionEnabled = NO;
        _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:_backgroundView];
    }
    return self;
}

- (void)setBlurEnabled:(BOOL)blurEnabled
{
    _blurEnabled = blurEnabled;
    
    if(_blurEnabled){
        [_backgroundView applyBlurEffect];
    }
    else{
        [_backgroundView disableBlurEffect];
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if(highlighted){
        if(_blurEnabled){
            _backgroundView.backgroundColor = [UIColor colorWithWhite:0.85 alpha:0.65];
            _backgroundView.blurView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        }
        else{
            _backgroundView.backgroundView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.99];
        }
    }
    else{
        if(_blurEnabled){
            _backgroundView.backgroundColor = [UIColor clearColor];
            _backgroundView.blurView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        }
        else{
            _backgroundView.backgroundView.backgroundColor = [UIColor whiteColor];
        }
    }
}

- (void)touchUpInside:(UIButton *)btn
{
    if(_actionHanlder){
        _actionHanlder(self.actionSheet, self);
    }
}

@end
