//
//  company_list_cell.h
//  sample2
//
//  Created by Mac on 19/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface company_list_cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *labl;
@property (weak, nonatomic) IBOutlet UILabel *c_name;
@property (weak, nonatomic) IBOutlet UILabel *c_code;
@property (weak, nonatomic) IBOutlet UILabel *c_addr;
@property (weak, nonatomic) IBOutlet UILabel *c_phone;
@property (weak, nonatomic) IBOutlet UILabel *c_email;
@property (weak, nonatomic) IBOutlet UIView *cellview;
@property (weak, nonatomic) IBOutlet UILabel *imglabl;

@end
