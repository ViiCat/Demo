//
//  CAShapeLayerViewController.m
//  WHH
//
//  Created by Liu Jie on 2018/11/14.
//  Copyright © 2018 Liu Jie. All rights reserved.
//

#import "CAShapeLayerViewController.h"
#import "Masonry.h"

@interface CAShapeLayerViewController ()

@end

@implementation CAShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView *shapeView = [[UIView alloc] init];
    shapeView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:shapeView];
    [shapeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.left.equalTo(self.view.mas_left);
        make.width.height.equalTo(@220);
    }];
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5, 5, 200, 200)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 1.0;
    animation.fromValue = @(0.75);
    animation.toValue = @(1);
    animation.repeatCount = MAXFLOAT;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezier.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
//    shapeLayer.lineCap = kCALineCapButt;
    shapeLayer.lineCap = kCALineCapRound;  // 线条拐角
    shapeLayer.lineJoin = kCALineCapRound;   //  终点处理
    shapeLayer.lineWidth = 10.0;
    
    [shapeLayer addAnimation:animation forKey:nil];
    [shapeView.layer addSublayer:shapeLayer];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
