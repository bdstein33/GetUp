//
//  TBEndpointManager.h
//  GetUp
//
//  Created by Travis Bogosian on 5/11/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBEndpointManager : NSObject <NSURLConnectionDelegate>
{
    NSMutableData *_responseData;
}

+ (id)sharedManager;
- (void)sendFBData:(NSString*)username
      andFirstName:(NSString*)firstname
       andLastName:(NSString*)lastname
         andPicURL:(NSString*)picurl;

- (void)sendMessageData:(NSString*)from
                  andTo:(NSString*)to
               andVideo:(NSString*)video
             andMessage:(NSString*)message;

-(void)retrieveMessagesTo:(NSString*)to_id;

@end
