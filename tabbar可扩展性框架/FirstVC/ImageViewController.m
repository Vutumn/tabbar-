//
//  ImageViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/28.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "ImageViewController.h"
#define MAS_SHORTHAND


@interface ImageViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)NSURL *imageUrl;
@property (nonatomic, strong)UIImage *image;
@property (nonatomic, strong)UIScrollView *scroll;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, assign)BOOL zoomOut;
@property (nonatomic, strong)UIButton *saveButton;


@end

@implementation ImageViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    }
    return self;
}


- (instancetype)initWithImageUrl:(NSURL *)imageUrl
{
    self = [super init];
    if (self) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        _imageUrl = imageUrl;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        _image = image;
    }
    return self;
}

- (instancetype)initWithArr:(NSMutableArray *)imageArr andIndex:(NSInteger)index
{
    self = [super init];
    if (self) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        _currentIndex = index;
        _imageArr = imageArr;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    //_imageView.frame = _scroll.bounds;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)loadView
{
    [super loadView];
    _scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scroll.delegate = self;
    _scroll.contentSize = CGSizeMake(KDeviceWidth * _imageArr.count, KDeviceHeight);
    _scroll.maximumZoomScale = 2;
    _scroll.pagingEnabled = YES;
    //_scroll.backgroundColor = [UIColor redColor];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scroll];
    
    
    for (int i = 0; i < _imageArr.count; i++) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(KDeviceWidth * i, 0, KDeviceWidth, KDeviceHeight)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = YES;
        _imageView.image = _imageArr[i];
//        if (_image) {
//            _imageView.image = _image;
//        }
//        else
//            _imageView.image = _imageArr[_currentIndex];
//        
        //添加网络下载图片
        //----------
        
        UITapGestureRecognizer *handDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        handDoubleTap.numberOfTapsRequired = 2;
        [_imageView addGestureRecognizer:handDoubleTap];
        
        UITapGestureRecognizer *handSingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
        //手势共存
        //singleTap.numberOfTapsRequired = 1;
        [handSingleTap requireGestureRecognizerToFail:handDoubleTap];
        [_imageView addGestureRecognizer:handSingleTap];
        
        //_scroll.contentSize = _imageView.frame.size;
        [_scroll addSubview:_imageView];
    }
    
    [_scroll scrollRectToVisible:CGRectMake(KDeviceWidth * _currentIndex, 0, KDeviceWidth, KDeviceHeight) animated:YES];
    
    //上面添加一些东西
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    backView.backgroundColor = [UIColor clearColor];
    backView.alpha = 0.8;
    [self.view addSubview:backView];
    
    _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _saveButton.frame = CGRectMake(KDeviceWidth - 60, KDeviceHeight - 45, 40, 40);
    [_saveButton setImage:[UIImage imageNamed:@"save_icon.png"] forState:UIControlStateNormal];
    [_saveButton setImage:[UIImage imageNamed:@"save_icon_highlighted.png"] forState:UIControlStateHighlighted];
    //[_saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [_saveButton addTarget:self action:@selector(downloadPicture) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_saveButton];

}


//传过来的图片数组
//- (void)setImageArr:(NSMutableArray *)imageArr
//{
//    _imageArr = imageArr;
//
//    //点击数组中的图片跳转到指定的位置
//    [_scroll setContentOffset:CGPointMake(KDeviceWidth * _currentIndex, 0) animated:NO];
//}

#pragma mark -UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  //  _scroll.
    
}


#pragma mark -handle gesture
- (void)singleTap
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//双击放大
- (void)doubleTap:(UIGestureRecognizer *)sender
{

    CGPoint pointInView = [sender locationInView:self.imageView];


    CGFloat power = _zoomOut ? 1/_scroll.maximumZoomScale : _scroll.maximumZoomScale;
    _zoomOut = !_zoomOut;
    
    
    CGFloat newZoomScale = _scroll.zoomScale * power;
    
    CGSize scrollViewSize = _scroll.bounds.size;
    
    CGFloat width = scrollViewSize.width / newZoomScale;
    CGFloat height = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (width / 2.0f);
    CGFloat y = _scroll.center.y - (height / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, width, height);
    
    [_scroll zoomToRect:rectToZoomTo animated:YES];
}

#pragma mark -SavePic
- (void)downloadPicture
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"下载图片至手机相册" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
        });
    }
}

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message;
    if (!error) {
        message = @"保存成功";
        //此处让save的状态改变,应该保存状态的说
        _saveButton.enabled = NO;
    } else {
        message = [NSString stringWithFormat:@"%@", [error description]];
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
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
