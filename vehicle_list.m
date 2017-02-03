//
//  vehicle_list.m
//  sample2
//
//  Created by Mac on 21/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "vehicle_list.h"
#import "GlobalMethods.h"
#import "vehicle_list_cell.h"
#import "SlideNavigationController.h"
#import "slidemenudetailViewController.h"

@interface vehicle_list ()
{
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    UIView *vieww;
    UIActivityIndicatorView *spinner;
    vehicle_list_cell *cell;
}

@end

@implementation vehicle_list

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    [self.navigationItem setHidesBackButton:YES];
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(self.view.frame.size.width  / 2,
                                 self.view.frame.size.height / 2);
    spinner.hidesWhenStopped = YES;
    
    
    
    self.vehtabl.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.vehtabl.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
    
    
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
        [self start];
        BOOL userexits;
        
        userexits=  [self urlList_Requesttri2  ];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if(!userexits){
                [self stop];
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
                [self.vehtabl reloadData];
                
                [self stop];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http:app.sponsormasterqatar.com/index.php/VehicleApi/vehiclelist?admin_id=1&Authorization=%@&start=0&limit=10",self.ss];
    
    
    
    
    
    
    
    
    
    
    
    
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

-(void)start
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    vieww=[[UIView alloc] initWithFrame:screenRect];
    //self.collectionview.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    vieww.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.6];
    [self.view addSubview:vieww];
    [vieww addSubview:spinner];
    
    
    
    spinner.hidden = NO;
    [spinner startAnimating];}

-(void)stop
{
    spinner.hidden = YES;
    [spinner stopAnimating];
    [vieww removeFromSuperview];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [Dict count]; // in your case, there are 3 cells
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
    
    
    
    
    
    
    cell=[self.vehtabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"vehicle_list_cell" owner:self options:nil];
        
        
        cell=[toplevelobject objectAtIndex:0];
    }
    
    
    cell.img.backgroundColor=[self colorFromHexString:@"#AED6F1"];
    cell.img.layer.cornerRadius = cell.img.frame.size.width / 2.0;
    cell.img.clipsToBounds = YES;
    
    
    NSString *s1=[[[Dict  objectForKey:@"vehicle_list"]valueForKey:@"company_name"] objectAtIndex:indexPath.section];
    
    NSString *s2=[[[Dict  objectForKey:@"vehicle_list"]valueForKey:@"manufacturer"] objectAtIndex:indexPath.section];
    
    NSString *s3=[[[Dict  objectForKey:@"vehicle_list"]valueForKey:@"model"] objectAtIndex:indexPath.section];
    
    
    NSString *s4=[[[Dict  objectForKey:@"vehicle_list"]valueForKey:@"vehicle_code"] objectAtIndex:indexPath.section];
    
    
    NSString *s5=[[[Dict  objectForKey:@"vehicle_list"]valueForKey:@"assigned_company"] objectAtIndex:indexPath.section];
    NSString *s6=[[[Dict  objectForKey:@"vehicle_list"]valueForKey:@"assigned_employee"] objectAtIndex:indexPath.section];

    
    
    cell.vname.text=s1;
    cell.vmanufac.text=s2;
    cell.vmodel.text=s3;
    cell.vcode.text=s4;
    cell.vaddres.text=s5;
    cell.vholder.text=s6;
    
    
    
    NSString *firstChar=[s1 substringToIndex:1];
    cell.imglabl.text=firstChar;
    
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


    // Do any additional setup after loading the view.




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
