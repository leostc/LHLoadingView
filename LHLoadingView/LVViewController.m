//
//  LVViewController.m
//  LHLoadingView
//
//  Created by lihao on 13-9-5.
//  Copyright (c) 2013年 Leo. All rights reserved.
//

#import "LVViewController.h"
#import "LeoLoadingView.h"

@interface LVViewController ()
@property (strong, nonatomic) IBOutlet LeoLoadingView *loadingView1,*loadingView2;

@end

@implementation LVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_loadingView1 showView:YES];
    [_loadingView2 showView:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
