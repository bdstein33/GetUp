//
//  TBEndpointManager.m
//  GetUp
//
//  Created by Travis Bogosian on 5/11/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBEndpointManager.h"

@implementation TBEndpointManager
{
}

NSString * APPCODE = @"HFW2UIHDWF234HOQBN2OFU7H";

#pragma mark Singleton Methods
+ (id)sharedManager {
    static TBEndpointManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {

    }
    return self;
}

#pragma mark Endpoing Connections
-(void)sendFBData:(NSString*)username
   andFirstName:(NSString*)firstname
    andLastName:(NSString*)lastname
      andPicURL:(NSString*)picurl
{
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://goodbabyfilms.com/bigticket_dev/ajax-request-send.php"]];
    NSString *myRequestString = [NSString stringWithFormat:@"username=%@&firstname=%@&lastname=%@&picurl=%@&app_code=%@&command=add_user",username,firstname,lastname,picurl,APPCODE];
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: myRequestData];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(!conn)
        NSLog(@"Something went wrong with the URL connection to database");
}
-(void)sendMessageData:(NSString*)from
                 andTo:(NSString*)to
              andVideo:(NSString*)video
            andMessage:(NSString*)message
{
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://goodbabyfilms.com/bigticket_dev/ajax-request-send.php"]];
    NSString *myRequestString = [NSString stringWithFormat:@"from_id=%@&to_id=%@&vid_url=%@&message=%@&time=%@&app_code=%@&command=send_message",from,to,video,message,@"",APPCODE];
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: myRequestData];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(!conn)
        NSLog(@"Something went wrong with the URL connection to database");
}

-(void)retrieveMessagesTo:(NSString*)to_id
{
    // Create the request.
    
    NSLog(@"getting messages of id: %@",to_id);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://goodbabyfilms.com/bigticket_dev/ajax-request.php"]];
    NSString *myRequestString = [NSString stringWithFormat:@"to_id=%@&app_code=%@&command=get_messages",to_id,APPCODE];
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: myRequestData];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(!conn)
        NSLog(@"Something went wrong with the URL connection to database");
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSString *responseString = [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Finished connection with output: %@",responseString);
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
