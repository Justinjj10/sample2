//
//  emp_list_cell.h
//  sample2
//
//  Created by Mac on 21/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface emp_list_cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ename;
@property (weak, nonatomic) IBOutlet UILabel *ecode;
@property (weak, nonatomic) IBOutlet UILabel *eaddres;
@property (weak, nonatomic) IBOutlet UILabel *ephone;
@property (weak, nonatomic) IBOutlet UILabel *eemail;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *imglabl;

@end
