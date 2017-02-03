//
//  c_expiry_view.h
//  sample2
//
//  Created by Mac on 2/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "c_expiry_collcellCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>


@interface c_expiry_view : UIView
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *collectionData;
@property (strong, nonatomic) NSMutableDictionary *Dict;
@property()int janu;
- (void)setCollectionData:(NSArray *)collectionData;


@end
