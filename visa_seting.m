//
//  visa_seting.m
//  sample2
//
//  Created by Mac on 27/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "visa_seting.h"
#import "SlideNavigationController.h"
#import "slidemenudetailViewController.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"

#import "visatypelist1.h"
#import "visacat.h"
#import "Reportlist.h"
#import "clientcell.h"
#import "sponosorlistTableViewCell.h"


@interface visa_seting ()< UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableDictionary *Dict,*Dict1,*Dict2,*Dict3,*Dict4;
    GlobalMethods *globalMethod;
    MBProgressHUD *hud;
    
    visatypelist1 *v11;
    visacat *c1;
    Reportlist *r;
    clientcell *ccell;
    sponosorlistTableViewCell *spon;

    
    
    
    

}





@end



@implementation visa_seting

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
    self.shopping= @[@"Visa Type List",
                     @"Category List",
                     @"Sponosor List",
                     @"Client List",
                     @"Report List"];
    

    
    
    
    
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

    
    
    
    
    self.tableView3.backgroundView = nil;
    //self.comptabl.backgroundView = [[[UIView alloc] init] autorelease];
    self.tableView3.backgroundColor=[self colorFromHexString:@"#F2F3F4"];
    
    
    
    
    [_collectionView registerNib:[UINib nibWithNibName:@"visatypelist1" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
    [_collectionView1 registerNib:[UINib nibWithNibName:@"visacat" bundle:nil] forCellWithReuseIdentifier:@"cela"];

    _collectionView.hidden=NO;
    _collectionView1.hidden=YES;
    _tableView.hidden=YES;
    _tableView1.hidden=YES;
    _tableView3.hidden=YES;
    
    
    [self fetchData];
    //  [self fetchData1];
    
    
    // Do any additional setup after loading the view.
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
    
    if(index==0)
    {
        _collectionView.hidden=NO;
        _collectionView1.hidden=YES;
        _tableView.hidden=YES;
        _tableView1.hidden=YES;
        _tableView3.hidden=YES;
        
        
        
        Dict=[[NSMutableDictionary alloc]init];
        [self fetchData];
        
        
        
        //_t7.hidden=YES;
        //        Dict=[[NSMutableDictionary alloc]init];
        //        //        [self.t6 reloadData];
        //        [self fetchData];
    }
    
    else if(index==1)
    {
        
        _collectionView.hidden=YES;
        _collectionView1.hidden=NO;
        _tableView.hidden=YES;
        _tableView1.hidden=YES;
        _tableView3.hidden=YES;
        
        
        
        
        Dict1=[[NSMutableDictionary alloc]init];
        //        //[self.t7 reloadData];
        [self fetchData1];
    }
    else if(index==2)
    {
        
        _collectionView.hidden=YES;
        _collectionView1.hidden=YES;
        _tableView.hidden=NO;
        _tableView1.hidden=YES;
        _tableView3.hidden=YES;
        
        
        
        Dict2=[[NSMutableDictionary alloc]init];
        //        //[self.t7 reloadData];
        [self fetchData2];
    }
    
    
    else if(index==3)
    {
        
        _collectionView.hidden=YES;
        _collectionView1.hidden=YES;
        _tableView.hidden=YES;
        _tableView1.hidden=NO;
        _tableView3.hidden=YES;
        
        
        Dict3=[[NSMutableDictionary alloc]init];
        //        //[self.t7 reloadData];
        [self fetchData3];
    }
    else if(index==4)
    {
        
        _collectionView.hidden=YES;
        _collectionView1.hidden=YES;
        _tableView.hidden=YES;
        _tableView1.hidden=YES;
        _tableView3.hidden=NO;
        
        
        
        Dict4=[[NSMutableDictionary alloc]init];
        //        //[self.t7 reloadData];
        [self fetchData4];
    }
    
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
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
                [self.collectionView reloadData];
               //           [self fetchData2];
//                [self fetchData3];
////                [self fetchData4];
//
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/VisaApi/visatypelist?admin_id=1&Authorization=%@&start=0&limit=30",self.ss];
    
    
    
    
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

#pragma mark-fetchdata1

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
                [self.collectionView1 reloadData];
                              
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri1
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/VisaApi/visacategorylist?admin_id=1&Authorization=%@&start=0&limit=30",self.ss];
    
    
    
    
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



#pragma mark-fetchdata2

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
                [self.tableView reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/VisaApi/visasponsorlist?admin_id=1&Authorization=%@&start=0&limit=30",self.ss];
    
    
    
    
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
        
        
        
        Dict2= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict2);
        
        
        
        
        return YES;
        
    }
    return YES;
    
    
}


#pragma mark-fetchdata1

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
                [self.tableView1 reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri3
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/VisaApi/visaclientlist?admin_id=1&Authorization=%@&start=0&limit=30",self.ss];
    
    
    
    
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
        
        
        
        Dict3= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict3);
        
        
        
        
        return YES;
        
    }
    return YES;
    
    
}



#pragma mark-fetchdata4

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
                [self.tableView3 reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri4
{
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/VisaApi/visareportlist?admin_id=1&Authorization=%@&start=0&limit=30",self.ss];
    
    
    
    
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
        
        
        
        Dict4= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict4);
        
        
        
        
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



#pragma mark- coll delegate

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}


-(CGFloat)collectionView:(UICollectionView *)collectionView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    if (collectionView==_collectionView) {
        
        return [[Dict objectForKey:@"visa_list" ] count];
        
        
    }
    else
        if (collectionView==_collectionView1) {
            
            return [[Dict1 objectForKey:@"visa_list" ] count];
            
        }
    
    return  YES;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (collectionView==_collectionView) {
        
        
        
        v11= [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        
        //v11.z1.text=@"dsgfs";
        
        NSString *visatype1=[[[Dict objectForKey:@"visa_list"]valueForKey:@"visa_type_name"]objectAtIndex:indexPath.row];
        
        v11.z1.text =  visatype1;
        
        
        
        return  v11;
    }
    else
        if (collectionView==_collectionView1) {
            
            
            
            c1= [collectionView dequeueReusableCellWithReuseIdentifier:@"cela" forIndexPath:indexPath];
            
            //c1.z2.text=@"dsgfs";
            
            NSString *visacat1=[[[Dict1 objectForKey:@"visa_list"]valueForKey:@"visa_type_name"]objectAtIndex:indexPath.row];
            
            c1.labl.text =  visacat1;
            
            NSString *visacat2=[[[Dict1 objectForKey:@"visa_list"]valueForKey:@"visa_category"]objectAtIndex:indexPath.row];
            
            c1.labl2.text =  visacat2;
            
            
            return c1;
        }
    
    return  NO;
}




#pragma mark-tabldelegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (tableView==_tableView) {
        
        return 1;
    }
    else if (tableView==_tableView1)
    {
        return 1;    }
    else if (tableView==_tableView3)
    {
        return [[Dict4 objectForKey:@"visa_list"] count];
    }

    else
        return NO;
    
    
    //return [[Dict objectForKey:@"company_list"] count]; // in your case, there are 3 cells
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (tableView==_tableView) {
        
        return 1;
    }
    else if (tableView==_tableView1)
    {
        return 1;    }
    else if (tableView==_tableView3)
    {
        return 10;
    }
    
    else
        return NO;


    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    
    
    if (tableView==_tableView) {
        return [[Dict2 objectForKey:@"visa_list"] count];
    }

    
   else if (tableView==_tableView1) {
        return [[Dict3 objectForKey:@"visa_list"] count];
    }
    else if (tableView==_tableView3) {
        return 1;
 }
     return  YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


{
    
    
    
    if (tableView==self.tableView) {
        
        static NSString *CellIdentifier = @"cel19";  //statement for xib file
        
        spon=[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];  //stateme
        
        if ( spon==nil) {
            NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"sponosorlistTableViewCell" owner:self options:nil];
            spon=[toplevelobject objectAtIndex:0];
        }
        
        
        
        NSString *sname=[[[Dict2 objectForKey:@"visa_list"]valueForKey:@"visa_sponsor_name"]objectAtIndex:indexPath.row];
        //
        spon.sponrname.text =  sname;
        
        
        
        NSString *semail=[[[Dict2 objectForKey:@"visa_list"]valueForKey:@"visa_sponsor_email"]objectAtIndex:indexPath.row];
        //
        spon.sponemail.text =  semail;
        
        
        return  spon;
    }

    
    
    
    
    
    
    
    
 else   if (tableView==self.tableView1) {
        
        static NSString *CellIdentifier = @"cel13";  //statement for xib file
        
        ccell=[self.tableView1 dequeueReusableCellWithIdentifier:CellIdentifier];  //stateme
        
     
     
     
     
     if (ccell == nil) {
         ccell = [[clientcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
     }

     
     
     // ccell.textLabel.text=@"gj";
        
        NSString *clien1=[[[Dict3 objectForKey:@"visa_list"]valueForKey:@"visa_client_name"]objectAtIndex:indexPath.row];
        
        ccell.textLabel.text =  clien1;
        return ccell;
        
        
    }
    
    //    return  NO;
    
    else if (tableView==self.tableView3) {
        
        static NSString *CellIdentifier = @"cel12";  //statement for xib file
        
        r=[self.tableView3 dequeueReusableCellWithIdentifier:CellIdentifier];  //stateme
        
        if ( r==nil) {
            NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"Reportlist" owner:self options:nil];
            r=[toplevelobject objectAtIndex:0];
        }
        
        // r.textLabel.text=@"ff";
        
        /// r.reportname.text=@"gj";
        
        NSString *report1=[[[Dict4 objectForKey:@"visa_list"]valueForKey:@"visa_applicant_name"]objectAtIndex:indexPath.section];
        //
        r.reportname.text =  report1;
        
        
        NSString *report2=[[[Dict4 objectForKey:@"visa_list"]valueForKey:@"visa_ref_no"]objectAtIndex:indexPath.section];
        //
        r.refno.text =  report2;
        
        NSString *report3=[[[Dict4 objectForKey:@"visa_list"]valueForKey:@"visa_client_name"]objectAtIndex:indexPath.section];
        //
        r.client.text =  report3;
        
        
        NSString *report4=[[[Dict4 objectForKey:@"visa_list"]valueForKey:@"visa_category"]objectAtIndex:indexPath.section];
        //
        r.category.text =  report4;
        
        
        NSString *report5=[[[Dict4 objectForKey:@"visa_list"]valueForKey:@"visa_type_name"]objectAtIndex:indexPath.section];
        //
        r.type.text =  report5;
        
        NSString *report6=[[[Dict4 objectForKey:@"visa_list"]valueForKey:@"visa_entry_date"]objectAtIndex:indexPath.section];
        //
        r.entry.text =  report6;
        
        NSString *report7=[[[Dict4 objectForKey:@"visa_list"]valueForKey:@"visa_expiry_date"]objectAtIndex:indexPath.section];
        //
        r.expiry.text =  report7;
        
        
        
        
        
        
        
        r.img.layer.cornerRadius = r.img.frame.size.width / 2.0;
        r.img.clipsToBounds = YES;
        NSString *urlstring=[[[Dict4  objectForKey:@"visa_list"]valueForKey:@"visa_profile_picture"] objectAtIndex:indexPath.section];
        NSURL *imageUrl=[NSURL URLWithString:urlstring];
        [r.img sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"prof2"]];
        NSString *firstChar=[report1 substringToIndex:1];
        r.celllabl.text=firstChar;
        
        
        
        
        
        
        
        return  r;
        
        
    }
    else
    return NO;
    
}







-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
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
