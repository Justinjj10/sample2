//
//  emp_list.m
//  sample2
//
//  Created by Mac on 21/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "emp_list.h"
#import "emp_list_cell.h"
#import "GlobalMethods.h"
#import "slidemenudetailViewController.h"
#import "SlideNavigationController.h"
#import "MBProgressHUD.h"
#import "emp_prof.h"
#import "emp_search.h"
#import "search_cel.h"
#import "UIImageView+WebCache.m"

@interface emp_list ()
{
    emp_list_cell *cell;
    
    
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    UIView *vieww;
    UIActivityIndicatorView *spinner;

    MBProgressHUD *hud;
    search_cel *cell1;

    
}

@property (strong, nonatomic) UISearchController *controller;

@property (strong, nonatomic) NSMutableArray *results;
@property (strong, nonatomic) NSMutableArray *filteredcategoryArray;
@end

@implementation emp_list

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                  [UIColor whiteColor],
                                                                                                  NSForegroundColorAttributeName,
                                                                                                  
                                                                                                  
                                                                                                  nil]
                                                                                        forState:UIControlStateNormal];
       // Do any additional setup after
    
    
    [self.navigationItem setHidesBackButton:YES];
    
    [self.navigationItem setTitle:@"Employee"];

    
      hud.center = CGPointMake(self.view.frame.size.width  / 2,
                                 self.view.frame.size.height / 2);

    
    
    
    self.emptabl.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.emptabl.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
    [self fetchData];
    
    // Do any additional setup after loading the view.
}

    
    
    

    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    [self.emptabl reloadData];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    // Do the search...
}

- (void) searchBarTextDidBeginEditing: (UISearchBar*) searchBar {
    [searchBar setShowsCancelButton: YES animated: YES];
}

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    
    
    [self.view endEditing:YES];
    
      [searchBar setShowsCancelButton: NO animated: YES];
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
                [UserDefaults setObject:Dict forKey:@"EmployeeList"];
                [UserDefaults synchronize];
                
                
                [self.emptabl reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/employeelist?admin_id=1&Authorization=%@&start=0&limit=50",self.ss];
    
    
    
    
    
    
    
    
    
    
    
    
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
        _results=[[Dict  objectForKey:@"employee_list"]valueForKey:@"employee_name"];
        
        
        
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
    
    if (isFiltered) {
        return 1;
    }
    
    else
    return [[Dict objectForKey:@"employee_list"] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (isFiltered) {
        return 44;
    }
    
    else
        return 158;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (isFiltered) {
        return [_filteredcategoryArray count];
    }
    else
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
    
    
     if (!isFiltered) {
    
    static NSString *CellIdentifier = @"cel";
    
    
    
    
    
    
    cell=[self.emptabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"emp_list_cell" owner:self options:nil];
        
        
        cell=[toplevelobject objectAtIndex:0];
    }
    cell.img.layer.cornerRadius = cell.img.frame.size.width / 2.0;
    cell.img.clipsToBounds = YES;
    cell.img.backgroundColor=[self colorFromHexString:@"#ABEBC6"];
    
    //cell.textLabel.text=@"jus";
    
    NSString *s1=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"employee_name"] objectAtIndex:indexPath.section];
    
    NSString *s2=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"designation"] objectAtIndex:indexPath.section];
    
    NSString *s3=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"company"] objectAtIndex:indexPath.section];
    
    
    NSString *s4=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"employee_phone"] objectAtIndex:indexPath.section];
    
    
    NSString *s5=[[[Dict  objectForKey:@"employee_list"]valueForKey:@"employee_email"] objectAtIndex:indexPath.section];
         
         
         
         NSString *urlstring=[[[Dict objectForKey:@"employee_list"] valueForKey:@"profile_picture"]objectAtIndex:indexPath.section];
         NSURL *imageUrl=[NSURL URLWithString:urlstring];
         [cell.img sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"prof2"]];

    
   cell.ename.text=s1;
    cell.ecode.text=s2;
    cell.eaddres.text=s3;
    cell.ephone.text=s4;
    cell.eemail.text=s5;
//    NSString *firstChar=[s1 substringToIndex:1];
//    cell.imglabl.text=firstChar;

    return cell;
}
    
    
    
    
     else
     {
         
         static NSString *CellIdentifier = @"cel";
         
         
         
         
         
         
         cell1=[self.emptabl dequeueReusableCellWithIdentifier:CellIdentifier];
         
         
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
    
    
    if (!isFiltered) {
        
    
    
    emp_prof *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"EmpProf"];
    
    
    ob.ss=self.ss;
    ob.ss1=[[[Dict objectForKey:@"employee_list"] valueForKey:@"employee_id"]objectAtIndex:indexPath.section];
    
    ob.prof=[[[Dict objectForKey:@"employee_list"] valueForKey:@"profile_picture"]objectAtIndex:indexPath.section];

    
    
    [self.navigationController pushViewController:ob animated:YES];
    
    
    }
    else
    {
        
        
        
        
        
        
        NSMutableArray *di=[[NSMutableArray alloc]init];
        NSMutableArray *diID=[[NSMutableArray alloc]init];
        NSMutableArray *diLo=[[NSMutableArray alloc]init];
        
        
        NSLog(@"%@",Dict);
        for (int i=0; i<[[Dict objectForKey:@"employee_list"]count]; i++) {
            
            NSString *o=[NSString stringWithFormat:@"%@",[[[Dict objectForKey:@"employee_list"] objectAtIndex:i]objectForKey:@"employee_name"]];
            
            [di addObject:o];
            
            
        }
        
        NSLog(@"%@",[self.filteredcategoryArray objectAtIndex:indexPath.row ]);
        
        
        
        
        for (int r=0; r<[[Dict objectForKey:@"employee_list"]count]; r++) {
            
            [diID addObject:[[[Dict objectForKey:@"employee_list"] objectAtIndex:r]objectForKey:@"employee_id"]];
        }
        
        
        
        
        for (int i=0; i<[[Dict objectForKey:@"employee_list"]count]; i++) {
            
            [diLo addObject:[[[Dict objectForKey:@"employee_list"] objectAtIndex:i]objectForKey:@"profile_picture"]];
        }
        
        
        NSLog(@"%ld",[di indexOfObject:[self.filteredcategoryArray objectAtIndex:indexPath.row ]]);
        
        NSString *str=[self.filteredcategoryArray objectAtIndex:indexPath.row ];
        
        int y=(int)[di indexOfObject:str];
        
        
       emp_prof *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"EmpProf"];
        
        
        ob.ss=self.ss;
        ob.ss1=[diID objectAtIndex:y];
        
        
        ob.prof=[diLo objectAtIndex:y];
        
        [self.navigationController pushViewController:ob animated:YES];
        
        
        
        
        

        
        
    }
    
    
    
    
    
    
    
}




# pragma mark - Search Controller Delegate (optional)

- (void)didDismissSearchController:(UISearchController *)searchController {
    
    // called when the search controller has been dismissed
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    
    // called when the serach controller has been presented
}

- (void)presentSearchController:(UISearchController *)searchController {
    
    // if you want to implement your own presentation for how the search controller is shown,
    // you can do that here
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    
    // called just before the search controller is dismissed
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    
    // called just before the search controller is presented
}





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
