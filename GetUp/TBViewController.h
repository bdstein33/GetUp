//
//  TBViewController.h
//  GetUp
//
//  Created by Travis Bogosian on 4/4/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface TBViewController : UIViewController <FBLoginViewDelegate>
{
    NSDate * _mWakeUpTime;
}

@property (weak, nonatomic) IBOutlet UILabel *mCurrentTime;
@property (weak, nonatomic) IBOutlet UIButton *mCreateAlarmButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *mTimeSetter;
@property (weak, nonatomic) IBOutlet UILabel *mTimeToWake;
@property NSString* mWakeVideo;

- (IBAction)playVideo:(id)sender;
- (IBAction)setAlarm:(id)sender;
- (void)intervalUpate:(NSTimer*)timer;
- (void)updateCurrentTime;
- (int)updateTimeToWake;
- (void)wakeUp;

@end
