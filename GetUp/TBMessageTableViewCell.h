//
//  TBMessageTableViewCell.h
//  GetUp
//
//  Created by Travis Bogosian on 5/13/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface TBMessageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet FBProfilePictureView *mImage;
@property (weak, nonatomic) IBOutlet UILabel *mFromLabel;
@property (weak, nonatomic) IBOutlet UILabel *mMessage;

@end
