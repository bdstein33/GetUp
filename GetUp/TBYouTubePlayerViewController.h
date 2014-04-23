//
//  TBYouTubePlayerViewController.h
//  GetUp
//
//  Created by Travis Bogosian on 4/17/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBYouTubePlayerViewController : UIViewController

@property NSString* mVideoToPlay;
@property (weak, nonatomic) IBOutlet UIView* mYouTubeView;

@end
