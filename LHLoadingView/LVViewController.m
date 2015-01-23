//
//  LVViewController.m
//  LHLoadingView
//
//  Created by lihao on 13-9-5.
//  Copyright (c) 2013年 Leo. All rights reserved.
//

#import "LVViewController.h"
#import "LHLoadingTipView.h"

@interface LVViewController ()
@property (weak, nonatomic) IBOutlet LHLoadingTipView *loadingView1,*loadingView2;

@end

@implementation LVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startBtnPressed:(id)sender {
    [_loadingView1 showView:YES];
    [_loadingView2 showView:YES];
}

- (IBAction)stopBtnPressed:(id)sender {
    [_loadingView1 showView:NO];
    [_loadingView2 showView:NO];
}

@end
