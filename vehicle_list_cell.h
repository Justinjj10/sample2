//
//  vehicle_list_cell.h
//  sample2
//
//  Created by Mac on 21/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vehicle_list_cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *vname;
@property (weak, nonatomic) IBOutlet UILabel *vmodel;
@property (weak, nonatomic) IBOutlet UILabel *vmanufac;
@property (weak, nonatomic) IBOutlet UILabel *vcode;
@property (weak, nonatomic) IBOutlet UILabel *vaddres;
@property (weak, nonatomic) IBOutlet UILabel *vholder;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *imglabl;

@end
