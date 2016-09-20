//
//  ViewController.m
//  IHFSideBar
//
//  Created by chenjiasong on 16/8/15.
//  Copyright © 2016年 Cjson. All rights reserved.
//

#import "ViewController.h"
#import "IHFSideBar.h"
#define  SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
#define  SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define  MAXYOFFSET 60


@interface ViewController ()<IHFSideBarDelegate>
@property (strong,nonatomic) IHFSideBar *sideBar;
@property (strong,nonatomic) UITableView *sideBarTableView;

@property (nonatomic,weak) UIView *redView;
@property (nonatomic,weak) UIView *greenView;
@property (nonatomic,weak) UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpButton];
}

- (void)setUpButton {
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [self setUpSlideBar];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(20, 20, 44, 44);
    [self.view addSubview:button];
    [button setTitle:@"show sideBar" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor redColor]];

}

- (void)setUpSlideBar {
    
    self.sideBar = [[IHFSideBar alloc] initWithIsShowFromRight:NO];
//        self.sideBar.sideBarWidth = 100;
//    self.sideBar.delegate = self;
    self.sideBar.backgroundColor = [UIColor colorWithRed:36 / 255.0 green:222 / 255.0 blue:202 / 255.0 alpha:1];
    self.sideBar.delegate = self;
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
//    
//    [self.view addGestureRecognizer:panGestureRecognizer];
    
    CGFloat kSlideBarWidth = 270;
    // Create Content of SideBar
    UIView *sideBarContentview =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSlideBarWidth, self.view.frame.size.height)];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(30, 30, 30, 30);
    button.backgroundColor = [UIColor redColor];
    [sideBarContentview addSubview:button];
    [button addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sideBarContentview.backgroundColor = [UIColor lightGrayColor];
    
    [self.sideBar setContentView:sideBarContentview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickBtn:(UIButton *)sender{
    
    [self.sideBar showAnimated:YES];
}

- (void)didClick:(UIButton *)sender{
    NSLog(@"111");
}

- (void)sideBar:(IHFSideBar *)sideBar didAppear:(BOOL)animated {
    NSLog(@"appear");
}

- (void)sideBar:(IHFSideBar *)sideBar didDisappear:(BOOL)animated {
    NSLog(@"disappear");
}


@end
