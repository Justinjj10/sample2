//
//  emp_doc_expcell.h
//  sample2
//
//  Created by Mac on 6/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "emp_doc_exp_view.h"

@interface emp_doc_expcell : UITableViewCell
@property()int janu;
@property (strong, nonatomic) emp_doc_exp_view *collectionView;
- (void)setCollectionData:(NSArray *)collectionData;




@end
