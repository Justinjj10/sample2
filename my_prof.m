//
//  my_prof.m
//  sample2
//
//  Created by Mac on 19/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "my_prof.h"

#import "ProTabCell.h"
#import "GlobalMethods.h"
#import "SlideNavigationController.h"
#import "slidemenudetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "MBProgressHUD.h"
#import <QuartzCore/QuartzCore.h>
#define kBorderWidth 3.0
#define kCornerRadius 8.0
@interface my_prof ()
{
    NSMutableDictionary *Dict;
    
    NSString *str;
    GlobalMethods * globalMethod;
    
    ProTabCell *procell;
    UIButton *b1,*pv1,*pv2;
    UIView *pv;
    MBProgressHUD *hud;
    
    
}

@end

@implementation my_prof
int flag;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    Dict=[[NSMutableDictionary alloc]init];
    
    
    Dict = [[NSMutableDictionary alloc]init];
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    Dict = [def objectForKey:@"CompanyDetails"];
    
    
    
    
      NSString *p=[[Dict objectForKey:@"admin_data"]valueForKey:@"phone"];
    
    _phone.text=p;
    
    
    self.profimg.layer.borderWidth = 3.0f;
    
    self.profimg.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.profimg.layer.cornerRadius = self.profimg.frame.size.width / 2;
    self.profimg.clipsToBounds = YES;
    
 
    

    CALayer *borderLayer = [CALayer layer];
    CGRect borderFrame = CGRectMake(0, 0, (_profimg.frame.size.width), (_profimg.frame.size.height));
    [borderLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
    [borderLayer setFrame:borderFrame];
    [borderLayer setCornerRadius:kCornerRadius];
    [borderLayer setBorderWidth:kBorderWidth];
    [borderLayer setBorderColor:[[UIColor redColor] CGColor]];
    [_profimg.layer addSublayer:borderLayer];
    
    [self fetchData];

    
    
    // Do any additional setup after loading the view.
}








-(IBAction)rgt:(id)sender // action for plus button

{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    // 1
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"CALL"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"You pressed button one");
                                                              
                                                              //code to make call
                                                              
                                                              NSString *ss=[[Dict objectForKey:@"admin_data"]valueForKey:@"phone"];
                                                              
                                                              NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",ss]];
                                                              
                                                              if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
                                                                  [[UIApplication sharedApplication] openURL:phoneUrl options:@{}
                                                                                           completionHandler:^(BOOL success) {
                                                                                               // NSLog(@"Open %@: %d",scheme,success);
                                                                                           }];

                                                              }
                                                              
                                                              
                                                              
                                                              
                                                          }
                                  ]; // 2
    
    
    
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"MAIL"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                               NSLog(@"You pressed button two");
                                                               
                                                               
                                                               //code to send email
                                                               
                                                               
                                                               NSString *ss=[[Dict objectForKey:@"admin_data"]valueForKey:@"email"];
                                                               NSArray *arr=[NSArray arrayWithObject:ss];

                                                               MFMailComposeViewController *comp=[[MFMailComposeViewController alloc]init];
                                                               [comp setMailComposeDelegate:self];
                                                               if([MFMailComposeViewController canSendMail]) {
                                                                   [comp setToRecipients:arr];
                                                                   [comp setSubject:@"From my app"];
                                                                   //[comp setMessageBody:@"Haiiiiii " isHTML:NO];
                                                                   [comp setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
                                                                   [self presentViewController:comp animated:YES completion:nil];
                                                               }
                                                               else {
                                                                   UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                                                                   UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                                                   [alert addAction:okAction];
                                                                   
                                                                   
                                                                   [self presentViewController: alert animated:YES completion:nil];
                                                                   
                                                                   
                                                                   
                                                                   
                                                               }
                                                               
                                                               
                                                               
                                                               
                                                               
                                                           }]; // 3
    
    UIAlertAction *thirdAction = [UIAlertAction actionWithTitle:@"CANCEL"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"You pressed button three");
                                                          }]; // 4
    
    
    [alert addAction:firstAction]; // 5
    [alert addAction:secondAction]; // 6
    [alert addAction:thirdAction]; // 7
    
    [self presentViewController:alert animated:YES completion:nil]; // 6
    
}



- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:
(MFMailComposeResult)result error:(NSError *)error {
    if(error) {
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self dismissViewControllerAnimated:NO completion:nil];

        
        
        
    }
    

    else {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    
    
}










-(IBAction)buttp
{
    // b1 button rotation animation
    
    [UIView animateWithDuration:0.4f delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.view.autoresizesSubviews = NO;
        
        [b1 setTransform:CGAffineTransformRotate(b1.transform, M_PI/4)];
    } completion:nil];
    
    if(flag==1){
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        pv1.frame=CGRectMake(self.view.frame.size.width-70,self.view.frame.size.height-70,50,50);
        
        pv2.frame=CGRectMake(self.view.frame.size.width-70,self.view.frame.size.height-70,50,50);        flag=0;
        [UIView commitAnimations];
        
        
        
    }
    else
    {
        //animation
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        pv1.frame=CGRectMake(self.view.frame.size.width-70,self.view.frame.size.height-150,50,50);
        pv2.frame=CGRectMake(self.view.frame.size.width-70,self.view.frame.size.height-200,50,50);        flag=1;
        //    [UIView beginAnimations:nil context:NULL];
        //    [UIView setAnimationDuration:1];
        
        [UIView commitAnimations];
    }
    //      pv2.frame=CGRectMake(0,80,  pv.frame.size.width,
    //                         50);
    //
    //
    //    pv1.frame=CGRectMake(0,0, pv.frame.size.width,
    //                         50);
    //
    
    
    
    
}
-(void)highlightLetter:(UITapGestureRecognizer*)sender {
    [pv removeFromSuperview];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;


{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
    static NSString *CellIdentifier = @"hai";  //declaring identifier for cell,since it is xib file.
    
    
    
    procell=[self.ProTab dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    
    
    
    if (procell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"ProTabCell" owner:self options:nil];
        procell=[toplevelobject objectAtIndex:0];
    }
    
    
    
    
    

    
   
    
    
    NSString *p1=[[Dict objectForKey:@"admin_data"]valueForKey:@"email"];
    
    
    procell.email.text =p1;
    
    
    NSString *p2=[[Dict objectForKey:@"admin_data"]valueForKey:@"address"];
    
    NSArray *myArray = [p2 componentsSeparatedByString:@","];
    
    NSString *sa=[myArray objectAtIndex:0];
     NSString *sb=[myArray objectAtIndex:1];
     NSString *sc=[myArray objectAtIndex:2];
     NSString *sd=[myArray objectAtIndex:3];
    
    
    NSString *strr=[NSString stringWithFormat:@"%@\n%@ \n%@\n%@ ",sa,sb,sc,sd]
    ;
//    [myArray objectAtIndex:0];//Abc
//    [myArray objectAtIndex:1];//Def
//    [myArray objectAtIndex:2];//Ghi
//    [myArray objectAtIndex:3];//Lmno
    
    
    procell.add1.text =strr;
    
    
    
    
    NSString *p3=[[Dict objectForKey:@"admin_data"]valueForKey:@"office"];
    
    
    procell.off.text =p3;
    
    
    
    
    NSString *p4=[[Dict objectForKey:@"admin_data"]valueForKey:@"country"];
    
    
    procell.nat.text =p4;
    
    
    
    NSString *p5=[[Dict objectForKey:@"admin_data"]valueForKey:@"qatar_id"];
    
    
    procell.qid.text =p5;
    
    NSString *p6=[[Dict objectForKey:@"admin_data"]valueForKey:@"issueddate"];
    
    
    procell.iss.text =p6;
    
    
    
    NSString *p7=[[Dict objectForKey:@"admin_data"]valueForKey:@"expirydate"];
    
    
    procell.exp.text =p7;
    
    
    
    
    
    
    
    return procell;
    
}





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
                      //                        //                        NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
            else{
                
                
                
                
                
                
                [self.ProTab reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    
    NSLog(@"%@",Dict);
    
    
    
    
    
    
    
    //        return YES;
    
    //    }
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




//sliding



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
    ((  slidemenudetailViewController*)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled = sender.isOn;
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














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
