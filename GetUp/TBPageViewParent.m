//
//  TBPageViewParent.m
//  BigTicket
//
//  Created by Travis Bogosian on 2/8/14.
//  Copyright (c) 2014 TB. All rights reserved.
//

#import "TBPageViewParent.h"
#import "TBViewController.h"

@interface TBPageViewParent ()

@end

@implementation TBPageViewParent

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
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    TBViewController *initialViewController = (TBViewController*)[self viewControllerAtIndex:1];
        
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self pagesView] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    if([viewController isKindOfClass: NSClassFromString(@"TBViewController")])
        return [self viewControllerAtIndex:0];
    else if([viewController isKindOfClass: NSClassFromString(@"TBSecondViewController")])
        return [self viewControllerAtIndex:1];
    else
        return nil;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    
    if([viewController isKindOfClass: NSClassFromString(@"TBViewController")])
        return [self viewControllerAtIndex:2];
    else if([viewController isKindOfClass: NSClassFromString(@"TBSecondViewController")])
        return nil;
    else
        return [self viewControllerAtIndex:1];
    
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                   bundle:nil];
    
    switch(index)
    {
        case 0:
            return [sb instantiateViewControllerWithIdentifier:@"MessagesView"];
        case 1:
            return (TBViewController*)[sb instantiateViewControllerWithIdentifier:@"HomeView"];
        case 2:
            return [sb instantiateViewControllerWithIdentifier:@"SearchView"];
            
    }

    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 1;
}

@end
