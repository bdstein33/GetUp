//
//  TBMessagesViewController.h
//  GetUp
//
//  Created by Travis Bogosian on 5/13/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBMessagesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView * mTableView;
}
@end
