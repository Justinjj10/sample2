//
//  emp_noti.m
//  sample2
//
//  Created by Mac on 9/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "emp_noti.h"
#import "SlideNavigationController.h"
#import "slidemenudetailViewController.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"
#import "emp_noti_cell.h"
@interface emp_noti (){
    UIDatePicker *datePicker;
    UIDatePicker *datePickerDob;
    NSString *date;
    NSString *dueDate;
    UIToolbar *toolBar;
    UIBarButtonItem *barButtonDone;
    emp_noti_cell *cell;
    
    NSMutableDictionary *Dict,*Dict1,*Dict2,*Dict3,*Dict4,*Dict5;
    GlobalMethods *globalMethod;
    UIView *vieww;
    MBProgressHUD *hud;
 
    
    
}

@end

@implementation emp_noti
int e;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    hud.center = CGPointMake(self.view.frame.size.width  / 2,
                             self.view.frame.size.height / 2);
    
       //[anotherButton release];
    // Do any additional setup after loading the view.
 [self.navigationItem setHidesBackButton:YES];
    
   
    
    [self.navigationItem setTitle:@"Company"];
    
    
    self.shopping= @[@" Qatar ID",
                     @"Visa",
                     
                     @"Passport",
                     @"Health Card" ,
                     @"Insurance",
        @"Driving Licence",
                     ];
    
    
    
    
    self.selectionList = [[HTHorizontalSelectionList alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 60)];
    
    self.selectionList.delegate = self;
    self.selectionList.dataSource = self;
    
    self.selectionList.selectionIndicatorAnimationMode = HTHorizontalSelectionIndicatorAnimationModeLightBounce;
    self.selectionList.showsEdgeFadeEffect = YES;
    
    
    self.selectionList.selectionIndicatorColor = [UIColor redColor];
    
    [self.selectionList setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.selectionList setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.selectionList setTitleFont:[UIFont systemFontOfSize:13] forState:UIControlStateNormal];
    [self.selectionList setTitleFont:[UIFont boldSystemFontOfSize:15] forState:UIControlStateHighlighted];
    
    
    
    //        self.selectionList = [[HTHorizontalSelectionList alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    //        _selectionList.delegate = self;
    //   _selectionList.dataSource = self;
    _selectionList.backgroundColor=[self colorFromHexString:@"#1a91ff"];
    [self.view addSubview:_selectionList];
    e=0;
    
    [self current];

    
    [self fetchData];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd,yyyy"];
    NSDate *now = [NSDate date];
    NSString *formattedDate = [formatter stringFromDate:now];
    _datelabl.text=formattedDate;
}
-(IBAction)addEvents:(id)sender
{
    [self date];
}
#pragma mark - HTHorizontalSelectionListDataSource Protocol Methods

- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList {
    
    
    return _shopping.count;
}

- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index {
    return self.shopping[index];
}

#pragma mark - HTHorizontalSelectionListDelegate Protocol Methods

- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index {
    // update the view for the corresponding index
    
    NSLog(@"%ld",(long)index);
    
    
    if (index==0) {
        
        e=0;
        
        Dict=[[NSMutableDictionary alloc]init];
        
        [self fetchData];
        
        
    }
    
    else if (index==1)
    {
        e=1;
        [self current];
        
        Dict1=[[NSMutableDictionary alloc]init];
        
        [self fetchData1];
    }
    
    
    else if (index==2){
        e=2;
        
        [self current];

        Dict2=[[NSMutableDictionary alloc]init];
        [self fetchData2];
        
        
    }
    
    else if (index==3){
        e=3;
        
        [self current];

        Dict3=[[NSMutableDictionary alloc]init];
        [self fetchData3];
        
        
    }
    else if (index==4){
        e=4;
        
        [self current];

        Dict4=[[NSMutableDictionary alloc]init];
        [self fetchData4];
        
        
    }
    
    
    else if (index==5){
        e=5;
        Dict5=[[NSMutableDictionary alloc]init];
        [self fetchData5];
        
        
    }

    
    
    
    
}
-(void)current
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd,yyyy"];
    NSDate *now = [NSDate date];
   NSString *  formattedDate = [formatter stringFromDate:now];
    _datelabl.text=formattedDate;
}



#pragma mark- fetchData
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
                //                if (([[Dict objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
                //
                //
                //                    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
                //                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                //                    [alert addAction:okAction];
                //
                //
                //                    [self presentViewController: alert animated:YES completion:nil];
                //
                //
                //                }
                //                else{
                
                
                [self disp];
                // }
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}


-(void)disp


{
    
    if (([[Dict objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
        
        
    }
    else{
        
        NSString *s=[[Dict objectForKey:@"employee_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;
    }
}



-(BOOL)urlList_Requesttri
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/employeenotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Qatar ID",self.ss,_datelabl.text];
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    //    NSString* webStringURL = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    NSString* webStringURL = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL  *url=[NSURL URLWithString:webStringURL];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = url;
    
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


#pragma mark- fetchData1


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
            
            
            //            else
            //            { if (([[Dict1 objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
            //
            //
            //                UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
            //                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            //                [alert addAction:okAction];
            //
            //
            //                [self presentViewController: alert animated:YES completion:nil];
            //
            //
            //            }
            //            else{
            //
            //                [self.comp_notitabl reloadData];
            //            }
            else{
                
                [self disp1];
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}

-(void)disp1


{
    
    if (([[Dict1 objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
        
        
    }
    else{
        
        NSString *s=[[Dict1 objectForKey:@"employee_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;
    }
}



-(BOOL)urlList_Requesttri1
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/employeenotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Visa",self.ss,_datelabl.text];
    
    
    
    
    
    
    
    
    
    
    
    
    NSString* webStringURL = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL  *url=[NSURL URLWithString:webStringURL];
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = url;
    
    
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



#pragma mark-fetchData2


-(void)fetchData2
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
                [self disp2];
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}


-(void)disp2


{
    
    if (([[Dict2 objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
        
        
    }
    else{
        
        NSString *s=[[Dict2 objectForKey:@"employee_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;    }
}



-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/employeenotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Passport",self.ss,_datelabl.text];
    
    
    
    
    NSString* webStringURL = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL  *url=[NSURL URLWithString:webStringURL];
    
    
    
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = url;
    
    
    
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
        
        
        
        Dict2= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict2);
        
        
        
        
        return YES;
        
    }
    return YES;
    
    
}


#pragma  mark-fetchData3


-(void)fetchData3
{
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^ {
        [self showHud];
        BOOL userexits;
        
        userexits=  [self urlList_Requesttri3  ];
        
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
                [self disp3];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}

-(void)disp3


{
    
    if (([[Dict3 objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
        
        
    }
    else{
        NSString *s=[[Dict3 objectForKey:@"employee_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;    }
}


-(BOOL)urlList_Requesttri3
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/employeenotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Health Card",self.ss,_datelabl.text];
    NSString* webStringURL = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL  *url=[NSURL URLWithString:webStringURL];
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = url;
    
    
    
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
        
        
        
        Dict3= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict3);
        
        
        
        
        return YES;
        
    }
    return YES;
    
    
}


#pragma mark- fetchData4

-(void)fetchData4
{
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^ {
        [self showHud];
        BOOL userexits;
        
        userexits=  [self urlList_Requesttri4  ];
        
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
                [self disp4];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}


-(void)disp4


{
    
    if (([[Dict4 objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
        
        
    }
    else{
        
        NSString *s=[[Dict4 objectForKey:@"employee_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;
    }
}




-(BOOL)urlList_Requesttri4
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/employeenotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Insurance",self.ss,_datelabl.text];
    
    
    
    
    NSString* webStringURL = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL  *url=[NSURL URLWithString:webStringURL];
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = url;
    
    
    
    
    
    
    
    
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
        
        
        
        Dict4= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict4);
        
        
        
        
        return YES;
        
    }
    return YES;
    
    
}


#pragma mark- fetchData5

-(void)fetchData5
{
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^ {
        [self showHud];
        BOOL userexits;
        
        userexits=  [self urlList_Requesttri5  ];
        
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
                
                [self disp5];
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}

-(void)disp5


{
    
    if (([[Dict5 objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
        
        
    }
    else{
        
        NSString *s=[[Dict5 objectForKey:@"employee_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;    }
}




-(BOOL)urlList_Requesttri5
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/EmployeeApi/employeenotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Driving Licence",self.ss,_datelabl.text];
    
    
    
    
    NSString* webStringURL = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL  *url=[NSURL URLWithString:webStringURL];
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = url;
    
    
    
    
    
    
    
    
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
        
        
        
        Dict5= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict5);
        
        
        
        
        return YES;
        
    }
    return YES;
    
    
}





#pragma mark- tableview




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
    static NSString *CellIdentifier = @"cel";
    
    
    
    
    
    
    cell=[self.emp_noti_tabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"emp_noti_cell" owner:self options:nil];
        
        cell=[toplevelobject objectAtIndex:0];
    }
    
    cell.textLabel.text=@"jj";
    
    //cell.textLabel.text=@"jus";
    
    
    return cell;
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

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}




-(void )date
{
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillHide:)
//                                                 name:UIKeyboardWillHideNotification object:nil];
    //    [cellcategory.txtconfirm resignFirstResponder];        [self.view endEditing:YES];
    //    [cellcategory.txtduedate resignFirstResponder];
    [datePickerDob removeFromSuperview];
    [toolBar removeFromSuperview];
    
    
    
    
    datePicker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-200,(self.view.frame.size.width), 200)];
    
   // [datePicker setMinimumDate: [NSDate date]];
    datePicker.datePickerMode=UIDatePickerModeDate;
    datePicker.backgroundColor=[UIColor whiteColor];
    datePicker.date=[NSDate date];
    [datePicker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    
    toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-244,self.view.frame.size.width,44)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                     style:UIBarButtonItemStylePlain target:self action:@selector(changeDateFromLabel:)];
    
  
    
    //toolBar.items=@[button2];
    toolBar.items = @[barButtonDone];
    barButtonDone.tintColor=[UIColor whiteColor];
    [self.view addSubview:toolBar];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:toolBar];
    
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:datePicker];
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    
}
-(void)changeDateFromLabel:(id)sender
{
    
    
    NSLog(@"%@",[datePicker date]);
    
    [self LabelTitle:[datePicker date] ];
    
    
    [datePicker removeFromSuperview];
    [toolBar removeFromSuperview];
    
    if (e==0) {
        [self fetchData];
}
    
    else if (e==1)
    {
        [self fetchData1];
    }
    else if (e==2)
    {
        [self fetchData2];
    }
    else if (e==3)
    {
        [self fetchData3];
    }
    
    else if (e==4)
    {
        [self fetchData4];
    }
    else if (e==5)
    {
        [self fetchData5];
    }
    

    

    

    
    
    
    
    
}

-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    //[dateFormat setDateFormat:@"MM/dd/yyyy"];
    
    [dateFormat setDateFormat:@"MMM dd,yyyy "];
    
    
    
    NSString *stringWithoutSpaces = [NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:datePicker.date]];
    
    NSString *s1=[stringWithoutSpaces stringByReplacingOccurrencesOfString:@"-" withString:@""];
    dueDate=[s1 stringByReplacingOccurrencesOfString:@":" withString:@""];
    
    
    
    
    _datelabl.text=dueDate;
    
    
    
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
