//
//  TBYouTubeSearchResultCellTableViewCell.h
//  GetUp
//
//  Created by Travis Bogosian on 4/21/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBYouTubeSearchResultCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mImage;
@property (weak, nonatomic) IBOutlet UILabel *mTitle;
@property (weak, nonatomic) IBOutlet UILabel *mDescription;

@end
