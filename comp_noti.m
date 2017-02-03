//
//  comp_noti.m
//  sample2
//
//  Created by Mac on 7/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "comp_noti.h"
#import "slidemenudetailViewController.h"
#import "SlideNavigationController.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"
#import "comp_noti_cell.h"

@interface comp_noti ()
{
    UIDatePicker *datePicker;
    UIDatePicker *datePickerDob;
    NSString *date;
    NSString *dueDate,*dueDate1,*dueDate2,*dueDate3,*dueDate4,*dueDate5;
     UIToolbar *toolBar;
        UIBarButtonItem *barButtonDone;
    
    NSMutableDictionary *Dict,*Dict1,*Dict2,*Dict3,*Dict4;
    GlobalMethods *globalMethod;
    UIView *vieww;
    MBProgressHUD *hud;
    
    comp_noti_cell *cell;
    NSString *formattedDate;
    
    

    
 
}
//@property (nonatomic, strong) NSArray *shopping;

@end

@implementation comp_noti
int f;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    

  
    self.shopping= @[@" Muncipal Licence",
                     @"Commercial registration",
                     
                     @"Muncipal Baladia",
                     @"Computer Card" ,
                     @"Tax Card",
                     
                    ];
    
        [self.navigationItem setTitle:@"Company"];

    
    self.selectionList = [[HTHorizontalSelectionList alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 60)];
    
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
     [self current];
    
//    
//    _datelabl.hidden=NO;
//    
//    _date_labl1.hidden=YES;
//    
//    _date_labl2.hidden=YES;
//    
//    _date_labl3.hidden=YES;
//     _date_labl4.hidden=YES;
//
//    
    
    f=0;
    
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

-(void)current
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd,yyyy"];
    NSDate *now = [NSDate date];
 formattedDate = [formatter stringFromDate:now];
    _datelabl.text=formattedDate;
    _date_labl1.text=formattedDate;
    _date_labl2.text=formattedDate;
    _date_labl3.text=formattedDate;
    _date_labl4.text=formattedDate;
    
    
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
        
        f=0;
        
        [self current];
        
//        _datelabl.hidden=NO;
//        
//        _date_labl1.hidden=YES;
//        
//        _date_labl2.hidden=YES;
//        
//         _date_labl3.hidden=YES;
//        _date_labl4.hidden=YES;
//        
//        
//        
//        
//        
//        _date_labl1=nil;
//        _date_labl2=nil;
//        _date_labl3=nil;
//        _date_labl4=nil;
//
//        

        
        Dict=[[NSMutableDictionary alloc]init];
        
        [self fetchData];
        
        
        
    }
    
    else if (index==1)
    {
        
        f=1;
        
        [self current];
        
        
        
//        _datelabl.hidden=YES;
//        
//        _date_labl1.hidden=NO;
//        
//        _date_labl2.hidden=YES;
//        
//        _date_labl3.hidden=YES;
//         _date_labl4.hidden=YES;
//
//        
//        _datelabl=nil;
//        _date_labl2=nil;
//        _date_labl3=nil;
//
//        _date_labl4=nil;
//        
        
        

        
         Dict1=[[NSMutableDictionary alloc]init];
        
        [self fetchData1];
    }
    
    
    else if (index==2){
        
       f=2;
        
        [self current];
        
//        
//        _datelabl.hidden=YES;
//        
//        _date_labl1.hidden=YES;
//        
//        _date_labl2.hidden=NO;
//        
//        _date_labl3.hidden=YES;
//        _date_labl4.hidden=YES;
//        
//        _datelabl=nil;
//        _date_labl1=nil;
//        _date_labl3=nil;
//        _date_labl4=nil;
//
//    
        
         Dict2=[[NSMutableDictionary alloc]init];
        [self fetchData2];
    
        
    }
    
    else if (index==3){
        
        f=3;
        [self current];
        
        
        
//        _datelabl.hidden=YES;
//        
//        _date_labl1.hidden=YES;
//        
//        _date_labl2.hidden=YES;
//        
//        _date_labl3.hidden=NO;
//        _date_labl4.hidden=YES;
//        
//        _datelabl=nil;
//        _date_labl1=nil;
//        _date_labl2=nil;
//        _date_labl4=nil;
//        
//
 
        

        
        
        Dict3=[[NSMutableDictionary alloc]init];
        
        [self fetchData3];
        
        
    }
    else if (index==4){
        
        f=4;
        
        [self current];
        
        
//        
//        _datelabl.hidden=YES;
//        
//        _date_labl1.hidden=YES;
//        
//        _date_labl2.hidden=YES;
//        
//        _date_labl3.hidden=YES;
//        _date_labl4.hidden=NO;
//        
//        _datelabl=nil;
//        _date_labl1=nil;
//        _date_labl3=nil;
//        _date_labl2=nil;
//
//        

        
        
        Dict4=[[NSMutableDictionary alloc]init];
        [self fetchData4];
        
        
    }

    
    
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
//    
    if (([[Dict objectForKey:@"message"] isEqualToString:@"Data Not Found"])   ){
        
        
                            UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Not Found" message:@"No data Available" preferredStyle:UIAlertControllerStyleAlert];
                            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                            [alert addAction:okAction];
        
        
                            [self presentViewController: alert animated:YES completion:nil];
        
                            
                        }
                        else{

                            NSString *s=[[Dict objectForKey:@"company_notification"]valueForKey:@"notification_data"];
                            
                            _disp_labl.text=s;                       }
}

-(BOOL)urlList_Requesttri
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/companynotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Muncipal Licence",self.ss,_datelabl.text];
    

    
    
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
        
        NSString *s=[[Dict1 objectForKey:@"company_notification"]valueForKey:@"notification_data"];
    
        _disp_labl.text=s;
    }
}


-(BOOL)urlList_Requesttri1
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/companynotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Commercial Registration",self.ss,_datelabl.text];
    
    
    
    
    
    
    
    
    
    
    
    
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
        
        NSString *s=[[Dict2 objectForKey:@"company_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;
    }
}

-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/companynotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Muncipal Baladia",self.ss,_datelabl.text];
    
    
    
    
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
        
        NSString *s=[[Dict3 objectForKey:@"company_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;
    
    }

}

-(BOOL)urlList_Requesttri3
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/companynotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Computer Card",self.ss,_datelabl.text];
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
        
        NSString *s=[[Dict4 objectForKey:@"company_notification"]valueForKey:@"notification_data"];
        
        _disp_labl.text=s;    }
}



-(BOOL)urlList_Requesttri4
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/companynotification?admin_id=1&Authorization=%@&notification_start_date=%@&title=Tax Card",self.ss,_datelabl.text];
    
    
    
    
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


#pragma mark- tableview




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
    static NSString *CellIdentifier = @"cel";
    
    
    
    
    
    
    cell=[self.comp_notitabl dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"comp_noti_cell" owner:self options:nil];
        
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





-(void )date
{
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillHide:)
                                                 //name:UIKeyboardWillHideNotification object:nil];
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
    
    
    
    if (f==0) {
        [self fetchData];
    }
    else if (f==1)
    {
        [self fetchData1];
    }
    else if (f==2)
    {
        [self fetchData2];
    }
    else if (f==3)
    {
        [self fetchData3];
    }
    else if (f==4)
    {
        [self fetchData4];
    }



    
}

-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    //[dateFormat setDateFormat:@"MM/dd/yyyy"];
    
    [dateFormat setDateFormat:@"MMM dd,yyyy "];
    
    //[dateFormat setDateFormat:@"yyyy-MM-ddHH:mm:ss"];
  //  NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:datePicker.date]];
    //assign text to label
    
    //        NSDateFormatter *dateFormat1=[[NSDateFormatter alloc]init];
    //        [dateFormat1 setDateFormat:@"yyyy-MM-ddHH:mm:ss"];
    //
    
    //   date  = [dateFormat dateFromString:str];
    
    
    //   date=[NSString stringWithFormat:@"%@",[dateFormat1  stringFromDate:datePicker.date]];
    
    NSString *stringWithoutSpaces = [NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:datePicker.date]];
    
    NSString *s1=[stringWithoutSpaces stringByReplacingOccurrencesOfString:@"-" withString:@""];
    dueDate=[s1 stringByReplacingOccurrencesOfString:@":" withString:@""];
    
    _datelabl.text=dueDate;

   
    
    
    
    

    
    
    
}





//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//        CGFloat sectionHeaderHeight = 40;
//        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//                scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//                scrollView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
//        }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
