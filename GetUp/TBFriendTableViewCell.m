//
//  TBFriendTableViewCell.m
//  GetUp
//
//  Created by Travis Bogosian on 5/15/14.
//  Copyright (c) 2014 GetUp LLC. All rights reserved.
//

#import "TBFriendTableViewCell.h"

@implementation TBFriendTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
