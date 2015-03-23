//
//  ViewController.m
//  AutoLayoutProgrammatically
//
//  Created by Shahin on 2015-03-22.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    // Purple box (bottom right)
    
    UIView *ratioView = [[UIView alloc] initWithFrame:CGRectZero];
    ratioView.translatesAutoresizingMaskIntoConstraints = NO;
    ratioView.backgroundColor = [UIColor purpleColor];
    [framingView addSubview:ratioView];
    
    [framingView addConstraint:[NSLayoutConstraint constraintWithItem:ratioView
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:framingView
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:0.61
                                                             constant:0.0]];
    
    [framingView addConstraint:[NSLayoutConstraint constraintWithItem:ratioView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1.0
                                                             constant:50.0]];
    
    [framingView addConstraint:[NSLayoutConstraint constraintWithItem:ratioView
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:framingView
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1.0
                                                             constant:-20.0]];
    
    [framingView addConstraint:[NSLayoutConstraint constraintWithItem:ratioView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:framingView
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0
                                                             constant:-20.0]];
    
    
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    // Ornage boxes inside the red box (top right)
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectZero];
    containerView.backgroundColor = [UIColor redColor];
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *containedView1 = [[UIView alloc] initWithFrame:CGRectZero];
    containedView1.translatesAutoresizingMaskIntoConstraints = NO;
    containedView1.backgroundColor = [UIColor orangeColor];
    
    UIView *containedView2 = [[UIView alloc] initWithFrame:CGRectZero];
    containedView2.translatesAutoresizingMaskIntoConstraints = NO;
    containedView2.backgroundColor = [UIColor orangeColor];
    
    [framingView addSubview:containerView];
    [containerView addSubview:containedView1];
    [containerView addSubview:containedView2];
    
    [framingView addConstraint:[NSLayoutConstraint constraintWithItem:containerView
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:framingView
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1.0
                                                             constant:20.0]];
    
    [framingView addConstraint:[NSLayoutConstraint constraintWithItem:containerView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:framingView
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0
                                                             constant:-20.0]];
    
    [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[containedView1(==70)]-[containedView2(==50)]-|" options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(containedView1, containedView2)]];
    
    [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[containedView1(==30)]-|" options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(containedView1)]];
    
    // Three blue boxes (vertical centre)
    
    UIView *equalView1 = [[UIView alloc] initWithFrame:CGRectZero];
    equalView1.translatesAutoresizingMaskIntoConstraints = NO;
    equalView1.backgroundColor = [UIColor blueColor];
    [framingView addSubview:equalView1];
    
    UIView *equalView2 = [[UIView alloc] initWithFrame:CGRectZero];
    equalView2.translatesAutoresizingMaskIntoConstraints = NO;
    equalView2.backgroundColor = [UIColor blueColor];
    [framingView addSubview:equalView2];
    
    UIView *equalView3 = [[UIView alloc] initWithFrame:CGRectZero];
    equalView3.translatesAutoresizingMaskIntoConstraints = NO;
    equalView3.backgroundColor = [UIColor blueColor];
    [framingView addSubview:equalView3];
    
    UIView *spacerView1 = [[UIView alloc] initWithFrame:CGRectZero];
    spacerView1.translatesAutoresizingMaskIntoConstraints = NO;
    spacerView1.backgroundColor = [UIColor clearColor];
    [framingView addSubview:spacerView1];
    
    UIView *spacerView2 = [[UIView alloc] initWithFrame:CGRectZero];
    spacerView2.translatesAutoresizingMaskIntoConstraints = NO;
    spacerView2.backgroundColor = [UIColor clearColor];
    [framingView addSubview:spacerView2];
    
    UIView *spacerView3 = [[UIView alloc] initWithFrame:CGRectZero];
    spacerView3.translatesAutoresizingMaskIntoConstraints = NO;
    spacerView3.backgroundColor = [UIColor clearColor];
    [framingView addSubview:spacerView3];
    
    UIView *spacerView4 = [[UIView alloc] initWithFrame:CGRectZero];
    spacerView4.translatesAutoresizingMaskIntoConstraints = NO;
    spacerView4.backgroundColor = [UIColor clearColor];
    [framingView addSubview:spacerView4];
    
    [framingView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[spacerView1(==spacerView2)][equalView1(==50)][spacerView2(==spacerView3)][equalView2(==equalView1)][spacerView3(==spacerView4)][equalView3(==equalView2)][spacerView4]|" options:NSLayoutFormatAlignAllLeft|NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(equalView1, equalView2, equalView3, spacerView1, spacerView2, spacerView3, spacerView4)]];
    
    [equalView1 addConstraint:[NSLayoutConstraint constraintWithItem:equalView1
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1.0
                                                            constant:50.0]];
    
    [framingView addConstraint:[NSLayoutConstraint constraintWithItem:equalView1
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:framingView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1.0
                                                             constant:0.0]];
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end