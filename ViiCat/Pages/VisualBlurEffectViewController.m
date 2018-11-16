//
//  VisualBlurEffectViewController.m
//  WHH
//
//  Created by Liu Jie on 2018/11/14.
//  Copyright © 2018 Liu Jie. All rights reserved.
//

#import "VisualBlurEffectViewController.h"
#import "Masonry.h"

@interface VisualBlurEffectViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView2;
@property (weak, nonatomic) IBOutlet UIImageView *imgView3;
@end

@implementation VisualBlurEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //毛玻璃
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    [self.imgView addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.imgView);
    }];

    //文字水印
    UIBlurEffect *blur2 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:blur2];
    UIVisualEffectView *effectView2 = [[UIVisualEffectView alloc] initWithEffect:vibrancy];

    UILabel *label = [[UILabel alloc] init];
    label.text = @"Vibrancy Effect";
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:30];
    label.textAlignment = NSTextAlignmentCenter;
    [effectView2.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(effectView2.mas_left);
        make.top.equalTo(effectView2.mas_top).offset(20);
    }];

    //原图
    [self.imgView2 addSubview:effectView2];
    [effectView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.imgView2);
    }];
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
