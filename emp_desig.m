//
//  emp_desig.m
//  sample2
//
//  Created by Mac on 20/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "emp_desig.h"

#import "GlobalMethods.h"
#import "slidemenudetailViewController.h"
#import "SlideNavigationController.h"
#import "MBProgressHUD.h"
#import "emp_desig_cel.h"
#import "desig_emp.h"

@interface emp_desig ()
{
    emp_desig_cel *cell;
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    MBProgressHUD *hud;

}

@end

@implementation emp_desig

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.navigationItem setHidesBackButton:YES];
    
    [self.navigationItem setTitle:@"Employee"];
    
    
    hud.center = CGPointMake(self.view.frame.size.width  / 2,
                             self.view.frame.size.height / 2);
    
    
    
    
//    self.emptabl.backgroundView = nil;
//    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
//    self.emptabl.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
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
                [self.emp_desigtabl reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/designationlist?admin_id=1&Authorization=%@&start=0&limit=50",self.ss];
    
    
    
    
    
    
    
    
    
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








- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [[Dict objectForKey:@"employee_list"] count];
}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc] init];
//    headerView.backgroundColor = [UIColor clearColor];
//    return headerView;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
   // static NSString *CellIdentifier = @"cel";
    
    
    
    
    
    
    cell=[self.emp_desigtabl dequeueReusableCellWithIdentifier:@"cel"];
    
    
//    if (cell==nil) {
//        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"emp_desig_cel" owner:self options:nil];
//        
//        
//        cell=[toplevelobject objectAtIndex:0];
//    }
  
    
    //cell.textLabel.text=@"jus";
    
    NSString *s1=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"designation_name"] objectAtIndex:indexPath.row];
    
    cell.textLabel.text=s1;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    desig_emp *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"DesigEmp"];
    
    
    ob.ss=self.ss;
    ob.ss1=[[[Dict objectForKey:@"employee_list"] valueForKey:@"designation_name"]objectAtIndex:indexPath.row];
    
       
    
    
    [self.navigationController pushViewController:ob animated:YES];
    
    
    
}



- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
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
