//
//  TBFriendTableViewCell.h
//  GetUp
//
//  Created by Travis Bogosian on 5/15/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface TBFriendTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* mName;
@property (weak, nonatomic) IBOutlet FBProfilePictureView* mPictureView;

@end
