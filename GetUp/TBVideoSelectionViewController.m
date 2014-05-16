//
//  TBVideoSelectionViewController.m
//  GetUp
//
//  Created by Travis Bogosian on 5/15/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBVideoSelectionViewController.h"
#import "XCDYouTubeVideoPlayerViewController.h"
#import "TBFriendListViewController.h"

@interface TBVideoSelectionViewController ()
{
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController;
}
@end

@implementation TBVideoSelectionViewController
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
    // Do any additional setup after loading the view.
    
    videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:mVideoToPlay];
    [videoPlayerViewController presentInView:self.mVideoView];
    
    [videoPlayerViewController.moviePlayer play];
    
    NSLog(@"Here's the selection: %@",mVideoToPlay);
//    [videoPlayerViewController.moviePlayer pause];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier  isEqual: @"FriendListSegue"])
        [((TBFriendListViewController*)[segue destinationViewController]) setMVideoToSend:mVideoToPlay];
}


@end
