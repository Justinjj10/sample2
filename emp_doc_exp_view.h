//
//  emp_doc_exp_view.h
//  sample2
//
//  Created by Mac on 3/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface emp_doc_exp_view : UIView
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *collectionData;
@property (strong, nonatomic) NSMutableDictionary *Dict;
@property()int janu;
@end
