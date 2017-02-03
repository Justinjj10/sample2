//
//  company_list.m
//  sample2
//
//  Created by Mac on 19/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "company_list.h"
#import "company_list_cell.h"
#import "GlobalMethods.h"
#import "slidemenudetailViewController.h"
#import "SlideNavigationController.h"
#import "MBProgressHUD.h"
#import "company_detail.h"
#import "view1.h"
#import "cmp_profile.h"
#import "UIImageView+WebCache.h"
#import "calender1.h"
#import "calender1_cel.h"
#import "search_cel.h"
//#import "MGSwipeTableCell.h"


@interface company_list ()<UITableViewDelegate,UITableViewDataSource>
{
    company_list_cell *cell;
    
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    UIView *vieww;
    UIActivityIndicatorView *spinner;
     MBProgressHUD *hud;
    
    NSArray *caray;
    search_cel *cell1;
    
 
}
@property (strong, nonatomic) UISearchController *controller;

@property (strong, nonatomic) NSMutableArray *results;
@property (strong, nonatomic) NSMutableArray *filteredcategoryArray;
@end

@implementation company_list

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                  [UIColor whiteColor],
                                                                                                   NSForegroundColorAttributeName,
                                                                                                  
                                                                                                  
                                                                                                  nil]
                                                                                        forState:UIControlStateNormal];
    
    caray=[NSArray arrayWithObjects:[self colorFromHexString:@"#F8C471"],
           [self colorFromHexString:@"#D2B4DE"],
           [self colorFromHexString:@"#F1948A"],
            [self colorFromHexString:@"#F5B041"],
           [self colorFromHexString:@"#73C6B6"],
           [self colorFromHexString:@"#BBA4F4"],

           
           
           
       
 nil];
    
   //     self.navigationItem.titleView = self.searchBar;
    
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(test)
//                                                 name:@"Image_Notification"
//                                               object:nil];
//    [self.navigationItem setHidesBackButton:YES];
//    
//    [self.navigationItem setTitle:@"Company"];
    
    
    Dict=[[NSMutableDictionary alloc]init];
    
//    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    hud.center = CGPointMake(self.view.frame.size.width  / 2,
                                 self.view.frame.size.height / 2);

    
    
    //spinner.hidesWhenStopped = YES;
    
    
    
    self.comptabl.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.comptabl.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    

    
    [self fetchData];
    // Do any additional setup after loading the view.
}


//
#pragma mark-Search






- (void) searchBarTextDidBeginEditing: (UISearchBar*) searchBar {
    
  
        
        [searchBar setShowsCancelButton: YES animated: YES];

        
    
}



-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText
{
    if(searchText.length == 0)
    {
        isFiltered = NO;
    }
    else
    {
        isFiltered = YES;
        _filteredcategoryArray = [[NSMutableArray alloc] init];
        
        for (NSString *str in _results)
        {
            
            NSRange StringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(StringRange.location != NSNotFound )
            {
                [_filteredcategoryArray addObject:str];
            }
        }
    }
    
    [self.comptabl reloadData];
}


-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    
    
    [self.view endEditing:YES];
   [searchBar setShowsCancelButton: NO animated: YES];
    
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    // Do the search...
}
//-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
//{
//    [_tabl becomeFirstResponder];
//}
//















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
                NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
                [UserDefaults setObject:Dict forKey:@"CompanyList"];
                [UserDefaults synchronize];
                

                
                
                [self.comptabl reloadData];
                
               [self hideHud];
            
            }
            
            
                
            
                
         
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/companylist?admin_id=1&Authorization=%@&start=0&limit=50",self.ss];
    
    
    
    
    
    
    
    
    
    
    
    
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
        
        _results=[[Dict  objectForKey:@"company_list"]valueForKey:@"company_name"];
        
        
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
    if (isFiltered) {
        return 1;
    }

        else
          return [[Dict objectForKey:@"company_list"] count];
        
    // in your case, there are 3 cells
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (isFiltered) {
        return 44;
    }
    
    else
        return 158;

}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (isFiltered) {
        return [_filteredcategoryArray count];
    }
      else
        return 1;
        
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
    

      if (!isFiltered) {
    
     static NSString *CellIdentifier = @"cel";
    
    
   
    
    
    
    cell=[self.comptabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"company_list_cell" owner:self options:nil];
        
       
        cell=[toplevelobject objectAtIndex:0];
    }
    
  
    
    
      
    //int count=0;
   // NSString *so=@"5";
   // NSString *sm=[NSString stringWithFormat:@"%@",]
    
//    if (fre%10==0) {
//        
//        
//          cell.img.backgroundColor=[caray objectAtIndex:0];
//        
//    }
//    else{
//         cell.img.backgroundColor=[caray objectAtIndex:1];
//    }

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
    
    
//    cell.img.backgroundColor=[self colorFromHexString:@"#F8C471"];
    cell.img.layer.cornerRadius = cell.img.frame.size.width / 2.0;
    cell.img.clipsToBounds = YES;

    
    NSString *s1=[[[Dict  objectForKey:@"company_list"]valueForKey:@"company_name"] objectAtIndex:indexPath.section];
    
    NSString *s2=[[[Dict  objectForKey:@"company_list"]valueForKey:@"company_code"] objectAtIndex:indexPath.section];

    NSString *s3=[[[Dict  objectForKey:@"company_list"]valueForKey:@"company_address"] objectAtIndex:indexPath.section];
    
    
    NSString *s4=[[[Dict  objectForKey:@"company_list"]valueForKey:@"company_phone"] objectAtIndex:indexPath.section];
    
    
    NSString *s5=[[[Dict  objectForKey:@"company_list"]valueForKey:@"company_email"] objectAtIndex:indexPath.section];

    
    
    NSString *urlstring=[[[Dict objectForKey:@"company_list"] valueForKey:@"company_logo"]objectAtIndex:indexPath.section];
    NSURL *imageUrl=[NSURL URLWithString:urlstring];
    [cell.img sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"prof2"]];
    

    
    
    cell.c_name.text=s1;
    cell.c_code.text=s2;
    cell.c_addr.text=s3;
    cell.c_phone.text=s4;
    cell.c_email.text=s5;
    
    
//   
//    NSString *firstChar=[s1 substringToIndex:1];
//    cell.imglabl.text=firstChar;
//          
          return  cell;

    
}

    else
    {
        
        static NSString *CellIdentifier = @"cel";
    
    
    
    
    
    
    cell1=[self.comptabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell1==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"search_cel" owner:self options:nil];
        
        
        cell1=[toplevelobject objectAtIndex:0];
    }
    

        
        cell1.textLabel.text=[_filteredcategoryArray objectAtIndex:indexPath.row];
        return  cell1;
}
    
    
    return  NO;

}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//  
    if (!isFiltered) {

        cmp_profile *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"prof"];
        
        
        ob.ss=self.ss;
        ob.ss1=[[[Dict objectForKey:@"company_list"] valueForKey:@"company_id"]objectAtIndex:indexPath.section];
        ob.prof=[[[Dict objectForKey:@"company_list"] valueForKey:@"company_logo"]objectAtIndex:indexPath.section];
        
        
        [self.navigationController pushViewController:ob animated:YES];
    
    
    
    }
    else
    {
        
    
    
    
    
    
    NSMutableArray *di=[[NSMutableArray alloc]init];
    NSMutableArray *diID=[[NSMutableArray alloc]init];
    NSMutableArray *diLo=[[NSMutableArray alloc]init];


    NSLog(@"%@",Dict);
    for (int i=0; i<[[Dict objectForKey:@"company_list"]count]; i++) {
        
        NSString *o=[NSString stringWithFormat:@"%@",[[[Dict objectForKey:@"company_list"] objectAtIndex:i]objectForKey:@"company_name"]];
        
        [di addObject:o];

        
    }
    
    NSLog(@"%@",[self.filteredcategoryArray objectAtIndex:indexPath.row ]);
    
    
    
    
    for (int r=0; r<[[Dict objectForKey:@"company_list"]count]; r++) {

    [diID addObject:[[[Dict objectForKey:@"company_list"] objectAtIndex:r]objectForKey:@"company_id"]];
    }
    
    
    
    
    for (int i=0; i<[[Dict objectForKey:@"company_list"]count]; i++) {

    [diLo addObject:[[[Dict objectForKey:@"company_list"] objectAtIndex:i]objectForKey:@"company_logo"]];
    }
    

    NSLog(@"%ld",[di indexOfObject:[self.filteredcategoryArray objectAtIndex:indexPath.row ]]);
    
    NSString *str=[self.filteredcategoryArray objectAtIndex:indexPath.row ];
    
    int y=(int)[di indexOfObject:str];
    
    
    cmp_profile *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"prof"];
    
   
           ob.ss=self.ss;
           ob.ss1=[diID objectAtIndex:y];
    
    
           ob.prof=[diLo objectAtIndex:y];
   
        [self.navigationController pushViewController:ob animated:YES];

    
    
    

    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
