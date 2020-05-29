//
//  ViewController.m
//  11111
//
//  Created by 成焱 on 2020/5/21.
//  Copyright © 2020 cheng.yan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import <yoga/yoga.h>
#import <YogaKit/UIView+Yoga.h>

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scollerView;
@property (nonatomic, strong) UIView *container;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
    
    

    
    // Do any additional setup after loading the view.
}

- (void) test1 {

    //    self.container = [UIView new];
    ////    self.container.backgroundColor = [UIColor blueColor];
    //    [self.view addSubview:self.container];
        
        UIView *redView = [UIView new];
        redView.backgroundColor = [UIColor redColor];
        [self.view addSubview:redView];
        
        UIView *yellowView = [UIView new];
        yellowView.backgroundColor = [UIColor yellowColor];
        [redView addSubview:yellowView];
        
        [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.justifyContent = YGJustifyCenter;
            layout.alignItems = YGAlignCenter;
        }];
        
    //    [self.container configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
    //        layout.isEnabled = YES;
    //        layout.justifyContent = YGJustifyCenter;
    //        layout.alignItems = YGAlignCenter;
    //    }];
        
        [redView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width=YGPointValue(100);
            layout.height=YGPointValue(100);
        }];
        
        [yellowView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.marginVertical = YGPointValue(2);
            layout.flexGrow = 1.0;
        }];
        
        [self.view.yoga applyLayoutPreservingOrigin:YES];
}

- (void) test2 {
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.justifyContent = YGJustifyCenter;
        layout.alignItems = YGAlignCenter;
        layout.flexWrap = YGWrapWrap;
        layout.width = YGPointValue([UIScreen mainScreen].bounds.size.width);
    }];
//
    UIView *box = [[UIView alloc] initWithFrame:CGRectZero];
    box.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:box];
    
//    [box mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.offset([UIScreen mainScreen].bounds.size.width);
//        make.center.offset(0);
//        make.height.offset(100);
//    }];
    [box configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.justifyContent = YGJustifyCenter;
        layout.alignItems = YGAlignCenter;
        layout.width = YGPointValue([UIScreen mainScreen].bounds.size.width);
    }];
    
    UIView *container = [UIView new];
    container.backgroundColor = [UIColor redColor];
    [box addSubview:container];

    [container configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.justifyContent = YGAlignSpaceAround;
        layout.flexWrap = YGWrapWrap;
        layout.alignItems =YGAlignFlexStart;
//        layout.direction = YGFlexDirectionColumn;
        layout.flexDirection = YGFlexDirectionRow;
        layout.margin = YGPointValue(5);
//        layout.direction = YGFlexDirectionRowReverse;
//        layout.flexGrow = 0.6;
//        layout.flexBasis = YGPointValue(100);
        layout.width = YGPercentValue(100);
//        layout.height = YGPointValue(20);
        
    }];
    
    
    for (int i = 0; i < 6; i++) {
        UILabel *lbl = [UILabel new];
        if (i == 4) {
            lbl.text = [NSString stringWithFormat:@"该商铺苹果商品已售罄%@",@(i)];
        }
        else{
            lbl.text = [NSString stringWithFormat:@"限购%@件",@(i)];
        }
//        lbl.text = [NSString stringWithFormat:@"=====%@",@(i)];
        lbl.textColor = [UIColor whiteColor];
        lbl.backgroundColor = [UIColor blackColor];
        [container addSubview:lbl];
        
        [lbl configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.margin = YGPointValue(5);
//            if (i == 4) {
//                layout.flexShrink = 1;
//            }
//            layout.justifyContent = YGJustifyFlexStart;
//            layout.alignItems = YGAlignCenter;
//            layout.flexWrap = YGWrapNoWrap;
            
        }];
        
    }
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//    });
    [self.view.yoga applyLayoutPreservingOrigin:YES];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [box.yoga applyLayoutPreservingOrigin:YES];
//    });
    
    
    
}


@end
