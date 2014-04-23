//
//  TBViewController.m
//  GetUp
//
//  Created by Travis Bogosian on 4/4/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBViewController.h"
#import "TBYouTubePlayerViewController.h"

@interface TBViewController ()

@end

@implementation TBViewController

@synthesize mWakeVideo;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Initialize labels
    [self updateCurrentTime];
    
    _mWakeUpTime = (id)[NSNull null];
    mWakeVideo = @"LC-U7ya7wHA";
    
    //Start update loop
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self selector:@selector(intervalUpate:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setAlarm:(id)sender
{
    NSTimeInterval time = floor([[self.mTimeSetter date] timeIntervalSinceReferenceDate] / 60.0) * 60.0;
    _mWakeUpTime = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"hh:mm"];
    NSString * time_string = [DateFormatter stringFromDate:_mWakeUpTime];
    
    NSLog(@"Alarm set for %@",_mWakeUpTime);
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = _mWakeUpTime;
    localNotification.alertBody = @"Your alert message";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

-(void)intervalUpate:(NSTimer*)timer
{
    [self updateCurrentTime];
    
    if(_mWakeUpTime != (id)[NSNull null])
    {
        if([self updateTimeToWake] == 0)
        {
            _mWakeUpTime = (id)[NSNull null];
            [self wakeUp];
        }
    }
}

-(void)updateCurrentTime
{
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"hh:mm:ss"];
    self.mCurrentTime.text = [DateFormatter stringFromDate:[NSDate date]];
}
-(int)updateTimeToWake
{
    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *conversionInfo = [[NSCalendar currentCalendar] components:unitFlags fromDate:[NSDate date]  toDate:_mWakeUpTime  options:0];
    
    NSInteger hours = [conversionInfo hour];
    NSInteger minutes = [conversionInfo minute];
    NSInteger
    seconds = [conversionInfo second];

    NSString* timeleft = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours,(long)minutes,(long)seconds];
    self.mTimeToWake.text = timeleft;
    
    return hours*360 + minutes*60 + seconds;
}
-(void)wakeUp
{
    TBYouTubePlayerViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"YouTubePlayerView"];
    vc.mVideoToPlay = mWakeVideo;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma <#arguments#>
- (void) loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    NSLog(@"Logged out via FB");
}
-(void) loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    NSLog(@"Logged in via FB");
}
-(void) loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSLog(@"%@ is the current logged in user.",[user name]);
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"toYouTubeView"])
        ((TBYouTubePlayerViewController*)[segue destinationViewController]).mVideoToPlay = mWakeVideo;
}

-(IBAction)unwindFromViewController2:(UIStoryboardSegue*)segue
{
}

@end
