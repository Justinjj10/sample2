//
//  Reportlist.h
//  spon
//
//  Created by Manesh on 16/1/17.
//  Copyright © 2017 Manesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Reportlist : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *reportname;
@property (weak, nonatomic) IBOutlet UILabel *refno;
@property (weak, nonatomic) IBOutlet UILabel *client;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *entry;
@property (weak, nonatomic) IBOutlet UILabel *expiry;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *celllabl;


@end
