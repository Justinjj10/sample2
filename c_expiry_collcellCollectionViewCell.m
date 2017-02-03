//
//  c_expiry_collcellCollectionViewCell.m
//  sample2
//
//  Created by Mac on 2/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "c_expiry_collcellCollectionViewCell.h"

@implementation c_expiry_collcellCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    self.layer.borderColor = [[UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1.0] CGColor];
    self.layer.borderWidth = 1.0;
}

@end
