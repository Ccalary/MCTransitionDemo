//
//  ViewController.m
//  MCTransitionDemo
//
//  Created by caohouhong on 2018/4/27.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MCTransition.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSArray *imageArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageArray = @[@"img_1",@"img_2",@"img_3"];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:swipeLeft];
    self.imageView.userInteractionEnabled = YES;
    self.imageView.image = [UIImage imageNamed:self.imageArray.firstObject];
}

- (void)swipeAction:(UISwipeGestureRecognizer *)gesture {
    self.imageView.image = [UIImage imageNamed:self.imageArray[arc4random()%self.imageArray.count]];
    [self.imageView setTransitionAnimationWithType];
}

- (void)transitionAnimation{
    CATransition *trans = [CATransition animation];
//   trans.type = kCATransitionFade;
    trans.type = @"pageUnCurl";
    // 动画的速度变化
    trans.timingFunction =  [CAMediaTimingFunction functionWithName:@"easeIn"];;
    trans.subtype = kCATruncationMiddle;
    trans.duration = 1.0f;
    [self.imageView.layer addAnimation:trans forKey:@"viewAnimation"];
}

@end
