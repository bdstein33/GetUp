//
//  TBSecondViewController.m
//  GetUp
//
//  Created by Travis Bogosian on 4/15/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBSecondViewController.h"
#import "TBViewController.h"
#import "TBYouTubeSearchResultCellTableViewCell.h"
#import "TBPageViewParent.h"

@interface TBSecondViewController ()

@end

@implementation TBSecondViewController

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
    _mSearchedItems = [[NSMutableArray alloc] init];
    selectedVideo = -1;
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
    return [_mSearchedItems count];
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBYouTubeSearchResultCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"YouTubeSearchCell"];
    if(!cell)
        cell = [[TBYouTubeSearchResultCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YouTubeSearchCell"];
    
    cell.mTitle.text = ((YouTubeInformation*)[_mSearchedItems objectAtIndex:indexPath.row]).name;
    cell.mDescription.text = ((YouTubeInformation*)[_mSearchedItems objectAtIndex:indexPath.row]).descrip;
    cell.mImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:((YouTubeInformation*)[_mSearchedItems objectAtIndex:indexPath.row]).thumbURL]]];

    return cell;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self dispatchYouTubeDataSearchRequest: searchBar.text];
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedVideo = indexPath.row;
    NSString *notificationName = @"setVideo";
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:((YouTubeInformation*)[_mSearchedItems objectAtIndex:selectedVideo]).url forKey:@"vidURL"];
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil userInfo:dictionary];
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

- (void) dispatchYouTubeDataSearchRequest:(NSString*)searchParams
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    
    NSString *search = @"https://www.googleapis.com/youtube/v3/search";
    NSString *key = @"AIzaSyBpd8vT_n3aBKEf8we9wfrKoMuhzLkVMRg";
    
    searchParams = [searchParams stringByReplacingOccurrencesOfString:@" " withString:@","];
    
    NSString *url = [NSString stringWithFormat:@"%@?key=%@&part=snippet&q=%@&maxResults=20&safeSearch=strict",search,key,searchParams];
    
    NSError *error;
    
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *response;
    
    NSData *aData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary *jsonReturn = [[NSDictionary alloc]init];
    jsonReturn = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:aData options:kNilOptions error:&error];
    
    NSDictionary *itemDict = [jsonReturn objectForKey:@"items"];
    
    [_mSearchedItems removeAllObjects];
    for(NSDictionary *item in itemDict) {
        //Review fetched information and store it to YouTubeInformation objects
        NSDictionary *info = [item objectForKey:@"snippet"];
        NSDictionary *y_id = [item objectForKey:@"id"];
        
        NSString *thumb = [((NSDictionary*)[((NSDictionary*)[info objectForKey:@"thumbnails"]) objectForKey:@"default"]) objectForKey:@"url"];
        
        YouTubeInformation * newInfo = [[YouTubeInformation alloc] init];
        newInfo.name = [info objectForKey:@"title"];
        newInfo.url = [y_id objectForKey:@"videoId"];
        newInfo.descrip = [info objectForKey:@"description"];
        newInfo.thumbURL = thumb;
        
        NSLog(@"Item: %@",item);
        
        //If there is a video to play, add it to the list
        if(newInfo.url != NULL)
            [_mSearchedItems addObject:newInfo];
    }
    
    jsonReturn = NULL;
    
    [mTableView reloadData];
}

@end
