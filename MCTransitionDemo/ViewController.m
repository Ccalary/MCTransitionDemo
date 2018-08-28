//
//  ViewController.m
//  MCTransitionDemo
//
//  Created by caohouhong on 2018/4/27.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MCTransition.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *dataArray;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageArray = @[@"img_1",@"img_2",@"img_3"];
    /**
     MCTransitonAnimTypeFade,        //渐变，效果不明显
     MCTransitonAnimTypeMoveIn,      //新的移入
     MCTransitonAnimTypeReveal,      //旧的移出
     MCTransitonAnimTypePush,         //推入,新的推入旧的推出
     MCTransitonAnimTypePageCurl,    // 向上翻一页
     MCTransitonAnimTypePageUnCurl,  // 向下翻一页
     MCTransitonAnimTypeRippleEffect,// 波纹
     MCTransitonAnimTypeSuckEffect,  // 像一块布被抽走
     MCTransitonAnimTypeCube,        // 立方体
     MCTransitonAnimTypeOglFlip,     // 平面反转
     MCTransitonAnimTypeCameraIrisHollowOpen, //摄像机开
     MCTransitonAnimTypeCameraIrisHollowClose //摄像机关
     */
    self.dataArray = @[@"Fade",@"MoveIn",@"Reveal",@"Push",@"PageCurl",@"PageUnCurl",@"RippleEffect",@"SuckEffect",@"Cube",@"OglFlip",@"CameraIrisHollowOpen",@"CameraIrisHollowClose"];
    
    self.imageView.image = [UIImage imageNamed:self.imageArray.lastObject];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row%self.imageArray.count]];
    [self.imageView setTransitionAnimationWithType:indexPath.row
                                          duration:1
                                         direction:MCTransitonAnimDirectionFromLeft
                                        timingFunc:MCTransitonAnimTimingFuncEaseIn];
}

@end
