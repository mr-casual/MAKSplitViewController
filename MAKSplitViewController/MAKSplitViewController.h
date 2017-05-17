//
//  MAKSplitViewController.h
//  MAKSplitViewController
//
//  Created by Martin Kloepfel on 03.09.15.
//  Copyright (c) 2015 Martin Klöpfel. All rights reserved.
//

#import "MAKBaseViewController.h"

@interface MAKSplitViewController : MAKBaseViewController

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *rightViewController;

@property (nonatomic, readonly, strong) UIView *leftContainerView;
@property (nonatomic, readonly, strong) UIView *rightContainerView;

@property (nonatomic) CGFloat leftColumnFixedWidth;
@property (nonatomic) CGFloat rightColumnFixedWidth;

@property (nonatomic) CGFloat leftColumnWidthFraction;
@property (nonatomic) CGFloat rightColumnWidthFraction;

// comming soon
//
//@property (nonatomic) BOOL lefColumnVisible;
//@property (nonatomic) BOOL rightColumnVisible;
//
//- (void)showLeftColumnAnimated:(BOOL)animated;
//- (void)showRightColumnAnimated:(BOOL)animated;
//
//- (void)hideLeftColumnAnimated:(BOOL)animated;
//- (void)hideRightColumnAnimated:(BOOL)animated;
//
//- (void)toggleLeftColumn;
//- (void)toggleRightColumn;

@end
