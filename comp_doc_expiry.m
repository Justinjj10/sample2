//
//  comp_doc_expiry.m
//  sample2
//
//  Created by Mac on 30/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "comp_doc_expiry.h"
#import "GlobalMethods.h"
#import "comp_doc_expcell.h"
#import "SlideNavigationController.h"
#import "slidemenudetailViewController.h"
//#import "XScrollDataSourceAccess.h"
//#import "XScrollItemsByCategory.h"
#import "XScrollViewCell.h"
#import "ASOXScrollTableViewCell.h"

@interface comp_doc_expiry ()<ASOXScrollTableViewCellDelegate>
{
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    UIView *vieww;
    UIActivityIndicatorView *spinner;
    //comp_doc_expcell *cell;
    
    ASOXScrollTableViewCell *_xScrollTableViewCell;
    
}



@end

@implementation comp_doc_expiry

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Dict=[[NSMutableDictionary alloc]init];
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(self.view.frame.size.width  / 2,
                                 self.view.frame.size.height / 2);
    spinner.hidesWhenStopped = YES;
    
    
    
    self.docstatus_tabl.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.docstatus_tabl.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
    NSLog(@"%@",self.ss);
    
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
            
            
            //                else
            //                {
            //
            //
            //                    if (([[Dict objectForKey:@"message"] isEqualToString:@"successfully"])   ){
            //
            //
            //
            //
            //
            //                        //                        NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
            //                        //                        [UserDefaults setObject:[Dict objectForKey:@"authentication_key"] forKey:@"LoginData"];
            //                        //                   [UserDefaults synchronize];
            //
            //                        //                        NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
            else{
                
                [self.docstatus_tabl reloadData];                //  [self calculate];
                
                [self stop];
                
            }
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/company_doc_exp_list?admin_id=1&Authorization=%@&start=0&limit=30",self.ss];
    
    
    
    
    
    
    
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = [NSURL URLWithString:urlString];
    
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-type"];
    
    NSHTTPURLResponse *response = nil;
    NSError *error ;
    NSData *returnData =[NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    //    NSString* newStr = [NSString stringWithUTF8String:[returnData bytes]];
    //    NSLog(@"return data %@",newStr);
    //
    
    
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



#pragma slide

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

//@"http://app.sponsormasterqatar.com/index.php/CompanyApi/company_doc_exp_list?admin_id=1&Authorization=%@&start=0&limit=30"

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
