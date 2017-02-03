//
//  c_expiry_tablcell.m
//  sample2
//
//  Created by Mac on 2/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "c_expiry_tablcell.h"
//#import "c_expiry_collcellCollectionViewCell.h"





@implementation c_expiry_tablcell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _collectionView = [[NSBundle mainBundle] loadNibNamed:@"ORGContainerCellView" owner:self options:nil][0];
        _collectionView.frame = self.bounds;
        _collectionView.janu=self.janu;
        [self.contentView addSubview:_collectionView];
    }
    return self;
}



- (void)setCollectionData:(NSArray *)collectionData {
    
    [_collectionView setCollectionData:collectionData];
}

@end
