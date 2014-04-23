//
//  TBPageViewParent.h
//  BigTicket
//
//  Created by Travis Bogosian on 2/8/14.
//  Copyright (c) 2014 TB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBPageViewParent : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;

@end
