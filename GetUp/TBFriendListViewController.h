//
//  TBFriendListViewController.h
//  GetUp
//
//  Created by Travis Bogosian on 5/15/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBFriendListViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView * mTableView;
    IBOutlet UISearchBar * mSearchBar;
    NSMutableArray * _mSearchedItems;
    NSMutableArray * _mSelectedFriends;
}

@property NSString* mVideoToSend;

@end
