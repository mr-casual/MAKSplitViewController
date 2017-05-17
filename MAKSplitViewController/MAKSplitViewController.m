//
//  MAKSplitViewController.h
//  MAKSplitViewController
//
//  Created by Martin Kloepfel on 03.09.15.
//  Copyright (c) 2015 Martin Klöpfel. All rights reserved.
//

#import "MAKSplitViewController.h"


@interface MAKSplitViewController ()

@property (nonatomic, strong) UIView *leftContainerView;
@property (nonatomic, strong) UIView *rightContainerView;

@end


@implementation MAKSplitViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        self.leftContainerView = [UIView new];
        self.rightContainerView = [UIView new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat leftWidth = self.leftColumnFixedWidth > 0.0 ? self.leftColumnFixedWidth : self.view.width*self.leftColumnWidthFraction;
    CGFloat rightWidth = self.rightColumnFixedWidth > 0.0 ? self.rightColumnFixedWidth : self.view.width*self.rightColumnWidthFraction;

    leftWidth = self.view.width - rightWidth;
    
    self.leftContainerView.frame = CGRectMake(0.0, 0.0, leftWidth, self.view.height);
    self.leftContainerView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.leftContainerView];
    
    self.rightContainerView.frame = CGRectMake(self.view.width-rightWidth, 0.0, rightWidth, self.view.height);
    self.rightContainerView.autoresizingMask =  UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:self.rightContainerView];
    
    if (self.leftViewController)
    {
        [self addChildViewController:self.leftViewController];
        self.leftViewController.view.frame = self.leftContainerView.bounds;
        [self.leftContainerView addSubview:self.leftViewController.view];
        [self.leftViewController didMoveToParentViewController:self];
    }
    
    if (self.rightViewController)
    {
        [self addChildViewController:self.rightViewController];
        self.rightViewController.view.frame = self.rightContainerView.bounds;
        [self.rightContainerView addSubview:self.rightViewController.view];
        [self.rightViewController didMoveToParentViewController:self];
    }
}


- (void)setLeftColumnFixedWidth:(CGFloat)leftColumnFixedWidth
{
    _leftColumnFixedWidth = leftColumnFixedWidth;
    
    if (leftColumnFixedWidth > 0.0)
        self.rightColumnFixedWidth = 0.0;
}

- (void)setRightColumnFixedWidth:(CGFloat)rightColumnFixedWidth
{
    _rightColumnFixedWidth = rightColumnFixedWidth;
    
    if (rightColumnFixedWidth > 0.0)
        self.leftColumnFixedWidth = 0.0;
}








@end
