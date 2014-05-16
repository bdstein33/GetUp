//
//  TBFriendListViewController.m
//  GetUp
//
//  Created by Travis Bogosian on 5/15/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBFriendListViewController.h"
#import "TBFriendTableViewCell.h"
#import "TBFacebookManager.h"
#import "TBEndpointManager.h"

@interface TBFriendListViewController ()

@end

@implementation TBFriendListViewController

@synthesize mVideoToSend;

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
    [[TBFacebookManager sharedManager] fetchFriendsWithApp];
    
    _mSearchedItems = [[NSMutableArray alloc] init];
    _mSelectedFriends = [[NSMutableArray alloc] init];
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
    
    return [[[TBFacebookManager sharedManager] mFriendsWithApp] count];
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBFriendTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    if(!cell)
        cell = [[TBFriendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FriendCell"];
    
    [cell mName].text = [[[[TBFacebookManager sharedManager] mFriendsWithApp] objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //selectedVideo = indexPath.row;
    NSString* friendID = [[[[TBFacebookManager sharedManager] mFriendsWithApp] objectAtIndex:indexPath.row] objectForKey:@"id"];
    if([_mSelectedFriends containsObject:friendID])
    {
        [[tableView cellForRowAtIndexPath:indexPath] setBackgroundColor:[UIColor clearColor]];
        [_mSelectedFriends removeObject:friendID];
    }
    else
    {
        [[tableView cellForRowAtIndexPath:indexPath] setBackgroundColor:[UIColor greenColor]];
        [_mSelectedFriends addObject:friendID];
    }
}

#pragma mark - Navigation


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    for(NSString *friend in _mSelectedFriends) {
        
         [[TBEndpointManager sharedManager] sendMessageData: [[TBFacebookManager sharedManager] userID]
                                                     andTo:friend
                                                  andVideo:mVideoToSend
                                                andMessage:@"Placeholder."];
         
    }
}

@end
