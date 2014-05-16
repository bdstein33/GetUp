//
//  TBMessagesViewController.m
//  GetUp
//
//  Created by Travis Bogosian on 5/13/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBMessagesViewController.h"
#import "TBMessageTableViewCell.h"
#import "TBEndpointManager.h"
#import "TBFacebookManager.h"

@interface TBMessagesViewController ()

@end

@implementation TBMessagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[TBEndpointManager sharedManager] mPendingMessages] count];
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    if(!cell)
        cell = [[TBMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageCell"];
    
    NSDictionary * message = [[[TBEndpointManager sharedManager] mPendingMessages] objectAtIndex:indexPath.row];

    NSString * name;
    for(NSDictionary * friend in [[TBFacebookManager sharedManager] mFriendsWithApp])
    {
        if([[message objectForKey:@"from_id"] isEqualToString: [friend objectForKey:@"id"]])
            name = [friend objectForKey:@"name"];
    }
    cell.mFromLabel.text = name;
    cell.mMessage.text = [message objectForKey:@"message"];
    [cell.mImage setProfileID:[message objectForKey:@"from_id"]];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - Navigation

/*
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 if(selectedVideo >= 0)
 {
 ((TBViewController*)[segue destinationViewController]).mWakeVideo = ((YouTubeInformation*)[_mSearchedItems objectAtIndex:selectedVideo]).url;
 NSLog(@"Leaving with %@",((YouTubeInformation*)[_mSearchedItems objectAtIndex:selectedVideo]).url);
 }
 }
 */

@end
