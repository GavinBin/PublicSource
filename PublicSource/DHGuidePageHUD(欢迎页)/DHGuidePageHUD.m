//
//  DHGuidePageHUD.m
//  DHGuidePageHUD
//
//  Created by Apple on 16/7/14.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHGuidePageHUD.h"
#import "ColorUtil.h"
#import "UIView+Extension.h"
#import "UIImage+WB.h"
#define DDHidden_TIME   1.0
#define DDScreenW   [UIScreen mainScreen].bounds.size.width
#define DDScreenH   [UIScreen mainScreen].bounds.size.height

@interface DHGuidePageHUD ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray       *imageArray;
@property (nonatomic, strong) UIPageControl *imagePageControl;
@end

@implementation DHGuidePageHUD

- (instancetype)dh_initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray buttonIsHidden:(BOOL)isHidden {
    if ([super initWithFrame:frame]) {
        
        if (isHidden == YES) {
            self.imageArray = imageArray;
        }
        
        // 设置引导视图的scrollview
        UIScrollView *guidePageView = [[UIScrollView alloc]initWithFrame:frame];
        [guidePageView setBackgroundColor:[UIColor lightGrayColor]];
        [guidePageView setContentSize:CGSizeMake(DDScreenW*imageArray.count, DDScreenH)];
        [guidePageView setBounces:NO];
        [guidePageView setPagingEnabled:YES];
        [guidePageView setShowsHorizontalScrollIndicator:NO];
        [guidePageView setDelegate:self];
        [self addSubview:guidePageView];
        
        // 设置引导页上的跳过按钮
        UIButton *skipButton = [[UIButton alloc]initWithFrame:CGRectMake(DDScreenW*0.8, DDScreenW*0.1, 50, 25)];
        
        [skipButton setBackgroundImage:[UIImage imageNamed:@"tiaoguo_normal"] forState:UIControlStateNormal];
        [skipButton setBackgroundImage:[UIImage imageNamed:@"tiaoguo_press"] forState:UIControlStateHighlighted];
        
        [skipButton setTitle:@"跳过" forState:UIControlStateNormal];
        skipButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [skipButton setTitleColor:[ColorUtil getColor:@"2b529c" alpha:1] forState:UIControlStateNormal];
        [skipButton setTitleColor:[ColorUtil getColor:@"7893c2" alpha:1] forState:UIControlStateHighlighted];
        
//        [skipButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//        [skipButton setBackgroundColor:[UIColor grayColor]];
//        [skipButton.layer setCornerRadius:5.0];
        [skipButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:skipButton];
        
        // 添加在引导视图上的多张引导图片
        for (int i=0; i<imageArray.count; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(DDScreenW*i, 0, DDScreenW, DDScreenH)];
            imageView.image = imageArray[i];
            // 内容模式
            imageView.clipsToBounds = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            [guidePageView addSubview:imageView];
            
            // 设置在最后一张图片上显示进入体验按钮
            if (i == imageArray.count-1 && isHidden == NO) {
                [imageView setUserInteractionEnabled:YES];
                UIButton *startButton = [[UIButton alloc]initWithFrame:CGRectMake(DDScreenW*0.3, DDScreenH*0.8, 170, 32)];
                startButton.layer.cornerRadius = 4;
                startButton.layer.masksToBounds = YES;
                startButton.centerX = DDScreenW/2;
//                startButton.centerY = DDScreenH -68;
                [startButton setTitle:@"立即体验" forState:UIControlStateNormal];
                startButton.titleLabel.font = [UIFont systemFontOfSize:17];
                [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [startButton setTitleColor:[ColorUtil getColor:@"7893c2" alpha:1] forState:UIControlStateHighlighted];
                [startButton setBackgroundImage:[UIImage createImageWithColor:[ColorUtil getColor:@"50AAFE"]] forState:UIControlStateNormal];
                [startButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                [imageView addSubview:startButton];
            }
        }
        
        // 设置引导页上的页面控制器
        self.imagePageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(DDScreenW*0.0, DDScreenH*0.87, DDScreenW*1.0, DDScreenH*0.1)];
        self.imagePageControl.currentPage = 0;
        self.imagePageControl.numberOfPages = imageArray.count;
        self.imagePageControl.pageIndicatorTintColor = [ColorUtil getColor:@"ace2fd" alpha:1];
        self.imagePageControl.currentPageIndicatorTintColor = [ColorUtil getColor:@"1aa2fb" alpha:1];//选中颜色
        [self addSubview:self.imagePageControl];
        
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollview {
    int page = scrollview.contentOffset.x / scrollview.frame.size.width;
    [self.imagePageControl setCurrentPage:page];
    if (self.imageArray && page == self.imageArray.count-1) {
        [self buttonClick:nil];
    }
}

- (void)buttonClick:(UIButton *)button {
    [UIView animateWithDuration:DDHidden_TIME animations:^{
        self.alpha = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DDHidden_TIME * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self performSelector:@selector(removeGuidePageHUD) withObject:nil afterDelay:1];
        });
    }];
}

- (void)removeGuidePageHUD {
    [self removeFromSuperview];
}

@end
