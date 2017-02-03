//
//  emp_doc_expcell.m
//  sample2
//
//  Created by Mac on 6/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "emp_doc_expcell.h"

@implementation emp_doc_expcell

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
        _collectionView = [[NSBundle mainBundle] loadNibNamed:@"emp_view" owner:self options:nil][0];
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
