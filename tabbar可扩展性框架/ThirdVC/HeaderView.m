//
//  HeaderView.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/25.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "HeaderView.h"
#import "AutoSlideScrollView.h"

static NSInteger const buttonNumber = 4;
static NSInteger const productButtonNumber = 3;

@interface HeaderView()
@property (nonatomic, strong) AutoSlideScrollView *sliderView;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UIView *adView;
@property (nonatomic, strong) UIButton *productListButton;
@property (nonatomic, strong) UIImageView *adImage;

@property (nonatomic, strong) NSMutableArray *imageViewList;
@property (nonatomic, copy) NSArray *typeArr;
@property (nonatomic, copy) NSArray *productArr;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _typeArr = @[@"云问诊", @"健康产品", @"圈子", @"医萌通"];
        _productArr = @[@"养老产品", @"首发新品", @"敬老宣传"];
        [self InitWithSubViews];
        
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.sliderView];
    [self addSubview:self.selectButton];
    [self addSubview:self.adView];
    [self addSubview:self.adImage];
    [self addSubview:self.productListButton];
}

- (UIButton *)selectButton
{
    if (!_selectButton) {
        UIButton *lastButton;
        for (NSUInteger i = 0; i < buttonNumber; i++) {
            _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            _selectButton.frame = CGRectMake(KDeviceWidth / buttonNumber * i, CGRectGetMaxY(_sliderView.frame), KDeviceWidth / buttonNumber, 80);
            _selectButton.backgroundColor = [UIColor redColor]
            ;
            [_selectButton setTitle:_typeArr[i] forState:UIControlStateNormal];
            _selectButton.tag = i;
            [_selectButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:_selectButton];
            
            [_selectButton makeConstraints:^(MASConstraintMaker *make) {
                if (lastButton) {
                    make.left.equalTo(lastButton.right);
                }else{
                    make.left.equalTo(self);
                }
                make.top.equalTo(_sliderView.bottom);
                make.width.equalTo(@(KDeviceWidth / buttonNumber));
                make.height.equalTo(@80);
            }];
            
            lastButton = _selectButton;
        }
    }
    return _selectButton;

}

- (AutoSlideScrollView *)sliderView
{
    
    if (!_sliderView) {
        __weak typeof(self) weakSelf = self;
        _sliderView = [[AutoSlideScrollView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, KDeviceWidth * 0.3) animationDuration:3];
        _sliderView.layer.masksToBounds = YES;
        _sliderView.backgroundColor = [UIColor lightGrayColor];
        _sliderView.scrollView.scrollsToTop = NO;
        _sliderView.totalPagesCount = ^NSInteger(){
            return weakSelf.adListArray.count;
        };
        _sliderView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
            if (weakSelf.adListArray.count > pageIndex) {
                UIImageView *img = [weakSelf p_reuseViewForIndex:pageIndex];
                CodingBanner *curBanner = weakSelf.adListArray[pageIndex];
                [img sd_setImageWithURL:[curBanner.image urlWithCodePath]];
                return img;
            }else{
                return [UIView new];
            }
        };
        _sliderView.currentPageIndexChangeBlock = ^(NSInteger currentPageIndex){
            if (weakSelf.adListArray.count > currentPageIndex) {
                //pagecontrol滚动
                //                weakSelf.myPageControl.currentPage = currentPageIndex;
            }
        };
        
        _sliderView.tapActionBlock = ^(NSInteger pageIndex){
            if (weakSelf.tapActionBlock && weakSelf.adListArray.count > pageIndex) {
                weakSelf.tapActionBlock(weakSelf.adListArray[pageIndex]);
            }
        };
        
        [self addSubview:_sliderView];
    }

    return _sliderView;
}

- (UIView *)adView
{
    if (!_adView) {
        _adView = [UIView new];
        _adView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_adView];
        
        [_adView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_selectButton.bottom);
            make.left.right.equalTo(self);
            make.height.equalTo(@80);
        }];
    }
    return _adView;
}

- (UIImageView *)adImage
{
    if (!_adImage) {
        _adImage = [UIImageView new];
        _adImage.backgroundColor = [UIColor redColor];
        [self addSubview:_adImage];
        
        [_adImage makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_adView).insets(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
    }
    return _adImage;
}

- (UIButton *)productListButton
{
    if (!_productListButton) {
        
        UIButton *lastButton;
        for (NSUInteger i = 0; i < productButtonNumber; i++) {
            _productListButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _productListButton.backgroundColor = [UIColor redColor]
            ;
            [_productListButton setTitle:_productArr[i] forState:UIControlStateNormal];
            _productListButton.tag = i;
            [_productListButton addTarget:self action:@selector(productAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:_productListButton];

                [_productListButton makeConstraints:^(MASConstraintMaker *make) {
                    if (lastButton) {
                        make.left.equalTo(lastButton.right);
                    }else{
                        make.left.equalTo(self);
                    }
                    make.top.equalTo(_adView.bottom);
                    make.width.equalTo(@(KDeviceWidth / productButtonNumber));
                    make.height.equalTo(@80);
                }];
            
            lastButton = _productListButton;
        }
    }
    return _productListButton;
    
}

#pragma mark -setter
- (void)setAdListArray:(NSArray *)adListArray
{
    _adListArray = adListArray;
    
    
    [self reloadData];
}

#pragma mark -private
- (UIImageView *)p_reuseViewForIndex:(NSInteger)pageIndex{
    if (!_imageViewList) {
        _imageViewList = [[NSMutableArray alloc] initWithCapacity:3];
        for (int i = 0; i < 3; i++) {
            UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, KDeviceWidth * 0.3)];
            view.backgroundColor = [UIColor colorWithHexString:@"0xe5e5e5"];
            //  view.backgroundColor = [UIColor blackColor];
            view.clipsToBounds = YES;
            
            view.contentMode = UIViewContentModeScaleAspectFill;
            [_imageViewList addObject:view];
        }
    }
    UIImageView *imageView;
    NSInteger currentPageIndex = self.sliderView.currentPageIndex;
    if (pageIndex == currentPageIndex) {
        imageView = _imageViewList[1];
    }else if (pageIndex == currentPageIndex + 1
              || (labs(pageIndex - currentPageIndex) > 1 && pageIndex < currentPageIndex)){
        imageView = _imageViewList[2];
    }else{
        imageView = _imageViewList[0];
    }
    return imageView;
}

- (void)reloadData{
    self.hidden = _adListArray.count <= 0;
    if (_adListArray.count <= 0) {
        return;
    }
    
//    NSInteger currentPageIndex = MIN(self.sliderView.currentPageIndex, _curBannerList.count - 1) ;
//    CodingBanner *curBanner = _curBannerList[currentPageIndex];
//    _titleLabel.text = curBanner.title;
//    _typeLabel.text = curBanner.name;
//    
//    _myPageControl.numberOfPages = _curBannerList.count;
//    _myPageControl.currentPage = currentPageIndex;
//    
    [_sliderView reloadData];
}


- (void)buttonAction:(UIButton *)sender
{
    if (self.buttonActionBlock) {
        self.buttonActionBlock(sender.tag);
    }
}

- (void)productAction:(UIButton *)sender
{
    if (self.producActionBlock) {
        self.producActionBlock(sender.tag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
