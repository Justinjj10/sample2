//
//  emp_prof.m
//  sample2
//
//  Created by Mac on 18/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "emp_prof.h"
#import <MXSegmentedPager/MXSegmentedPager.h>
#import "cmp_prof_view.h"
#import "prof_cel.h"
#import "adv_cel.h"
#import "doc_cel.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"
#import <MessageUI/MFMailComposeViewController.h>

#import "UIImageView+WebCache.h"

@interface emp_prof ()<MXSegmentedPagerDelegate, MXSegmentedPagerDataSource, UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate>
{
    prof_cel *cell1;
    adv_cel *cell2;
    doc_cel *cell3;
        
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    MBProgressHUD *hud;

}




@property (nonatomic, strong) MXSegmentedPager  * segmentedPager;
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) UITableView       *tableView1;
@property (nonatomic, strong) UITableView       *tableView2;
@property (nonatomic, strong) UITableView       *tableView3;

@property (nonatomic, strong) cmp_prof_view      * customView;

@end
@implementation emp_prof



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [ self colorFromHexString:@"#1a91ff"];
    
    [self.view addSubview:self.segmentedPager];
    
    // Parallax Header
    self.segmentedPager.parallaxHeader.view = self.customView;
    self.segmentedPager.parallaxHeader.mode = MXParallaxHeaderModeFill;
    self.segmentedPager.parallaxHeader.height = 270;
    self.segmentedPager.parallaxHeader.minimumHeight = 55;
    
    // Segmented Control customization
    self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedPager.segmentedControl.backgroundColor = [self colorFromHexString:@"#1a91ff"];
    self.segmentedPager.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
    self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedPager.segmentedControl.selectionIndicatorColor = [UIColor redColor];
    
    
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = @{NSFontAttributeName :  [UIFont boldSystemFontOfSize:15]};

    
    self.segmentedPager.segmentedControlEdgeInsets = UIEdgeInsetsMake(12, 12, 12, 12);
    
    
    
    [self.tableView setAllowsSelection:NO];
    [self.tableView setAllowsSelectionDuringEditing:NO];
    [self.tableView1 setAllowsSelection:NO];
    [self.tableView1 setAllowsSelectionDuringEditing:NO];
    [self.tableView2 setAllowsSelection:NO];
    [self.tableView2 setAllowsSelectionDuringEditing:NO];
    
    
    
    //    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"right"]
    //                                                                   style:UIBarButtonItemStylePlain
    //                                                                  target:self
    //                                                                  action:@selector(backAction)];
    //
    //    [[self navigationItem] setRightBarButtonItem:backButton];
    
    
    
    
    [self fetchData];
    
    
    
    
    [_customView.call addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_customView.mail addTarget:self action:@selector(mail) forControlEvents:UIControlEventTouchUpInside];
    
    _customView.img.backgroundColor=[UIColor blackColor];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(IBAction)backAction//:(id)sender)
{
    
}


- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}



#pragma mark-fetchData

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
                [self.tableView reloadData];
                [self.tableView1 reloadData];
                [self.tableView2 reloadData];
                
                
                
               NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_name"];
                _customView.name_labl.text=s1;
                
                
                NSURL *imageUrl=[NSURL URLWithString:self.prof];
               [_customView.prof_img sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"prof2"]];
              
                
                
            [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/employeedetails?admin_id=1&Authorization=%@&employee_id=%@",self.ss,self.ss1];
    
    
    
    
    
    
    
    
    
    
    
    
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
//















- (void)viewWillLayoutSubviews {
    self.segmentedPager.frame = (CGRect){
        .origin = CGPointZero,
        .size   = self.view.frame.size
    };
    [super viewWillLayoutSubviews];
}

#pragma mark Properties






- (cmp_prof_view *)customView {
    if (!_customView) {
        
        
        _customView = [self.nibBundle loadNibNamed:@"Cover" owner:nil options:nil].firstObject;
    }
    return _customView;
}




- (MXSegmentedPager *)segmentedPager {
    if (!_segmentedPager) {
        
        // Set a segmented pager below the cover
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
        // [self fetchData];
        
        
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
    return _tableView1
    ;
}

- (UITableView *)tableView2 {
    if (!_tableView2) {
        //Add a table page
        _tableView2 = [[UITableView alloc] init];
        _tableView2.delegate = self;
        _tableView2.dataSource = self;
    }
    return _tableView2
    ;
}

//- (UITableView *)tableView3 {
//    if (!_tableView3) {
//        //Add a table page
//        _tableView3 = [[UITableView alloc] init];
//        _tableView3.delegate = self;
//        _tableView3.dataSource = self;
//    }
//    return _tableView2
//    ;
//}
//








- (IBAction)call//:(id)sender {
{
    NSString *ss7=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0]objectForKey:@"employee_phone"];
    
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",ss7]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication]openURL:phoneUrl options:@{}
                                completionHandler:^(BOOL success) {
                                    // NSLog(@"Open %@: %d",scheme,success);
                                }];

    }}

- (IBAction)mail//:(id)sender {
{
    
    NSString *ss=[[[Dict objectForKey:@"employee_list"]objectAtIndex:0] objectForKey:@"employee_email"];
    NSArray *arr=[NSArray arrayWithObject:ss];
    
    
    MFMailComposeViewController *comp=[[MFMailComposeViewController alloc]init];
    [comp setMailComposeDelegate:self];
    if([MFMailComposeViewController canSendMail]) {
        [comp setToRecipients:arr]  ;       //[NSArray arrayWithObjects:@"jeweltms@gmail.com", nil]];
       // [comp setSubject:@"From my app"];
      //  [comp setMessageBody:@"Haiiiiii " isHTML:NO];
        [comp setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:comp animated:YES completion:nil];
    }
    else {
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self dismissViewControllerAnimated:NO completion:nil];

        
        
        
        
    }
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:
(MFMailComposeResult)result error:(NSError *)error {
    if(error) {
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self dismissViewControllerAnimated:NO completion:nil];

        
        
        
    }
    
    //        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:nil cancelButtonTitle:@"" otherButtonTitles:nil, nil];
    //        [alrt show];
    //        [self dismissModalViewControllerAnimated:YES];
    //    }
    else {
        [self dismissViewControllerAnimated:NO completion:nil];

    }
    
    
    
}















#pragma mark <MXSegmentedPagerDelegate>

- (CGFloat)heightForSegmentedControlInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return 30.f;
}

- (void)segmentedPager:(MXSegmentedPager *)segmentedPager didSelectViewWithTitle:(NSString *)title {
    NSLog(@"%@ page selected.", title);
}

- (void)segmentedPager:(MXSegmentedPager *)segmentedPager didScrollWithParallaxHeader:(MXParallaxHeader *)parallaxHeader {
    NSLog(@"progress %f", parallaxHeader.progress);
}

#pragma mark <MXSegmentedPagerDataSource>

- (NSInteger)numberOfPagesInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return 3;
}

- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager titleForSectionAtIndex:(NSInteger)index {
    return @[@"Profile", @"Advanced", @"Documents"][index];
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
    return @[self.tableView, self.tableView1, self.tableView2][index];
}

#pragma mark <UITableViewDelegate>

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    NSInteger index = (indexPath.row % 2) + 1;
//    [self.segmentedPager.pager showPageAtIndex:index animated:YES];
//}

#pragma mark <UITableViewDataSource>

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView==_tableView) {
        return 5;
    }
    else if(tableView==_tableView1)
    {
        return 11;
    }
    else
        return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (tableView==_tableView) {
        static NSString *CellIdentifier = @"cel";
        
        
        
        
        
        
        cell1=[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
        if (cell1==nil) {
            NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"prof_cel" owner:self options:nil];
            
            
            cell1=[toplevelobject objectAtIndex:0];
        }
        //
        //        NSString *s1=[[[Dict objectForKey:@"company_details"] objectAtIndex:0] objectForKey:@"company_about"];
        //
        //                cell1.tit_labl.text=@"About";
        //                cell1.sub_labl.text=s1;
        //
        //
        //
        //        return cell1;
        //    }
        if (indexPath.row==0) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"company_name"];
            
            
            cell1.tit_labl.text=@"Company";
            cell1.sub_labl.text=s1;
        }
        
        
        if (indexPath.row==1) {
            
           NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_designation"];
            
            cell1.tit_labl.text=@"Designation";
            cell1.sub_labl.text=s1;
            
        }
        
        
        if (indexPath.row==2) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_gender"];
            
            cell1.tit_labl.text=@"Gender";
            cell1.sub_labl.text=s1;
            
        }
        
        
        if (indexPath.row==3) {
            
          NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_email"];
            
            cell1.tit_labl.text=@"Email";
            cell1.sub_labl.text=s1;
            
        }
        
        
        if (indexPath.row==4) {
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_phone"];
            

            
            cell1.tit_labl.text=@"Phone";
            cell1.sub_labl.text=s1;
        }
        
        
        
        
        
        
        
        
        
        
        
        return cell1;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    else if (tableView==_tableView1)
    {
        
        
        static NSString *CellIdentifier = @"cel";
        
        
        
        
        
        
        cell2=[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
        if (cell2==nil) {
            NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"adv_cel" owner:self options:nil];
            
            
            cell2=[toplevelobject objectAtIndex:0];
        }
        //
        //        NSString *s1=[[[Dict objectForKey:@"company_details"] objectAtIndex:0] objectForKey:@"company_about"];
        //
        //                cell1.tit_labl.text=@"About";
        //                cell1.sub_labl.text=s1;
        //
        //
        //
        //        return cell1;
        //    }
        if (indexPath.row==0) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_peraddress1"];
            
            cell2.tit_labl.text=@"Permanent Address1";
            cell2.sub_labl.text=s1;
        }
        
              if (indexPath.row==1) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_percity"];
            

            
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
            cell2.tit_labl.text=@"City";
            
            
        }
        
        
        if (indexPath.row==2) {
            
            NSString *s5=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_perstate"];
            
             NSString *s6=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_perzip"];
            
            
            NSString *s1=[NSString stringWithFormat:@"%@, %@",s5,s6];

            
            
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
            
            
            cell2.tit_labl.text=@"State";
            
        }
        
        
        if (indexPath.row==3) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_peraddress2"];
            
            cell2.tit_labl.text=@"Residential Address";
            
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }

                    }
        

        
        
        
        
        if (indexPath.row==4) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_percity"];
            
            
            
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
            cell2.tit_labl.text=@"City";
            
 
        }
        
        
        if (indexPath.row==5) {
            
            NSString *s5=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_perstate"];
            
            NSString *s6=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_perzip"];
            
            
            NSString *s1=[NSString stringWithFormat:@"%@, %@",s5,s6];
            
            
            
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
            
            
            cell2.tit_labl.text=@"State";
            
        }
        
        
        
        if (indexPath.row==6) {
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_joining_date"];
            
            cell2.tit_labl.text=@"Joining Date";
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
        }
        
        
        if (indexPath.row==7) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_dob"];
            
;
            
            cell2.tit_labl.text=@"Date of Birth";
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
            
        }
        
        
        if (indexPath.row==8) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_visatype"];
            
            cell2.tit_labl.text=@"Visa Type";
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
            
        }
        
        
        if (indexPath.row==9) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_salary"];
            
            cell2.tit_labl.text=@"Salary";
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
        }
        
        
        
        
        if (indexPath.row==9) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_employment_id"];

            
            cell2.tit_labl.text=@"ID";
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
            
        }
        
        
        if (indexPath.row==10) {
            
            NSString *s1=[[[Dict objectForKey:@"employee_list"] objectAtIndex:0] objectForKey:@"employee_nationality"];
            
            
            cell2.tit_labl.text=@"Nationality";
            if ([s1 isEqualToString:@""]) {
                cell2.sub_labl.text=@"-";
            }
            
            else{
                cell2.sub_labl.text=s1;
            }
            
        }
        

        
        return cell2;
    }
    
    
    
    else if (tableView==_tableView2)
    {
        
        
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = (indexPath.row % 2)? @"Text" : @"Web";
        
        return cell;
    }
    
    
    
    return  NO;
}

#pragma mark <UIWebViewDelegate>

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}
#pragma -mark <UITableViewDataSource>


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
