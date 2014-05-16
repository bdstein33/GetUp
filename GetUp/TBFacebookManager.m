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
@synthesize mFriendsWithApp;
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
    FBRequest *request =  [FBRequest  requestWithGraphPath:@"me/friends" parameters:@{@"fields":@"name,picture,installed"} HTTPMethod:@"GET"];
    
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error)
     {
         NSMutableArray *frnd_arr = [result objectForKey:@"data"];
         for (int i = 0; i < [frnd_arr count]; i++)
         {
             //NOTE, MOVE BELOW ONCE FRIENDS HAVE APP
             //if(![mFriendsWithApp containsObject:[[frnd_arr objectAtIndex:i] objectForKey:@"id"]])
                 //[mFriendsWithApp addObject:[[frnd_arr objectAtIndex:i] objectForKey:@"id"]];
             //END NOTE
             
             if([[[frnd_arr objectAtIndex:i] objectForKey:@"installed"] boolValue])
             {
                 //IF APP IS INSTALLED, DO SOMETHING
                 if(![mFriendsWithApp containsObject:[frnd_arr objectAtIndex:i]])
                     [mFriendsWithApp addObject:[frnd_arr objectAtIndex:i]];
             }
         }
         NSLog(@"Resulting friends with app found: %i",[mFriendsWithApp count]);
     }];
}

@end
