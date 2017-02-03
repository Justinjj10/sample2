//
//  LoginViewController.m
//  sample2
//
//  Created by lithin james on 11/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "LoginViewController.h"
#import "GlobalMethods.h"

#import "PasswordViewController.h"
#import "page1.h"
#import "MBProgressHUD.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    // globel method
    UIView *vieww;
    GlobalMethods*globalMethod;
   // UIActivityIndicatorView *spinner;
    NSMutableDictionary *Dict;
    UIImageView *spimage,*spimage1;
    MBProgressHUD *hud;
    
    UIView *viewMain;
      page1 *objSignin;
    
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
      hud.center = CGPointMake(self.view.frame.size.width  / 2,
                                self.view.frame.size.height / 2);
//    spimage=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
//   [self.view addSubview:spimage];
    //spimage1=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    //[self.view addSubview:spimage1];
    [self.view addSubview:self.txtUserName];
    [self.view addSubview:self.txtpassword];
    [self.view addSubview:self.next];
    [self.view addSubview:self.logoimg];
    
//
    

    
    
   // spimage.image=[UIImage imageNamed:@"iTunesArtwork"];
  //spimage1.image=[UIImage imageNamed:@"login_transstrip"];
    
//    [self.txtUserName addSubview:spimage];
//    [spimage addSubview:self.txtpassword];
//    [spimage addSubview:self.next];
//
//    
//    
    
  self.txtUserName.delegate=self;
    self.txtpassword.delegate=self;
    
    Dict=[[NSMutableDictionary alloc]init];
    
//    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    spinner.center = CGPointMake(self.view.frame.size.width  / 2,
//                                 self.view.frame.size.height / 2);
//    spinner.hidesWhenStopped = YES;

    // Do any additional setup after loading the view.
}

- (void) dismissKeyboard
{
    // add self
    [self.view endEditing:YES];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.txtUserName resignFirstResponder];
    [self.txtpassword resignFirstResponder];

    
 //  [self.view setFrame:CGRectMake(0,0,320,500)];
 // [self.logoimg setFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    return YES;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField==_txtpassword) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
        if (self.view.frame.size.height==480) {
            [self.view setFrame:CGRectMake(0,self.view.frame.origin.y-70,self.view.frame.size.width,self.view.frame.size.height)];
        }
        
               return YES;

        
    }
       return YES;
      }


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField==_txtpassword) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
        
        [self.view endEditing:YES];
        return YES;

        
    }
    return YES;
   }


- (void)keyboardDidShow:(NSNotification *)notification
{
    
  //  [self.txtpassword becomeFirstResponder];
    // Assign new frame to your view
 [self.view setFrame:CGRectMake(0,self.view.frame.origin.y-20,self.view.frame.size.width,self.view.frame.size.height)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
   [self.view setFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
}


-(void)viewWillAppear:(BOOL)animated{
    
    
    [self.navigationController setNavigationBarHidden:YES];
    

    
    
    
//    viewMain=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    
//    viewMain.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];
//    
//    
//    [self.view addSubview:viewMain];
//    [viewMain addSubview:self.txtUserName];
//    
//    [viewMain addSubview:self.next];

}

-(IBAction)next:(id)sender
{
    if (self.txtUserName.text.length==0) {
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter username" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];

    }
   
    
 else if (self.txtpassword.text.length==0) {
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
      
           
       }
    else if ([self.txtpassword.text isEqualToString:[Dict objectForKey:@"password"]])
    {
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Password is incorrect" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
    }
    

    else
    {
        [self fetchData];
    }
}

#pragma mark - Service
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
                    
                    
                    if (([[Dict objectForKey:@"message"] isEqualToString:@"successfully"])   ){
                        
                        
                        
                        
                        
//                        NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
//                        [UserDefaults setObject:[Dict objectForKey:@"authentication_key"] forKey:@"LoginData"];
//                   [UserDefaults synchronize];
                        
//                        NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
//                        [UserDefaults setObject:cellcategory.txtname.text forKey:@"name"];
//                        
//                        [UserDefaults setObject:[Dict objectForKey:@"id"] forKey:@"UserId"];
//                        
//
                        //// if ([self.txtpassword.text isEqualToString:[Dict objectForKey:@"password"]]) {
//                        
//                        
//                        [UserDefaults synchronize];
//
                        
                        
                        if ([[[Dict objectForKey:@"admin_data"] objectForKey:@"password"] isEqualToString:self.txtpassword.text]) {
                            
                            
                            
                            NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
                            [UserDefaults setObject:Dict forKey:@"CompanyDetails"];
                            [UserDefaults synchronize];

                            
                            
                            NSUserDefaults *UserDefaults1 = [NSUserDefaults standardUserDefaults];
                    [UserDefaults setObject:[Dict objectForKey:@"admin_data"] forKey:@"LoginData"];
                                               [UserDefaults1 synchronize];
                            
                            NSLog(@"yes");
                            
                            if (self.view.frame.size.height==480) {
                                objSignin=[self.storyboard instantiateViewControllerWithIdentifier:@"Home3.5"];
                            }
                            
                            else   if (self.view.frame.size.height==568) {
                                objSignin=[self.storyboard instantiateViewControllerWithIdentifier:@"Home4"];
                            }
                            
                            else   if (self.view.frame.size.height==667) {
                                objSignin=[self.storyboard instantiateViewControllerWithIdentifier:@"Home4.7"];
                            }
                            else
                            {
                                objSignin=[self.storyboard instantiateViewControllerWithIdentifier:@"Home5"];
                            }
                            
                            objSignin.ssurl=[Dict objectForKey:@"authentication_key"];
                            
                            [self.navigationController pushViewController:objSignin animated:YES];
                            

                            
                        }
                        
                    
                    else{
                        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Alert" message:[Dict objectForKey:@"message"]preferredStyle:UIAlertControllerStyleAlert];
                                            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                            [alert addAction:okAction];
                        
                        
                                            [self presentViewController: alert animated:YES completion:nil];
                    }
                    
//
                    
                    }
            
                
                [self hideHud];
                
            }
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{

    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";

    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/LoginApi?username=%@",self.txtUserName.text];
    
    
    
    
    
    
    
                
     
        
    
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
