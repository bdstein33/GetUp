//
//  TBSecondViewController.h
//  GetUp
//
//  Created by Travis Bogosian on 4/15/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YouTubeInformation: NSObject
    @property NSString * url;
    @property NSString * name;
    @property NSString * descrip;
    @property NSString * thumbURL;
@end

@implementation YouTubeInformation
    @synthesize url;
    @synthesize name;
    @synthesize descrip;
    @synthesize thumbURL;
@end

@interface TBSecondViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView * mTableView;
    IBOutlet UISearchBar * mSearchBar;
    NSMutableArray * _mSearchedItems;
    int selectedVideo;
}

@end
