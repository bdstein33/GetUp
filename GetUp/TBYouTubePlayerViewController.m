//
//  TBYouTubePlayerViewController.m
//  GetUp
//
//  Created by Travis Bogosian on 4/17/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBYouTubePlayerViewController.h"
#import "XCDYouTubeVideoPlayerViewController.h"

@interface TBYouTubePlayerViewController ()
{
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController;
}
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

    videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:mVideoToPlay];
    [videoPlayerViewController presentInView:self.mYouTubeView];
    [videoPlayerViewController.moviePlayer play];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [videoPlayerViewController.moviePlayer stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}


@end
