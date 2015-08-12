//
//  ProductImageViewController.m
//  tabbar可扩展性框架
//
//  Created by 刘旭 on 15/8/6.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "ProductImageViewController.h"

@interface ProductImageViewController ()

@end

@implementation ProductImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIImageView *imageView = [UIImageView new];
//    imageView.image = [self buttonImageFromColor:[UIColor orangeColor]];
//    [self.view addSubview:imageView];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.width.height.equalTo(@100);
//    }];
    
    
    UIView *lastView;
    for (int i = 0; i < 5; i++) {
        UIView *bgview = [UIView new];
        [self.view addSubview:bgview];
        
        switch (i) {
            case 0:
                bgview.backgroundColor = [UIColor redColor];
                break;
            case 1:
                bgview.backgroundColor = [UIColor yellowColor];
                break;
            case 2:
                bgview.backgroundColor = [UIColor blackColor];
                break;
                
            default:
                bgview.backgroundColor = [UIColor blueColor];
                break;
        }
        
        if (lastView) {
            [bgview makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastView.right);
                make.width.height.equalTo(lastView);
                make.centerY.equalTo(self.view.centerY);
            }];
        }
        else{
            [bgview makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.left);
                make.width.height.equalTo(@50);
                make.centerY.equalTo(self.view.centerY);
            }];
        }
        lastView = bgview;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
