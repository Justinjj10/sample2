//
//  cmp_doc_status.m
//  sample2
//
//  Created by Mac on 3/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "cmp_doc_status.h"
#import "GlobalMethods.h"
#import "com_doc_statuscell.h"
#import "slidemenudetailViewController.h"
#import "SlideNavigationController.h"
#import "MBProgressHUD.h"

@interface cmp_doc_status (){
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    UIView *vieww;
    UIActivityIndicatorView *spinner;
    com_doc_statuscell *cell;
    MBProgressHUD *hud;
}

@end

@implementation cmp_doc_status

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    hud.center = CGPointMake(self.view.frame.size.width  / 2,
                             self.view.frame.size.height / 2);
    

    
    [self.navigationItem setHidesBackButton:YES];
    
    
    [self.navigationItem setTitle:@"Company"];

    Dict=[[NSMutableDictionary alloc]init];
    
//    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    spinner.center = CGPointMake(self.view.frame.size.width  / 2,
//                                 self.view.frame.size.height / 2);
//    spinner.hidesWhenStopped = YES;
    
    self.comp_docstatus_tabl.separatorColor = [UIColor blueColor];
    
    self.comp_docstatus_tabl.backgroundView = nil;
 
    self.comp_docstatus_tabl.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
    
    
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
                [self.comp_docstatus_tabl reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/company_doc_status_list?admin_id=1&Authorization=%@&start=0&limit=30",self.ss];
    
    
    
    
    
    
    
    
    
    
    
    
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
    return [[Dict objectForKey:@"company_doc_status_list"] count]; // in your case, there are 3
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
    
    NSString *str=[NSString stringWithFormat:@"%ld",(long)indexPath.section];
    static NSString *CellIdentifier = @"cel";
    
    
    
    
    
    
    
    cell=[self.comp_docstatus_tabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"com_doc_statuscell" owner:self options:nil];
        
        
        cell=[toplevelobject objectAtIndex:0];
    }
    
    NSMutableDictionary *aa=[[[Dict objectForKey:@"company_doc_status_list"] objectAtIndex:str.intValue]objectForKey:@"Document_Status" ];
    //    ll=[[NSMutableArray alloc]init];
    //    ll=[aa objectAtIndex:0];
    
    if ([[aa objectForKey:@"document_staus_commercial_registration"]isEqualToString:@"Not Uploaded"] ){
        
        
        cell.img1.image=[UIImage imageNamed:@"cross"];
        
        
    }
    else     {
        cell.img1.image=[UIImage imageNamed:@"tic"];
    }
    
    if ([[aa objectForKey:@"document_staus_computer_card"]isEqualToString:@"Not Uploaded"] ){
        
        
        cell.img2.image=[UIImage imageNamed:@"cross"];
        
        
    }
    else     {
        cell.img2.image=[UIImage imageNamed:@"tic"];
    }
    
    
    if ([[aa objectForKey:@"document_staus_municipal_baladiya"]isEqualToString:@"Not Uploaded"] ){
        
        
        cell.img3.image=[UIImage imageNamed:@"cross"];
        
        
    }
    else     {
        cell.img3.image=[UIImage imageNamed:@"tic"];
    }
    
    
    
    if ([[aa objectForKey:@"document_staus_tax_card"]isEqualToString:@"Not Uploaded"] ){
        
        
        cell.img4.image=[UIImage imageNamed:@"cross"];
        
        
    }
    else     {
        cell.img4.image=[UIImage imageNamed:@"tic"];
    }
    
    
    
    NSString *s1=[[[Dict  objectForKey:@"company_doc_status_list"]valueForKey:@"company_name"] objectAtIndex:indexPath.section];
    
    cell.c_name.text=s1;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        
        [cell.contentView setBackgroundColor:[UIColor yellowColor]];
    }
}





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
