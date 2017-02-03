//
//  details.m
//  spon
//
//  Created by Manesh on 12/12/2016.
//  Copyright © 2016 Manesh. All rights reserved.
//

#import "details.h"

@implementation details

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    self.homeimg.image=[UIImage imageNamed:@"homeblue"];
     [self.Home setTitleColor:[UIColor  blueColor] forState:UIControlStateNormal];
    
  
    
    // Initialization code
}


-(void)mymethods:(UIImageView *)myImage{
    
    
    
//    UIImageView *image =myImage.image;
//    myImage.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    [myImage setTintColor:[UIColor redColor]];
    
    
    
    
    
    
    UIImage *image = myImage.image;
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
   CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
  CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage  scale:1.0 orientation:UIImageOrientationDown];
    
    myImage.image = flippedImage;
    
 
    
    
}

//-(void)mymethods2:(UIImageView *)myImage{
//    
//    
//    UIImage *image = myImage.image;
//    
//    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//   CGContextClipToMask(context, rect, image.CGImage);
//    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
// CGContextFillRect( context,rect);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
//                                               scale:1.0 orientation: UIImageOrientationUp];
//    
//    myImage.image = flippedImage;
//    
//    
//    
//    
//}
//

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)COMPANY:(id)sender {
    
    
    
    if(flag==1)//original place
    {
        
         [self.btnVisa setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [self.btnNoti setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [self.btnEmploy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.Home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        
        [self.btnCMPNY setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        self.compimg.image=[UIImage imageNamed:@"company1"];
        
        self.cadd.image=[UIImage imageNamed:@"add2"];
        
        self.eadd.image=[UIImage imageNamed:@"add2"];
        self.vadd.image=[UIImage imageNamed:@"add2"];
        self.nadd.image=[UIImage imageNamed:@"add2"];



        
        
        
        
        
        self.homeimg.image=[UIImage imageNamed:@"home1"];
        self.notiimg.image=[UIImage imageNamed:@"alarm1"];
        
        self.calimg.image=[UIImage imageNamed:@"calendar1"];
        self.profimg.image=[UIImage imageNamed:@"profile1"];
        self.empimg.image=[UIImage imageNamed:@"employee1"];
        self.visaimg.image=[UIImage imageNamed:@"visa1"];

        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        
        self.comview.frame=CGRectMake(0, 192, self.comview.frame.size.width      , self.comview.frame.size.height);
        
        self.vehview.frame=CGRectMake(0, 228, self.vehview.frame.size.width      , self.vehview.frame.size.height);
        
        self.notiview.frame=CGRectMake(0, 200, self.notiview.frame.size.width      , self.notiview.frame.size.height);
        
        self.calview.frame=CGRectMake(0, 312, self.calview.frame.size.width      , self.calview.frame.size.height);
        

        
        
        [UIView commitAnimations];
        flag=0;
        
    }
    
    else
    {
        [self.btnVisa setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnNoti setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnEmploy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.Home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [self.btnCMPNY setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [self mymethods:self.compimg];
         self.cadd.image=[UIImage imageNamed:@"minus"];
      //  self.cadd.image=[UIImage imageNamed:@"add2"];
        self.homeimg.image=[UIImage imageNamed:@"home1"];
        self.notiimg.image=[UIImage imageNamed:@"alarm1"];
        
        self.calimg.image=[UIImage imageNamed:@"calendar1"];
        self.profimg.image=[UIImage imageNamed:@"profile1"];
        self.empimg.image=[UIImage imageNamed:@"employee1"];
        self.visaimg.image=[UIImage imageNamed:@"visa1"];

        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        
        self.comview.frame=CGRectMake(0, self.comview.frame.origin.y+85, self.comview.frame.size.width      , self.comview.frame.size.height);
        
        
        self.vehview.frame=CGRectMake(0, self.vehview.frame.origin.y+85, self.vehview.frame.size.width      , self.vehview.frame.size.height);
        
        
        self.notiview.frame=CGRectMake(0, self.notiview.frame.origin.y+85, self.notiview.frame.size.width      , self.notiview.frame.size.height);
        
        
        self.calview.frame=CGRectMake(0, self.calview.frame.origin.y+85, self.calview.frame.size.width      , self.calview.frame.size.height);
        

        [UIView commitAnimations];
        flag=1;
        
    }
}

- (IBAction)EMPLOYEE:(id)sender {
    if(flag==1)
    {
        
        [self.btnVisa setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnNoti setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnCMPNY setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.Home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        
        [self.btnEmploy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        self.cadd.image=[UIImage imageNamed:@"add2"];
        
        self.eadd.image=[UIImage imageNamed:@"add2"];
        self.vadd.image=[UIImage imageNamed:@"add2"];
        self.nadd.image=[UIImage imageNamed:@"add2"];
        

        
        
        
        
        self.cadd.image=[UIImage imageNamed:@"add2"];
        self.homeimg.image=[UIImage imageNamed:@"home1"];
        self.notiimg.image=[UIImage imageNamed:@"alarm1"];
        
        
        
          self.compimg.image=[UIImage imageNamed:@"company1"];
        
        self.calimg.image=[UIImage imageNamed:@"calendar1"];
        self.profimg.image=[UIImage imageNamed:@"profile1"];
        self.empimg.image=[UIImage imageNamed:@"employee1"];
        self.visaimg.image=[UIImage imageNamed:@"visa1"];

        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        self.comview.frame=CGRectMake(0, 192, self.comview.frame.size.width      , self.comview.frame.size.height);

        self.vehview.frame=CGRectMake(0, 228, self.vehview   .frame.size.width      , self.vehview.frame.size.height);

        self.notiview.frame=CGRectMake(0, 200, self.notiview.frame.size.width      , self.notiview.frame.size.height);
        
        self.calview.frame=CGRectMake(0, 312, self.calview.frame.size.width      , self.calview.frame.size.height);
        

        
                     [UIView commitAnimations];
        flag=0;
        
    }
    
    else
    {
        [self.btnVisa setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnNoti setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnCMPNY setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.Home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        [self.btnEmploy setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [self mymethods:self.empimg];
        
        
         self.eadd.image=[UIImage imageNamed:@"minus"];
        
        self.homeimg.image=[UIImage imageNamed:@"home"];
        
        self.compimg.image=[UIImage imageNamed:@"company1"];
        self.homeimg.image=[UIImage imageNamed:@"home1"];
        self.notiimg.image=[UIImage imageNamed:@"alarm1"];
        
        self.calimg.image=[UIImage imageNamed:@"calendar1"];
        self.profimg.image=[UIImage imageNamed:@"profile1"];
        //self.empimg.image=[UIImage imageNamed:@"employee1"];
        self.visaimg.image=[UIImage imageNamed:@"visa1"];

        
        
        
      //  self.empimg.image=[UIImage imageNamed:@"employee"];
        
        
//        [self mymethods2:self.homeimg];
//          [self mymethods2:self.compimg];
//
        
        
        
                self.vehview.frame=CGRectMake(0, self.vehview.frame.origin.y+85, self.vehview.frame.size.width      , self.vehview.frame.size.height);
        
        self.notiview.frame=CGRectMake(0, self.notiview.frame.origin.y+85, self.notiview.frame.size.width      , self.notiview.frame.size.height);
        
        self.calview.frame=CGRectMake(0, self.calview.frame.origin.y+85, self.calview.frame.size.width      , self.calview.frame.size.height);
        

        
        [UIView commitAnimations];
        flag=1;
        
    }

}
- (IBAction)VEHICLE:(id)sender {
    
 

    if(flag==1)
    {
     
        [self.btnCMPNY setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnNoti setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnEmploy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.Home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnEmploy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
          [self.btnVisa setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        
        self.cadd.image=[UIImage imageNamed:@"add2"];
        
        self.eadd.image=[UIImage imageNamed:@"add2"];
        self.vadd.image=[UIImage imageNamed:@"add2"];
        self.nadd.image=[UIImage imageNamed:@"add2"];
        

        
        
        
        
        
        self.cadd.image=[UIImage imageNamed:@"add2"];
        self.homeimg.image=[UIImage imageNamed:@"home1"];
        self.notiimg.image=[UIImage imageNamed:@"alarm1"];
        
          self.compimg.image=[UIImage imageNamed:@"company1"];
        
        self.calimg.image=[UIImage imageNamed:@"calendar1"];
        self.profimg.image=[UIImage imageNamed:@"profile1"];
        self.empimg.image=[UIImage imageNamed:@"employee1"];
        self.visaimg.image=[UIImage imageNamed:@"visa1"];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        
        self.vehview.frame=CGRectMake(0, 228, self.vehview   .frame.size.width      , self.vehview.frame.size.height);
        

        
        self.comview.frame=CGRectMake(0, 192, self.comview.frame.size.width      , self.comview.frame.size.height);

        
        self.notiview.frame=CGRectMake(0, 200, self.notiview.frame.size.width      , self.notiview.frame.size.height);
        self.calview.frame=CGRectMake(0, 312, self.calview.frame.size.width      , self.calview.frame.size.height);
        

        
        [UIView commitAnimations];
        flag=0;
        
    }
    
    else
    {
        
        
        [self.btnCMPNY setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnNoti setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnEmploy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        
        [self.Home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        

        [self.btnVisa setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [self mymethods:self.visaimg];
//        [self mymethods2:self.homeimg];
//        [self mymethods2:self.compimg];
//        [self mymethods2:self.empimg];
        
        self.vadd.image=[UIImage imageNamed:@"minus"];
        
//
        self.homeimg.image=[UIImage imageNamed:@"home"];
        
        self.compimg.image=[UIImage imageNamed:@"company1"];
        self.homeimg.image=[UIImage imageNamed:@"home1"];
        self.notiimg.image=[UIImage imageNamed:@"alarm1"];
        
        self.calimg.image=[UIImage imageNamed:@"calendar1"];
        self.profimg.image=[UIImage imageNamed:@"profile1"];
        self.empimg.image=[UIImage imageNamed:@"employee1"];
        //self.visaimg.image=[UIImage imageNamed:@"visa1"];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        
       

        
        self.notiview.frame=CGRectMake(0, self.notiview.frame.origin.y+135, self.notiview.frame.size.width      , self.notiview.frame.size.height);
        
        self.calview.frame=CGRectMake(0, self.calview.frame.origin.y+135, self.calview.frame.size.width      , self.calview.frame.size.height);
        

        
        
        [UIView commitAnimations];
        flag=1;
        
    }

}
- (IBAction)NOTIFICATION:(id)sender {
    if(flag==1)
    {
        [self.btnVisa setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnCMPNY setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnEmploy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        [self.btnNoti setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        
               [self.Home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        
        
        self.cadd.image=[UIImage imageNamed:@"add2"];
        
        self.eadd.image=[UIImage imageNamed:@"add2"];
        self.vadd.image=[UIImage imageNamed:@"add2"];
        self.nadd.image=[UIImage imageNamed:@"add2"];
        

        
        
        
        
        self.cadd.image=[UIImage imageNamed:@"add2"];
        self.homeimg.image=[UIImage imageNamed:@"home1"];
        self.notiimg.image=[UIImage imageNamed:@"alarm1"];
        
          self.compimg.image=[UIImage imageNamed:@"company1"];
        
        self.calimg.image=[UIImage imageNamed:@"calendar1"];
        self.profimg.image=[UIImage imageNamed:@"profile1"];
        self.empimg.image=[UIImage imageNamed:@"employee1"];
        self.visaimg.image=[UIImage imageNamed:@"visa1"];


        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        
        self.vehview.frame=CGRectMake(0, 228, self.vehview   .frame.size.width      , self.vehview.frame.size.height);
        
        
        
        self.comview.frame=CGRectMake(0, 192, self.comview.frame.size.width      , self.comview.frame.size.height);
        
        
        self.notiview.frame=CGRectMake(0, 200, self.notiview.frame.size.width      , self.notiview.frame.size.height);
        self.calview.frame=CGRectMake(0, 312, self.calview.frame.size.width      , self.calview.frame.size.height);
        
        [UIView commitAnimations];
        flag=0;
        
    }
    
    else
    {
        [self.btnVisa setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnCMPNY setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnEmploy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.Home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        
        [self.btnNoti setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        self.nadd.image=[UIImage imageNamed:@"minus"];
        self.homeimg.image=[UIImage imageNamed:@"home"];
        
        self.compimg.image=[UIImage imageNamed:@"company1"];
      //  self.notiimg.image=[UIImage imageNamed:@"alarm"];
        
        self.homeimg.image=[UIImage imageNamed:@"home1"];
        self.notiimg.image=[UIImage imageNamed:@"alarm1"];
        
        //self.calimg.image=[UIImage imageNamed:@"calendar1"];
        self.profimg.image=[UIImage imageNamed:@"profile1"];
        self.empimg.image=[UIImage imageNamed:@"employee1"];
        self.visaimg.image=[UIImage imageNamed:@"visa1"];
        [self mymethods:self.notiimg];
        
//        [self mymethods2:self.visaimg];
//        [self mymethods2:self.homeimg];
//        [self mymethods2:self.compimg];
//        [self mymethods2:self.empimg];
        

        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        
        self.calview.frame=CGRectMake(0, self.calview.frame.origin.y+80, self.calview.frame.size.width      , self.calview.frame.size.height);
        
        [UIView commitAnimations];
        flag=1;
        
    }
}

@end
