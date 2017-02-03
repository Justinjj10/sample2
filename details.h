//
//  details.h
//  spon
//
//  Created by Manesh on 12/12/2016.
//  Copyright © 2016 Manesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface details : UITableViewCell

{
    int flag,flag1,flag2,flag3;
}

@property (weak, nonatomic) IBOutlet UIImageView *cellimg;
@property(nonatomic,strong)IBOutlet UIButton *Home;


@property(nonatomic,strong)IBOutlet UIButton *comp_complist;
@property(nonatomic,strong)IBOutlet UIButton *comp_docexpiry;


@property(nonatomic,strong)IBOutlet UIButton *comp_docstatus;
@property(nonatomic,strong)IBOutlet UIButton *emp_list;
@property(nonatomic,strong)IBOutlet UIButton *emp_docstatus;
@property(nonatomic,strong)IBOutlet UIButton *emp_doc_expiry;


@property(nonatomic,strong)IBOutlet UIButton *visa_list;

@property(nonatomic,strong)IBOutlet UIButton *visa_payment;
@property(nonatomic,strong)IBOutlet UIButton *visa_travel;
@property(nonatomic,strong)IBOutlet UIButton *visa_setting;










@property(nonatomic,strong)IBOutlet UIButton *btnCMPNY;
@property(nonatomic,strong)IBOutlet UIButton *btnEmploy;
@property(nonatomic,strong)IBOutlet UIButton *btnVisa;
@property(nonatomic,strong)IBOutlet UIButton *btnNoti;

@property(nonatomic,strong)IBOutlet UIButton *noti_vehistatus;


@property(nonatomic,strong)IBOutlet UIButton *calender_emp;
@property(nonatomic,strong)IBOutlet UIButton *calender_comp;
@property(nonatomic,strong)IBOutlet UIButton *calender_vehicle;


@property(nonatomic,strong)IBOutlet UIButton *calender;
@property(nonatomic,strong)IBOutlet UIButton *Myprofile;
@property(nonatomic,strong)IBOutlet UIButton *Logout;


@property(nonatomic,strong)IBOutlet UIView *comview;

@property(nonatomic,strong)IBOutlet UIView *vehview;
@property(nonatomic,strong)IBOutlet UIView *notiview;

@property(nonatomic,strong)IBOutlet UIView *calview;


@property(nonatomic,strong)IBOutlet UIImageView *homeimg;
@property(nonatomic,strong)IBOutlet UIImageView *compimg;
@property(nonatomic,strong)IBOutlet UIImageView *empimg;
@property(nonatomic,strong)IBOutlet UIImageView *visaimg;
@property(nonatomic,strong)IBOutlet UIImageView *notiimg;


@property(nonatomic,strong)IBOutlet UIImageView *calimg;
@property(nonatomic,strong)IBOutlet UIImageView *profimg;



@property(nonatomic,strong)IBOutlet UIImageView *cadd;
@property(nonatomic,strong)IBOutlet UIImageView *eadd;
@property(nonatomic,strong)IBOutlet UIImageView *vadd;
@property(nonatomic,strong)IBOutlet UIImageView *nadd;

//@property() void mymethods:(UIImageView *);















@end
