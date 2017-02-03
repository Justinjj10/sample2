//
//  page1.m
//  sample2
//
//  Created by Mac on 10/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "page1.h"
#import "pagecell1.h"
#import "testView.h"
#import "SlideNavigationController.h"
#import "slidemenudetailViewController.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"
#import "company_list.h"
#import "emp_list.h"
#import "new_visa_list.h"
#import "comp_noti.h"
#import "emp_noti.h"
#import "visa_noti.h"
#import "visa_payment.h"
#import "emp_desig.h"

@interface page1 ()<SlideNavigationControllerDelegate>
{
    pagecell1 *ob;
    UIView *view1;
    UIView *viewMain,*vieww;
    NSMutableDictionary *Dict;
    NSString *str;
    
    

    
    
    testView * m_testView;
    NSTimer* m_timer;
    UIImageView *img;
    
    UIActivityIndicatorView *spinner;
   GlobalMethods*globalMethod;
    MBProgressHUD *hud;
    
    
    

}

@end

@implementation page1

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController se]
//    [NSTimer scheduledTimerWithTimeInterval:5.0
//                                     target:self
//                                   selector:@selector(targetMethod:)
//                                   userInfo:nil
//                                    repeats:YES];
//    
//  _btn1.backgroundColor=[self colorFromHexString:@"#d50000"];
//    _btn2.backgroundColor=[self colorFromHexString:@"#5FB444"];
//    _btn2.backgroundColor=[self colorFromHexString:@"#3e51b5"];
//      _btn2.backgroundColor=[self colorFromHexString:@"#ec7500"];
    
    
    
    _elabel1.text=@"Employee";
    _vlabel1.text=@"Visa";
    _olabel1.text=@"Notification";
    
    
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [self.navigationItem setHidesBackButton:YES];
    
    
    
    
    NSString* imageName;
    // int aRandomNumber = arc4random() % 10;
    imageName =[NSString stringWithFormat:@"blue.jpg"];
    self.homeView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:imageName]]];
    
    //self.homeView.backgroundColor=[UIColor whiteColor];
    
//    m_testView = [[testView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.frame.size.width,self.homeView.frame.size.height)];
////    m_testView.percent =nil;
    [self.homeView addSubview:m_testView];
    //[m_testView removeFromSuperview];
    
   // NSLog(@" the key:%@",self.ssurl);
    
    hud.center = CGPointMake(self.view.frame.size.width  / 2,
                                     self.view.frame.size.height / 2);


    
    
//
//    img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, m_testView.frame.size.width, m_testView.frame.size.height)];
//    
//    [m_testView addSubview:img];
//    img.image=[UIImage imageNamed:@"bg"];
//    
    
    
//    
//    [NSTimer scheduledTimerWithTimeInterval:5.0
//                                     target:self
//                                   selector:@selector(targetMethod:)
//                                   userInfo:nil
//     ]                               repeats:YES];
//
    
  
    
    [self fetchData];
    
    [self viewPage];
    
  
}



-(IBAction)targetMethod:(id)sender
{



    if (_flag1==0) {


        m_testView = [[testView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.frame.size.width,self.homeView.frame.size.height)];
        
        
        NSString *s=[NSString stringWithFormat:@"%@",[Dict objectForKey:@"company_count"]];

        m_testView.percent =[s intValue];
        [self.homeView addSubview:m_testView];
        
        
       
        m_testView.lab.text=@"  Company";
        m_testView.imgg.image=[UIImage imageNamed:@"cmp"];

        _flag1=1;

    }

   else if (_flag1==1) {


       m_testView = [[testView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.frame.size.width,self.homeView.frame.size.height)];
       m_testView.percent =0;
       [self.homeView addSubview:m_testView];
       
       
       
       NSString *s=[NSString stringWithFormat:@"%@",[Dict objectForKey:@"employee_count"]];
       
       m_testView.percent =[s intValue];
        m_testView.lab.text=@"  Employee";
       m_testView.imgg.image=[UIImage imageNamed:@"emp"];
        _flag1=2;

    }
   else if (_flag1==2) {


       m_testView = [[testView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.frame.size.width,self.homeView.frame.size.height)];
       m_testView.percent =0;
       [self.homeView addSubview:m_testView];
       
       
       
       NSString *s=[NSString stringWithFormat:@"%@",[Dict objectForKey:@"vehicle_count"]];
       
       m_testView.percent =[s intValue];
       m_testView.lab.text=@"     Visa";
       m_testView.imgg.image=[UIImage imageNamed:@"visa2"];


      _flag1=3;
      

   }
   else if (_flag1==3) {


       m_testView = [[testView alloc] initWithFrame:CGRectMake(0, 0, self.homeView.frame.size.width,self.homeView.frame.size.height)];
      /// NSString *s=[NSString stringWithFormat:@"%@",[Dict objectForKey:@"notification_count"]];
       
      // m_testView.percent =[s intValue];
       [self.homeView addSubview:m_testView];
       m_testView.lab.text=@"00";
       
       m_testView.imgg.image=[UIImage imageNamed:@"Icon-App-20x20"];

       _flag1=0;

   }
}

#pragma service
    
    
    -(void)fetchData
    {
        
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^ {
           [self showHud];
            BOOL userexits;
            
            userexits=  [self urlList_Requesttri2  ];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                if(!userexits){
                    [self hideHud];
                    if([globalMethod connected      ]){
                        NSLog(@"coneccttedddd");
                        
                        
                        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Network Problem" message:@"You are connected to slow internet or no network found." preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                        [alert addAction:okAction];
                        
                        
                        [self presentViewController: alert animated:YES completion:nil];
                        
                        
                    }
                    else{
                        NSLog(@"nooooo");
                        
                        
                        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Please Try Again" message:@"The Internet connection appears to be offline." preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                        [alert addAction:okAction];
                        
                        
                        [self presentViewController: alert animated:YES completion:nil];
                        
                        
                    }
                    
                    
                }
                
                
//                else
//                {
//                    
//                    
//                    if (([[Dict objectForKey:@"message"] isEqualToString:@"successfully"])   ){
//                        
//                        
//                        
//                        
//                        
//                        //                        NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
//                        //                        [UserDefaults setObject:[Dict objectForKey:@"authentication_key"] forKey:@"LoginData"];
//                        //                   [UserDefaults synchronize];
//                        
//                        //                        NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
//                        //                        [UserDefaults setObject:cellcategory.txtname.text forKey:@"name"];
//                        //
//                        //                        [UserDefaults setObject:[Dict objectForKey:@"id"] forKey:@"UserId"];
//                        //
//                        //
//                        //// if ([self.txtpassword.text isEqualToString:[Dict objectForKey:@"password"]]) {
//                        //
//                        //
//                        //                        [UserDefaults synchronize];
//                        //
//                        
//                        
//                       
//                        
//                        
//                    }
//                    
//                    
//                    else{
//                        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Alert" message:[Dict objectForKey:@"message"]preferredStyle:UIAlertControllerStyleAlert];
//                        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//                        [alert addAction:okAction];
//                        
//                        
//                        [self presentViewController: alert animated:YES completion:nil];
//                    }
                    
                    //
                    
                
            
                    
                else{
                    
                                      
                    [self viewPage];
                      [self decrementSpin];
                   // [self targetMethod];
                    
                    [NSTimer scheduledTimerWithTimeInterval:5.0
                target:self
                selector:@selector(targetMethod:)
                userInfo:nil
                repeats:YES];
                    

                    
                  //  [self calculate];
                    
                [self hideHud];
                    
                }
                    
                
                
                
            });
        });
        
    }
    
    
    
    
    -(BOOL)urlList_Requesttri2
    {
        
        
        
        
        //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
        
        
        NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/LoginApi/dashboard?admin_id=1&Authorization=%@",self.ssurl];
        
        
        

        
        
        
        
        
        
        
        
        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
        urlRequest.URL = [NSURL URLWithString:urlString];
        
        [urlRequest setHTTPMethod:@"GET"];
        [urlRequest addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-type"];
        
        NSHTTPURLResponse *response = nil;
        NSError *error ;
        NSData *returnData =[NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
//        
//        NSString* newStr = [NSString stringWithUTF8String:[returnData bytes]];
//        NSLog(@"return data %@",newStr);
        
        
        
        if (returnData == nil) {
            
            
            return NO;
        }
        
        else if([returnData length] >0 && error == nil) {
            
            
            
            Dict= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
            
            
        
            NSLog(@"%@",Dict);
            
        
            
            
            
            
            
            return YES;
            
        }
        return YES;
    }
    

    
    
    
    
    
    
    
-(void)showHud{
    hud =  [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    hud.frame = CGRectMake(0, 0, 120, 143);
    
    //     hud.mode = MBProgressHUDModeDeterminate;
    hud.detailsLabelText = @"Loading...";
    hud.detailsLabelFont=[UIFont systemFontOfSize:16];
    
    [self.view addSubview:hud];
    hud.dimBackground = YES;
    [hud show:YES];
}
-(void)hideHud{
    [hud hide:YES];
}

-(void)viewPage
{
    
    
    _clabel2.text=[NSString stringWithFormat :@"%@", [Dict objectForKey:@"company_count"]];    // [Dict objectForKey:@"company_count"];
    _elabel2.text=[NSString stringWithFormat :@"%@", [Dict objectForKey:@"employee_count"]];;//[Dict objectForKey:@"employee_count"];
    _vlabel2.text=[NSString stringWithFormat :@"%@", [Dict objectForKey:@"vehicle_count"]];    _olabel2.text=[NSString stringWithFormat :@"%@", [Dict objectForKey:@"notification_count"]];


}












- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}
- (IBAction)bounceMenu:(id)sender
{
    static Menu menu = MenuLeft;
    
    [[SlideNavigationController sharedInstance] bounceMenu:menu withCompletion:nil];
    
    menu = (menu == MenuLeft) ? MenuRight : MenuLeft;
}

- (IBAction)slideOutAnimationSwitchChanged:(UISwitch *)sender
{
    ((slidemenudetailViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled = sender.isOn;
}

- (IBAction)limitPanGestureSwitchChanged:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].panGestureSideOffset = (sender.isOn) ? 50 : 0;
}

- (IBAction)changeAnimationSelected:(id)sender
{
    [[SlideNavigationController sharedInstance] openMenu:MenuRight withCompletion:nil];
}

- (IBAction)shadowSwitchSelected:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].enableShadow = sender.isOn;
}

- (IBAction)enablePanGestureSelected:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].enableSwipeGesture = sender.isOn;
}

//- (IBAction)portraitSlideOffsetChanged:(UISegmentedControl *)sender
//{
//    [SlideNavigationController sharedInstance].portraitSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
//}
//
//- (IBAction)landscapeSlideOffsetChanged:(UISegmentedControl *)sender
//{
//    [SlideNavigationController sharedInstance].landscapeSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
//}


- (void)decrementSpin
{
    // If we can decrement our percentage, do so, and redraw the view
    if (m_testView.percent < 500) {
        m_testView.percent = m_testView.percent +1;
       [m_testView setNeedsDisplay];
    }
    else {
        [m_timer invalidate];
        m_timer = nil;
    }
}




- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


//-(IBAction)targetMethod:(id)sender
//{
//    
//    
//    
//    if (flag1==0) {
//        
//        
//        self.HomeImg.backgroundColor=[UIColor redColor];
//        
//        flag1=1;
//        
//    }
//    
//   else if (flag1==1) {
//        
//        
//        self.HomeImg.backgroundColor=[UIColor yellowColor];
//        
//        flag1=2;
//        
//    }
//   else if (flag1==2) {
//       
//       
//       self.HomeImg.backgroundColor=[UIColor greenColor];
//       
//       flag1=3;
//       
//   }
//   else if (flag1==3) {
//       
//       
//       self.HomeImg.backgroundColor=[UIColor blueColor];
//       
//       flag1=0;
//       
//   }
//}

-(IBAction)Btn1View:(id)sender
{
    
   
  
    
    view1=[[UIView alloc]initWithFrame:CGRectMake(self.btn1.frame.origin.x+5, self.btn1.frame.origin.y+5, self.btn1.frame.size.width-10, 130)];
    
    
    view1.backgroundColor=[UIColor clearColor];
    
    
    
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.btn1.frame.size.width-10, 40)];
   // UIColor *col=[UIColor colo]
    btn.backgroundColor=[self colorFromHexString:@"#F73CC2"];
 
//    [ btn.titleLabel. :[UIFont fontWithName:@"Arial-Bold" size:14.0 ]];;
    [btn setTitle:@"   Company" forState:UIControlStateNormal];
  [btn.titleLabel setFont:[UIFont systemFontOfSize:18.0f ]];
    
    
    [  btn addTarget:self action:@selector(CompList) forControlEvents:UIControlEventTouchUpInside];
    
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view1 addSubview:btn];
    
    
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(0, 40, self.btn1.frame.size.width-10, 40)];
    
    btn2.backgroundColor=[self colorFromHexString:@"#15eb66"];
    [btn2 setTitle:@"   Employee" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [  btn2 addTarget:self action:@selector(CompEmp) forControlEvents:UIControlEventTouchUpInside];


    [view1 addSubview:btn2];
    
    
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(0, 80, self.btn1.frame.size.width-10, 40)];
    
    btn3.backgroundColor=[self colorFromHexString:@"f6F38FA"];
    
    [btn3 setTitle:@"   Alert" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [  btn3 addTarget:self action:@selector(CompAlert) forControlEvents:UIControlEventTouchUpInside];

    
    
    [view1 addSubview:btn3];
    
    
    viewMain=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    viewMain.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];
    
    
    [self.view addSubview:viewMain];
   [viewMain addSubview:view1];
    
        
        viewMain.userInteractionEnabled=YES;
        UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(highlightLetter:)];

    [viewMain addGestureRecognizer:letterTapRecognizer];
    btn.frame=CGRectMake(0, 0, self.btn1.frame.size.width-10, 30);

    btn2.frame=CGRectMake(0, 0, self.btn1.frame.size.width-10, 30);
    btn3.frame=CGRectMake(0, 0, self.btn1.frame.size.width-10,30);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [btn2.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [btn3.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];

    
    
    
    UIImageView *img1=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
    //img1.backgroundColor=[UIColor yellowColor];
    [btn addSubview:img1];
    
    img1.image=[UIImage imageNamed:@"cmppink"];
    
    UIImageView *img2=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
    //img2.backgroundColor=[UIColor yellowColor];
    [btn2 addSubview:img2];
    
    img2.image=[UIImage imageNamed:@"empgreen"];
    UIImageView *img3=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
  //  img3.backgroundColor=[UIColor yellowColor];
    [btn3 addSubview:img3];
    
    img3.image=[UIImage imageNamed:@"Icon-App-20x20"];
    
    
    
   
    
    [UIView beginAnimations:nil context:NULL];
   [UIView setAnimationDuration:1];
    
    btn.frame=CGRectMake(0, 0, self.btn1.frame.size.width-10, 40);
    btn2.frame=CGRectMake(0, 40, self.btn1.frame.size.width-10, 40);
    
    
    btn3.frame=CGRectMake(0, 80, self.btn1.frame.size.width-10, 40);

    
    [UIView commitAnimations        ];
    

  
    
}

-(IBAction)CompList//:(id)sender)
{
    company_list *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"company_list"];
    obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];
    [self.navigationController pushViewController:obb animated:YES];

}

-(IBAction)CompEmp//:(id)sender)
{
    company_list *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"company_list"];
   obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];
    [self.navigationController pushViewController:obb animated:YES];
    
}

-(IBAction)CompAlert//:(id)sender)
{
    comp_noti *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"CompNoti"];
    obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];
    [self.navigationController pushViewController:obb animated:YES];
    
}





-(IBAction)Btn2View:(id)sender
{
    
    
    
    
    view1=[[UIView alloc]initWithFrame:CGRectMake(self.btn2.frame.origin.x+5, self.btn2.frame.origin.y+5, self.btn1.frame.size.width-10, 130)];
    
    
    view1.backgroundColor=[UIColor clearColor];
    
    
    
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.btn2.frame.size.width-10, 40)];
    // UIColor *col=[UIColor colo]
    btn.backgroundColor=[self colorFromHexString:@"#F73CC2"];
    
    //    [ btn.titleLabel. :[UIFont fontWithName:@"Arial-Bold" size:14.0 ]];;
    [btn setTitle:@"   Employee" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:18.0f ]];
    
    
    
    [  btn addTarget:self action:@selector(EmpList) forControlEvents:UIControlEventTouchUpInside];
    

    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view1 addSubview:btn];
    
    
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(0, 40, self.btn2.frame.size.width-10, 40)];
    
    btn2.backgroundColor=[self colorFromHexString:@"#15eb66"];
    [btn2 setTitle:@"   List" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [  btn2 addTarget:self action:@selector(EmpList1) forControlEvents:UIControlEventTouchUpInside];
    

   
    [view1 addSubview:btn2];
    
    
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(0, 80, self.btn2.frame.size.width-10, 40)];
    
    btn3.backgroundColor=[self colorFromHexString:@"f6F38FA"];
   
    [btn3 setTitle:@"   Alert" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [  btn3 addTarget:self action:@selector(EmpAlert) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    [view1 addSubview:btn3];
    
    
    viewMain=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    viewMain.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];
    
    
    [self.view addSubview:viewMain];
    [viewMain addSubview:view1];
    
    
    viewMain.userInteractionEnabled=YES;
    UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(highlightLetter:)];
    
    [viewMain addGestureRecognizer:letterTapRecognizer];
      btn.frame=CGRectMake(0, 0, self.btn2.frame.size.width-10, 30);
    btn2.frame=CGRectMake(0, 0, self.btn2.frame.size.width-10, 30);
    btn3.frame=CGRectMake(0, 0, self.btn2.frame.size.width-10, 30);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [btn2.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [btn3.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    
    
    
    
    UIImageView *img1=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
       [btn addSubview:img1];
    
    
    
    UIImageView *img2=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
 
    [btn2 addSubview:img2];
    
    
    UIImageView *img3=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
   
    [btn3 addSubview:img3];
    
    img1.image=[UIImage imageNamed:@"emppink"];
    img2.image=[UIImage imageNamed:@"list"];
    img3.image=[UIImage imageNamed:@"Icon-App-20x20"];

    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    btn.frame=CGRectMake(0, 0, self.btn2.frame.size.width-10, 40);
    btn2.frame=CGRectMake(0, 40, self.btn2.frame.size.width-10, 40);
    
    
    btn3.frame=CGRectMake(0,80, self.btn2.frame.size.width-10, 40);
    
    
    [UIView commitAnimations        ];
    
    
    
    
}


-(IBAction)EmpList//:(id)sender)
{
    
    emp_list *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"empdetails"];
   obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];    [self.navigationController pushViewController:obb animated:YES];
 
}

-(IBAction)EmpList1//:(id)sender)
{
    
    emp_desig *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"EmpDesig"];
   obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];
    [self.navigationController pushViewController:obb animated:YES];
    
}

-(IBAction)EmpAlert//:(id)sender)
{
    
    emp_noti *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"EmpNoti"];
   obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];    [self.navigationController pushViewController:obb animated:YES];
    
}







-(IBAction)Btn3View:(id)sender

{
    
    view1=[[UIView alloc]initWithFrame:CGRectMake(self.btn3.frame.origin.x+5, self.btn3.frame.origin.y-5, self.btn3.frame.size.width-10, 130)];
    
    
    view1.backgroundColor=[UIColor clearColor];
    
 
    
  
    
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.btn3.frame.size.width-10, 40)];
    
   btn.backgroundColor=[self colorFromHexString:@"#F73CC2"];
    [btn setTitle:@"   Visa" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [  btn addTarget:self action:@selector(VisaList) forControlEvents:UIControlEventTouchUpInside];

    
    [view1 addSubview:btn];
    
    
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(0, 40, self.btn3.frame.size.width-10, 40)];
    
 btn2.backgroundColor=[self colorFromHexString:@"#15eb66"];
    [btn2 setTitle:@"   List" forState:UIControlStateNormal];
    
    [  btn2 addTarget:self action:@selector(VisaPayment) forControlEvents:UIControlEventTouchUpInside];

    
    
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view1 addSubview:btn2];
    
    
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(0, 80, self.btn3.frame.size.width-10, 40)];
    
    btn3.backgroundColor=[self colorFromHexString:@"f6F38FA"];
    [btn3 setTitle:@"   Alert" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [  btn3 addTarget:self action:@selector(VisaAlert) forControlEvents:UIControlEventTouchUpInside];

    
    
    [view1 addSubview:btn3];
    
    
    viewMain=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    viewMain.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];
    
    
    [self.view addSubview:viewMain];
    [viewMain addSubview:view1];
    
    
    viewMain.userInteractionEnabled=YES;
    UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(highlightLetter:)];
    
    [viewMain addGestureRecognizer:letterTapRecognizer];
   btn3.frame=CGRectMake(0, 80, self.btn3.frame.size.width-10, 30);
  btn.frame=CGRectMake(0, 80, self.btn3.frame.size.width-10, 30);
    btn2.frame=CGRectMake(0, 80, self.btn3.frame.size.width-10, 30);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize: 16.0f]];
    [btn2.titleLabel setFont:[UIFont boldSystemFontOfSize: 16.0f]];
    [btn3.titleLabel setFont:[UIFont boldSystemFontOfSize: 16.0f]];
    
    
    
    
    UIImageView *img1=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
   
    [btn addSubview:img1];
    
    
    
    UIImageView *img2=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
  
    [btn2 addSubview:img2];
    
    
    UIImageView *img3=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
   
    [btn3 addSubview:img3];
    
    img1.image=[UIImage imageNamed:@"visapink"];
    img2.image=[UIImage imageNamed:@"list"];
    img3.image=[UIImage imageNamed:@"Icon-App-20x20"];

    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    
    btn.frame=CGRectMake(0, 0, self.btn3.frame.size.width-10, 40);
    
    
    btn2.frame=CGRectMake(0, 40, self.btn3.frame.size.width-10, 40);
     btn3.frame=CGRectMake(0, 80, self.btn3.frame.size.width-10, 40);
    
    [UIView commitAnimations        ];
    
    
    
    
    
    
    
    
    
    
}



-(IBAction)VisaList//:(id)sender)
{
    
    new_visa_list *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaList"];
   obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];    [self.navigationController pushViewController:obb animated:YES];
    
}



-(IBAction)VisaPayment//:(id)sender)
{
    
    visa_payment *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaPayment"];
   obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];
    [self.navigationController pushViewController:obb animated:YES];
    
}


-(IBAction)VisaAlert//:(id)sender)
{
    
    visa_noti *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaNoti"];
  obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];
    [self.navigationController pushViewController:obb animated:YES];
    
}






-(IBAction)Btn4View:(id)sender

{
    
    
    
    view1=[[UIView alloc]initWithFrame:CGRectMake(self.btn4.frame.origin.x+5, self.btn4.frame.origin.y-5, self.btn4.frame.size.width-10, 130)];
    
    
    view1.backgroundColor=[UIColor clearColor];
    
    
    
    
    
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.btn4.frame.size.width-10, 40)];
    
    btn.backgroundColor=[self colorFromHexString:@"#F73CC2"];
    [btn setTitle:@"   Company" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [  btn addTarget:self action:@selector(CompNoti) forControlEvents:UIControlEventTouchUpInside];

    
    
    [view1 addSubview:btn];
    
    
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(0, 40, self.btn4.frame.size.width-10, 40)];
    
    btn2.backgroundColor=[self colorFromHexString:@"#15eb66"];
    [btn2 setTitle:@"   Employee" forState:UIControlStateNormal];
    
    [  btn2 addTarget:self action:@selector(Empnoti) forControlEvents:UIControlEventTouchUpInside];

    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view1 addSubview:btn2];
    
    
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(0, 80, self.btn4.frame.size.width-10, 40)];
    
    btn3.backgroundColor=[self colorFromHexString:@"#8034f7"];
    [btn3 setTitle:@"   Visa" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [  btn3 addTarget:self action:@selector(VisaNoti) forControlEvents:UIControlEventTouchUpInside];

    [view1 addSubview:btn3];
    
    
    viewMain=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    viewMain.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];
    
    
    [self.view addSubview:viewMain];
    [viewMain addSubview:view1];
    
    
    viewMain.userInteractionEnabled=YES;
    UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(highlightLetter:)];
    
    [viewMain addGestureRecognizer:letterTapRecognizer];
     btn3.frame=CGRectMake(0, 80, self.btn4.frame.size.width-10, 30);
    btn.frame=CGRectMake(0, 80, self.btn4.frame.size.width-10, 30);
    btn2.frame=CGRectMake(0, 80, self.btn4.frame.size.width-10, 30);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize: 14.0f]];
    [btn2.titleLabel setFont:[UIFont boldSystemFontOfSize: 14.0f]];
    [btn3.titleLabel setFont:[UIFont boldSystemFontOfSize: 14.0f]];
    
    
    
    
    UIImageView *img1=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
 
    [btn addSubview:img1];
    
    
    
    UIImageView *img2=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
 
    [btn2 addSubview:img2];
    
    
    UIImageView *img3=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width-40, 5, 25, 30)];
    
       [btn3 addSubview:img3];
    

    img1.image=[UIImage imageNamed:@"cmppink"];
    img2.image=[UIImage imageNamed:@"empgreen"];
    img3.image=[UIImage imageNamed:@"visaviolet"];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    
    btn.frame=CGRectMake(0, 0, self.btn4.frame.size.width-10, 40);
    
    
    btn2.frame=CGRectMake(0, 40, self.btn4.frame.size.width-10, 40);
    
    btn3.frame=CGRectMake(0, 80, self.btn4.frame.size.width-10, 40);
    [UIView commitAnimations        ];
    
    
    
    
    
    
    
    
    
    
}


-(IBAction)CompNoti//:(id)sender)
{
    comp_noti *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"CompNoti"];
   obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];    [self.navigationController pushViewController:obb animated:YES];
    
}

-(IBAction)Empnoti//:(id)sender)
{
    
    emp_noti *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"EmpNoti"];
    obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];
    [self.navigationController pushViewController:obb animated:YES];
    
}

    

-(IBAction)VisaNoti//:(id)sender)
{
    
    visa_noti *obb=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaNoti"];
   obb.ss=[[Dict objectForKey:@"admin_details"] objectForKey:@"authentication_key"];    [self.navigationController pushViewController:obb animated:YES];
    
}

    
    
    
    



- (void)highlightLetter:(UITapGestureRecognizer*)sender {
    [viewMain removeFromSuperview];}


    
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
