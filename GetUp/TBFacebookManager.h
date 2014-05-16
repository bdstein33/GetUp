//
//  TBFacebookManager.h
//  GetUp
//
//  Created by Travis Bogosian on 5/12/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface TBFacebookManager : NSObject
{
}
@property NSMutableArray * mFriendsWithApp;
@property NSString * userID;

+ (id)sharedManager;

-(void)fetchFriendsWithApp;

@end
