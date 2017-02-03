//
//  desig_emp.m
//  sample2
//
//  Created by Mac on 20/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "desig_emp.h"

#import "GlobalMethods.h"
#import "slidemenudetailViewController.h"
#import "SlideNavigationController.h"
#import "MBProgressHUD.h"
#import "desig_emp_cel.h"

@interface desig_emp ()
{
    desig_emp_cel *cell;
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    UIView *vieww;
    UIActivityIndicatorView *spinner;
    
    MBProgressHUD *hud;
    

}

@end

@implementation desig_emp

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.navigationItem setHidesBackButton:YES];
    
    [self.navigationItem setTitle:@"Employee"];
    
    
    hud.center = CGPointMake(self.view.frame.size.width  / 2,
                             self.view.frame.size.height / 2);
    
    
    
    
    self.desig_emptabl.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.desig_emptabl.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
    [self fetchData];
    
    // Do any additional setup after loading the view.
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            
            
            else
            {
                [self.desig_emptabl reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/designationemployeelist?admin_id=1&Authorization=%@&start=0&limit=50&designation=PRO",self.ss];
    
    
    
    
    
//    http://app.sponsormasterqatar.com/index.php/EmployeeApi/designationemployeelist?admin_id=1&Authorization=wndjJMb9F3aOqXfLNht2KITce4pAZoR5lWrS&start=0&limit=50&designation=6G
    
    
    
    
    
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




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[Dict objectForKey:@"employee_list"] count];
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
    
    
    
    
    
    
    cell=[self.desig_emptabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"desig_emp_cel" owner:self options:nil];
        
        
        cell=[toplevelobject objectAtIndex:0];
    }
    cell.img.layer.cornerRadius = cell.img.frame.size.width / 2.0;
    cell.img.clipsToBounds = YES;
    cell.img.backgroundColor=[self colorFromHexString:@"#ABEBC6"];
    
    //cell.textLabel.text=@"jus";
    
    NSString *s1=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"employee_name"] objectAtIndex:indexPath.section];
    
    NSString *s2=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"employee_id"] objectAtIndex:indexPath.section];
//
    NSString *s3=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"company"] objectAtIndex:indexPath.section];
//
//    
    NSString *s4=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"employee_email"] objectAtIndex:indexPath.section];
//
//    
    NSString *s5=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"employee_phone"] objectAtIndex:indexPath.section];
    
    cell.name_labl.text=s1;
    cell.emp_id.text=s2;
    cell.emp_comp.text=s3;
    cell.mail.text=s4;
    cell.call.text=s5;
    NSString *firstChar=[s1 substringToIndex:1];
    cell.imglabl.text=firstChar;
    
    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//    
//    
//    emp_prof *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"EmpProf"];
//    
//    
//    ob.ss=self.ss;
//    ob.ss1=[[[Dict objectForKey:@"employee_list"] valueForKey:@"employee_id"]objectAtIndex:indexPath.section];
//    
//    ob.prof=[[[Dict objectForKey:@"employee_list"] valueForKey:@"profile_picture"]objectAtIndex:indexPath.section];
//    
//    
//    
//    [self.navigationController pushViewController:ob animated:YES];
//    
//    
//    
//}



- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
