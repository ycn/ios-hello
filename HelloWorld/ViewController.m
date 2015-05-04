//
//  ViewController.m
//  HelloWorld
//
//  Created by Andy Yuan on 5/2/15.
//  Copyright (c) 2015 Andy Yuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) NSString *name;
@property (assign, nonatomic) BOOL     hasRedBg;

@end

@implementation ViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"viewController initWithNibName");
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.name = @"RootView";
    self.hasRedBg = YES;
    
    NSLog(@"viewController initWithNibName return");
    return self;
}

- (void)dealloc {
    NSLog(@"viewController dealloc");
    NSLog(@"viewController dealloc return");
}

- (void)loadView {
    NSLog(@"viewController loadView");
    [super loadView];
    NSLog(@"viewController loadView return");
}

- (void)viewDidLoad {
    NSLog(@"viewController viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = self.hasRedBg ? [UIColor redColor] : [UIColor grayColor];
    
    CGRect blank     = CGRectMake(0, 0, 0, 0);
    self.background     = [[UIView alloc] initWithFrame:blank];
    [self.background setBackgroundColor:[UIColor whiteColor]];
    
    
    self.playLabel   = [[UILabel alloc] initWithFrame:blank];
    [self.playLabel setTextAlignment:NSTextAlignmentCenter];
    [self.playLabel setBackgroundColor:Rgb2UIColor(252, 222, 159)];
    
    // UILable 点击事件
    UITapGestureRecognizer *playTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlePlayTap:)];
    playTap.numberOfTapsRequired = 1;
    self.playLabel.userInteractionEnabled = YES;
    [self.playLabel addGestureRecognizer:playTap];
    
    self.rightLabel  = [[UILabel alloc] initWithFrame:blank];
    [self.rightLabel setTextAlignment:NSTextAlignmentCenter];
    [self.rightLabel setBackgroundColor:Rgb2UIColor(118, 187, 104)];
    
    // UILable 点击事件
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightTap:)];
    rightTap.numberOfTapsRequired = 2;
    self.rightLabel.userInteractionEnabled = YES;
    [self.rightLabel addGestureRecognizer:rightTap];
    
    
    self.bottomLabel = [[UILabel alloc] initWithFrame:blank];
    [self.bottomLabel setTextAlignment:NSTextAlignmentCenter];
    [self.bottomLabel setBackgroundColor:Rgb2UIColor(58, 152, 171)];
    
    // UILable 点击事件
    UITapGestureRecognizer *bottomTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBottomTap:)];
    bottomTap.numberOfTapsRequired = 3;
    self.bottomLabel.userInteractionEnabled = YES;
    [self.bottomLabel addGestureRecognizer:bottomTap];
    
    
    [self viewLayoutSubViewsWithMode:PORTRAIT_MODE];
    
    [self.background addSubview:self.playLabel];
    [self.background addSubview:self.rightLabel];
    [self.background addSubview:self.bottomLabel];
    [self.view addSubview:self.background];
    
    NSLog(@"viewController viewDidLoad return");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)viewWillLayoutSubviews {
    NSLog(@"viewController viewWillLayoutSubviews");
    [super viewWillLayoutSubviews];
    NSLog(@"viewController viewWillLayoutSubviews return");
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    switch (toInterfaceOrientation) {
        case UIInterfaceOrientationPortrait:
            [self viewLayoutSubViewsWithMode:PORTRAIT_MODE];
            break;
        case UIInterfaceOrientationLandscapeLeft:
            [self viewLayoutSubViewsWithMode:LANDSCAPE_MODE];
            break;
        case UIInterfaceOrientationLandscapeRight:
            [self viewLayoutSubViewsWithMode:LANDSCAPE_MODE];
            break;
        default:
            break;
    }
}

- (void)viewLayoutSubViewsWithMode:(ViewMode)viewMode {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    NSLog(@"bounds %dx%d", (int)screenSize.width, (int)screenSize.height);
    
    CGFloat width, height;
    if (screenSize.width <= screenSize.height) {
        width  = screenSize.width;
        height = screenSize.height;
    } else {
        width  = screenSize.height;
        height = screenSize.width;
    }
    
    CGRect subViewBounds;
    
    if (viewMode == PORTRAIT_MODE) {
        subViewBounds = CGRectMake(10,
                                   10 + 20,
                                   width - 20,
                                   height - 20 - 20);
        [self.background setFrame:subViewBounds];
    } else {
        subViewBounds = CGRectMake(10,
                                   10 + 20,
                                   height - 20,
                                   width - 20 - 20);
        [self.background setFrame:subViewBounds];
    }
    
    NSLog(@"subViewBounds %dx%d", (int)subViewBounds.size.width, (int)subViewBounds.size.height);
    
    CGRect playLabelBounds   = CGRectMake(10,
                                          10,
                                          (subViewBounds.size.width - 20) * 0.7,
                                          (subViewBounds.size.height - 20) * 0.4);
    [self.playLabel setFrame:playLabelBounds];
    NSLog(@"playLabelBounds %dx%d", (int)playLabelBounds.size.width, (int)playLabelBounds.size.height);

    CGRect rightLabelBounds  = CGRectMake(10 + playLabelBounds.size.width,
                                          10,
                                          (subViewBounds.size.width - 20) * 0.3,
                                          (subViewBounds.size.height - 20));
    [self.rightLabel setFrame:rightLabelBounds];
    NSLog(@"rightLabelBounds %dx%d", (int)rightLabelBounds.size.width, (int)rightLabelBounds.size.height);

    CGRect bottomLabelBounds = CGRectMake(10,
                                          10 + playLabelBounds.size.height,
                                          (subViewBounds.size.width - 20) * 0.7,
                                          (subViewBounds.size.height - 20) * 0.6);
    [self.bottomLabel setFrame:bottomLabelBounds];
    NSLog(@"bottomLabelBounds %dx%d", (int)bottomLabelBounds.size.width, (int)bottomLabelBounds.size.height);
    
    
    [self.playLabel setText:@"Play"];
    [self.rightLabel setText:@"Right"];
    [self.bottomLabel setText:@"Bottom"];
}

- (void)handlePlayTap:(UITapGestureRecognizer *)recognizer {
    [self.playLabel setText:@"I'm pressed!"];
}

- (void)handleRightTap:(UITapGestureRecognizer *)recognizer {
    [self.rightLabel setText:@"Duang!"];
}

- (void)handleBottomTap:(UITapGestureRecognizer *)recognizer {
    [self.bottomLabel setText:@"I'm pressed!"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"viewController touchesBegan with %d fingers", [touches count]);
    NSArray *touchList = touches.allObjects;
    for (UITouch *touch in touchList) {
        NSLog(@"touch %@", touch);
    }
    NSLog(@"viewController touchesBegan return");
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
