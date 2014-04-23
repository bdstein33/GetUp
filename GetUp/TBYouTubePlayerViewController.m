//
//  TBYouTubePlayerViewController.m
//  GetUp
//
//  Created by Travis Bogosian on 4/17/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBYouTubePlayerViewController.h"
#import "XCDYouTubeVideoPlayerViewController.h"

#define degreesToRadian(x) (M_PI * (x) / 180.0)

@interface TBYouTubePlayerViewController ()

@end

@implementation TBYouTubePlayerViewController

@synthesize mVideoToPlay;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    float y;
    if(height == 568)
        y = 36.0;
    else
        y = 80.0;
    
    self.mYouTubeView.transform = CGAffineTransformIdentity;
	self.mYouTubeView.transform = CGAffineTransformMakeRotation(degreesToRadian(90));
	self.mYouTubeView.bounds = CGRectMake(y, 0.0, height, 320);
    
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:mVideoToPlay];
    [videoPlayerViewController presentInView:self.mYouTubeView];
    [videoPlayerViewController.moviePlayer play];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
