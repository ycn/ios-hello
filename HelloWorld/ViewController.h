//
//  ViewController.h
//  HelloWorld
//
//  Created by Andy Yuan on 5/2/15.
//  Copyright (c) 2015 Andy Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

typedef enum {
    PORTRAIT_MODE,
    LANDSCAPE_MODE
} ViewMode;

@interface ViewController : UIViewController

@property (strong, nonatomic) UIView  *subView;
@property (strong, nonatomic) UILabel *playLabel;
@property (strong, nonatomic) UILabel *rightLabel;
@property (strong, nonatomic) UILabel *bottomLabel;

- (void)viewLayoutSubViewsWithMode:(ViewMode)viewMode;
- (void)handlePlayTap:(UITapGestureRecognizer *)recognizer;
- (void)handleRightTap:(UITapGestureRecognizer *)recognizer;
- (void)handleBottomTap:(UITapGestureRecognizer *)recognizer;

@end
