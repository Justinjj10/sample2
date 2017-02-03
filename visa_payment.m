//
//  visa_payment.m
//  sample2
//
//  Created by Mac on 12/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "visa_payment.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"
#import "slidemenudetailViewController.h"
#import "SlideNavigationController.h"
#import "visa_pay_cel.h"


@interface visa_payment ()
{
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    UIView *vieww;
    UIActivityIndicatorView *spinner;
    MBProgressHUD *hud;
    visa_pay_cel *cell;

}

@end

@implementation visa_payment

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    [self.navigationItem setHidesBackButton:YES];
    
    [self.navigationItem setTitle:@"Company"];
    
    
    Dict=[[NSMutableDictionary alloc]init];
    
    //    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    hud.center = CGPointMake(self.view.frame.size.width  / 2,
                             self.view.frame.size.height / 2);
    
    
    
    //spinner.hidesWhenStopped = YES;
    
    
    
    self.visa_paytabl.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.visa_paytabl.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
    
    
    [self fetchData];
    // Do any additional setup after loading the view.
}
- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}-(void)fetchData
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
            
            
            else
            {
                [self.visa_paytabl reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/VisaApi/visapaymentlist?admin_id=1&Authorization=%@&start=0&limit=50",self.ss];
    
    
    
    
    
    
    
    
    
    
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = [NSURL URLWithString:urlString];
    
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-type"];
    
    NSHTTPURLResponse *response = nil;
    NSError *error ;
    NSData *returnData =[NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    //    NSString* newStr = [NSString stringWithUTF8String:[returnData bytes]];
    //    NSLog(@"return data %@",newStr);
    
    
    
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

//    -(void)start
//{
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    vieww=[[UIView alloc] initWithFrame:screenRect];
//    //self.collectionview.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
//    vieww.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.6];
//    [self.view addSubview:vieww];
//    [vieww addSubview:spinner];
//
//
//
//    spinner.hidden = NO;
//    [spinner startAnimating];}
//
//-(void)stop
//{
//    spinner.hidden = YES;
//    [spinner stopAnimating];
//    [vieww removeFromSuperview];
//}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[Dict objectForKey:@"visa_list"] count]; // in your case, there are 3 cells
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
    static NSString *CellIdentifier = @"cel";
    
    
    
    
    
    
    cell=[self.visa_paytabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"visa_pay_cel" owner:self options:nil];
        
        
        cell=[toplevelobject objectAtIndex:0];
    }
    
    
    
    
    
    //int count=0;
    // NSString *so=@"5";
    // NSString *sm=[NSString stringWithFormat:@"%@",]
    
    
    //    while (i<fre) {
    //
    //
    //        cell.img.backgroundColor=[caray objectAtIndex:i];
    //
    //
    //
    //
    //    }
    //
    
    NSString *s=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_applicant_name"] objectAtIndex:indexPath.section];


    
    
    NSString *s1=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_type"] objectAtIndex:indexPath.section];
    
    NSString *s2=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_category"] objectAtIndex:indexPath.section];
    
    NSString *s3=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_client_name"] objectAtIndex:indexPath.section];
    
    
    NSString *s4=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_sponsor"] objectAtIndex:indexPath.section];
    
    
    NSString *s5=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"payment_month"] objectAtIndex:indexPath.section];
    
    
    NSString *s6=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"payment_year"] objectAtIndex:indexPath.section];
    
    NSString *s7=[NSString stringWithFormat:@"%@ %@",s5,s6];

    
    cell.name_labl.text=s;
   // cell.type_labl.text=s1;
    
    cell.cat_labl.text=s2;

    
    cell.client_labl.text=s3;
    cell.spo_labl.text=s4;
    cell.pay_labl.text=s7;
    
    
    
    
    return cell;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section==0) {
//
//        [cell.contentView setBackgroundColor:[UIColor yellowColor]];
//    }
//}





//slide
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


    
    
    
    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
