//
//  c_expiry_tablcell.h
//  sample2
//
//  Created by Mac on 2/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "c_expiry_view.h"

@interface c_expiry_tablcell : UITableViewCell
@property()int janu;
- (void)setCollectionData:(NSArray *)collectionData;
@property (strong, nonatomic) c_expiry_view *collectionView;

@end
