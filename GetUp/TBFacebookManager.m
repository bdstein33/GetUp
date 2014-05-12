//
//  TBFacebookManager.m
//  GetUp
//
//  Created by Travis Bogosian on 5/12/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBFacebookManager.h"

@implementation TBFacebookManager

@synthesize userID;
#pragma mark Singleton Methods
+ (id)sharedManager {
    static TBFacebookManager *sharedFBManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFBManager = [[self alloc] init];
    });
    return sharedFBManager;
}

- (id)init {
    if (self = [super init]) {
        mFriendsWithApp = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)fetchFriendsWithApp
{
    FBRequest *request =  [FBRequest  requestWithGraphPath:@"me/friends" parameters:@{@"fields":@"installed"} HTTPMethod:@"GET"];
    
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error)
     {
         NSMutableArray *frnd_arr = [result objectForKey:@"data"];
         for (int i = 0; i < [frnd_arr count]; i++)
         {
             //NOTE, MOVE BELOW ONCE FRIENDS HAVE APP
             [mFriendsWithApp addObject:[[frnd_arr objectAtIndex:i] objectForKey:@"id"]];
             //END NOTE
             
             if([[[frnd_arr objectAtIndex:i] objectForKey:@"installed"] boolValue])
             {
                 //IF APP IS INSTALLED, DO SOMETHING
             }
         }
         NSLog(@"Resulting friends with app found: %i",[mFriendsWithApp count]);
     }];
}

@end
