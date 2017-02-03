//
//  new_visa_list.m
//  sample2
//
//  Created by Mac on 11/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "new_visa_list.h"
#import "SlideNavigationController.h"
#import "slidemenudetailViewController.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"
#import "new_visa_listcel.h"
#import "visa_issue_cel.h"
#import "UIImageView+WebCache.h"
#import "MXSegmentedPager.h"
#import "visa_prof.h"
@interface new_visa_list ()<MXSegmentedPagerDelegate, MXSegmentedPagerDataSource, UITableViewDelegate, UITableViewDataSource>
{
    NSMutableDictionary *Dict,*Dict1;
    GlobalMethods *globalMethod;
    UIView *vieww;
    MBProgressHUD *hud;
    new_visa_listcel *cell;
    visa_issue_cel *cell1;
    

}

@property (nonatomic, strong) MXSegmentedPager  * segmentedPager;
@property (nonatomic, strong) UITableView       * tableView;
@property (nonatomic, strong) UITableView       * tableView1;

@property (nonatomic, strong) UIWebView         * webView;
@property (nonatomic, strong) UITextView        * textView;


@end

@implementation new_visa_list

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.segmentedPager];
    self.view.backgroundColor=[self colorFromHexString:@"#1a91ff"];
    self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
   
    
    
    self.segmentedPager.segmentedControl.backgroundColor = [self colorFromHexString:@"#1a91ff"];

    
    self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedPager.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
    self.segmentedPager.segmentedControl.selectionIndicatorColor = [UIColor redColor];
    
    
    
    
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = @{NSFontAttributeName :  [UIFont boldSystemFontOfSize:15]};

    
    self.segmentedPager.pager.gutterWidth = 20;
    
    //Register UItableView as page
    [self.segmentedPager.pager registerClass:[UITextView class] forPageReuseIdentifier:@"TextPage"];

    self.tableView.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.tableView.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
    
    self.tableView1.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.tableView1.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
 
    
    [self fetchData];
  //  [self fetchData1];
    
    
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    self.segmentedPager.frame = (CGRect){
        .origin.x       = 0.f,
        .origin.y       = 64.f,
        .size.width     = self.view.frame.size.width,
        .size.height    = self.view.frame.size.height - 20.f
    };
    [super viewWillLayoutSubviews];
}

     
     - (UIColor *)colorFromHexString:(NSString *)hexString {
         unsigned rgbValue = 0;
         NSScanner *scanner = [NSScanner scannerWithString:hexString];
         [scanner setScanLocation:1]; // bypass '#' character
         [scanner scanHexInt:&rgbValue];
         return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
     }
     

#pragma mark - HTHorizontalSelectionListDataSource Protocol Methods

- (MXSegmentedPager *)segmentedPager {
    if (!_segmentedPager) {
        
        // Set a segmented pager
        _segmentedPager = [[MXSegmentedPager alloc] init];
        _segmentedPager.delegate    = self;
        _segmentedPager.dataSource  = self;
    }
    return _segmentedPager;
}

- (UITableView *)tableView {
    if (!_tableView) {
        //Add a table page
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



- (UITableView *)tableView1 {
    if (!_tableView1) {
        //Add a table page
        _tableView1 = [[UITableView alloc] init];
        _tableView1.delegate = self;
        _tableView1.dataSource = self;
    }
    return _tableView1;
}




#pragma -mark <MXSegmentedPagerDelegate>

- (void)segmentedPager:(MXSegmentedPager *)segmentedPager didSelectViewWithTitle:(NSString *)title {
    NSLog(@"%@ page selected.", title);
}

#pragma -mark <MXSegmentedPagerDataSource>

- (NSInteger)numberOfPagesInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return 2;
}

- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager titleForSectionAtIndex:(NSInteger)index {
    return @[@"New Visa List", @"Visa Issued List"][index];
}

- (UIView *)segmentedPager:(MXSegmentedPager *)segmentedPager viewForPageAtIndex:(NSInteger)index {
    
    //    if (index==0) {
    //
    //
    ////[self fetchData];
    //
    //        return self.tableView;
    //    }
    //    else if (index==1)
    //    {
    //              //  [self fetchData];
    //
    //        return self.tableView1;
    //    }
    //
    //    else if (index==2)
    //    {
    //
    //
    //
    //
    //     //   [self fetchData];
    //        return self.tableView2;
    //
    //    }
    //
    //    return NO;
    return @[self.tableView, self.tableView1][index];
}

#pragma mark-fetchdata

-(void)fetchData
{
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^ {
        [self showHud];
        BOOL userexits;
        
        userexits=  [self urlList_Requesttri  ];
        
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
                [self.tableView reloadData];
                [self fetchData1];
                
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/VisaApi/visalist?admin_id=1&Authorization=%@&start=0&limit=50",self.ss];
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    //    NSString* webStringURL = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    
//NSURL  *url=[NSURL URLWithString:webStringURL];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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

#pragma mark-fetchdata

-(void)fetchData1
{
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^ {
        [self showHud];
        BOOL userexits;
        
        userexits=  [self urlList_Requesttri1  ];
        
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
                [self.tableView1 reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri1
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/VisaApi/issuedvisalist?admin_id=1&Authorization=%@&start=0&limit=50",self.ss];
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    //    NSString* webStringURL = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    
    //NSURL  *url=[NSURL URLWithString:webStringURL];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
        
        
        
        Dict1= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict1);
        
        
        
        
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




#pragma mark-tabldelegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (tableView==_tableView) {
        
        return [[Dict objectForKey:@"visa_list"] count];
        
    }
    else if (tableView==_tableView1)
    {
        return [[Dict1 objectForKey:@"visa_list"] count];
    }
    else
        return NO;
   
  
    //return [[Dict objectForKey:@"company_list"] count]; // in your case, there are 3 cells
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 144;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  
        return 10;
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
   
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    if (tableView==_tableView) {
        
 
    
    
    static NSString *CellIdentifier = @"cel";
    
    
    
    
    
    
    cell=[self.visa_list dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"new_visa_listcel" owner:self options:nil];
        
        
        cell=[toplevelobject objectAtIndex:0];
    }
    
    
    
    
       
    //int count=0;
    // NSString *so=@"5";
    // NSString *sm=[NSString stringWithFormat:@"%@",]
    
   
    //
    //
    //        cell.img.backgroundColor=[caray objectAtIndex:i];
    //
    //
    //
    //
    //    }
    //
    
    
   // cell.cellimg.backgroundColor=[self colorFromHexString:@"#F8C471"];
    cell.cellimg.layer.cornerRadius = cell.cellimg.frame.size.width / 2.0;
    cell.cellimg.clipsToBounds = YES;
    
    
    NSString *s1=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_applicant_name"] objectAtIndex:indexPath.section];
    
    NSString *s2=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_ref_no"] objectAtIndex:indexPath.section];
    
    NSString *s3=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_client_name"] objectAtIndex:indexPath.section];
    
    
    NSString *s4=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_category"] objectAtIndex:indexPath.section];
    
    
    NSString *s5=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_type"] objectAtIndex:
                  
                  indexPath.section];
        
        
        NSString *urlstring=[[[Dict  objectForKey:@"visa_list"]valueForKey:@"visa_profile_picture"] objectAtIndex:indexPath.section];
        NSURL *imageUrl=[NSURL URLWithString:urlstring];
        [cell.cellimg sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"prof2"]];

        
        
    
    cell.name_label.text=s1;
    cell.ref_labl.text=s2;
    cell.client_labl.text=s3;
    cell.cat_labl.text=s4;
    cell.type_labl.text=s5;
    
    
    
    NSString *firstChar=[s1 substringToIndex:1];
    cell.imglabl.text=firstChar;
    
    return cell;
}
    
    
#pragma  tabl2
    
    
    
    
  else if (tableView==_tableView1)
    {
      
        
        static NSString *CellIdentifier1 = @"cel1";
        
        
        
        
        
        
        cell1=[self.visa_issue_tabl dequeueReusableCellWithIdentifier:CellIdentifier1];
        
        
        if (cell1==nil) {
            NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"visa_issue_cel" owner:self options:nil];
            
            
            cell1=[toplevelobject objectAtIndex:0];
        }
        
        
        
        
        
        //int count=0;
        // NSString *so=@"5";
        // NSString *sm=[NSString stringWithFormat:@"%@",]
        
        
        //
        //
        //        cell.img.backgroundColor=[caray objectAtIndex:i];
        //
        //
        //
        //
        //    }
        //
        
        
//            cell.cellimg.backgroundColor=[self colorFromHexString:@"#F8C471"];
            cell.cellimg.layer.cornerRadius = cell.cellimg.frame.size.width / 2.0;
            cell.cellimg.clipsToBounds = YES;
        
        
        NSString *s1=[[[Dict1  objectForKey:@"visa_list"]valueForKey:@"visa_applicant_name"] objectAtIndex:indexPath.section];
        
       NSString *s2=[[[Dict1  objectForKey:@"visa_list"]valueForKey:@"visa_ref_no"] objectAtIndex:indexPath.section];
       
      NSString *s3=[[[Dict1  objectForKey:@"visa_list"]valueForKey:@"visa_number"] objectAtIndex:indexPath.section];
      NSString *s4=[[[Dict1  objectForKey:@"visa_list"]valueForKey:@"visa_entry_date"] objectAtIndex:indexPath.section];
       
       NSString *s5=[[[Dict1  objectForKey:@"visa_list"]valueForKey:@"visa_expiry_date"] objectAtIndex:indexPath.section];
        
        
        
        NSString *urlstring=[[[Dict1  objectForKey:@"visa_list"]valueForKey:@"visa_profile_picture"] objectAtIndex:indexPath.section];
        NSURL *imageUrl=[NSURL URLWithString:urlstring];
        [cell1.cellimg sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"prof2"]];

        
        
        
        
        
        
        cell1.name_labl.text=s1;
       cell1.ref_labl.text=s2;
        cell1.visano_labl.text=s3;
       cell1.entry_labl.text=s4;
        cell1.exp_labl.text=s5;
        
        
        
        NSString *firstChar=[s1 substringToIndex:1];
        cell1.imglabl.text=firstChar;
        
        return cell1;

        
        
        
        
        
    }
    else
    return NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_tableView) {
        
        visa_prof *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaProf"];
        
        
        ob.ss=self.ss;
        ob.ss1=[[[Dict objectForKey:@"visa_list"] valueForKey:@"visa_id"]objectAtIndex:indexPath.section];
        ob.prof=[[[Dict objectForKey:@"visa_list"] valueForKey:@"visa_profile_picture"]objectAtIndex:indexPath.section];
        
        
        [self.navigationController pushViewController:ob animated:YES];
        
    }
    else if (tableView==_tableView1)
    {
    
    visa_prof *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaProf"];
    
    
    ob.ss=self.ss;
    ob.ss1=[[[Dict1 objectForKey:@"visa_list"] valueForKey:@"visa_id"]objectAtIndex:indexPath.section];
    ob.prof=[[[Dict1 objectForKey:@"visa_list"] valueForKey:@"visa_profile_picture"]objectAtIndex:indexPath.section];
    
    
    [self.navigationController pushViewController:ob animated:YES];
    
    
    
}


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
