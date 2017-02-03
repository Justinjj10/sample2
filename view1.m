//
//  view1.m
//  sample2
//
//  Created by Mac on 17/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "view1.h"
#import "prof_cel.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"
#import <MXSegmentedPager/MXSegmentedPager.h>

@interface view1 () < UITableViewDelegate, UITableViewDataSource>
{
    prof_cel *cell1;
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    MBProgressHUD *hud;

}


@property (nonatomic, strong) UITableView *table1;
@property (nonatomic, strong) UITableView *table2;
@end

@implementation view1

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.table1.frame = (CGRect){
        .origin         = CGPointZero,
        .size.width     = self.frame.size.width,
        .size.height    = self.frame.size.height
    };
    
//    self.table2.frame = (CGRect){
//        .origin.x   = self.frame.size.width / 2,
//        .origin.y   = 0.f,
//        .size       = self.table1.frame.size
//    };
}

- (UITableView *)table1 {
    if (!_table1) {
        _table1 = [[UITableView alloc] init];
        _table1.delegate    = self;
        _table1.dataSource  = self;
        [self addSubview:_table1];
    }
    return _table1;
}

- (UITableView *)table2 {
    if (!_table2) {
        _table2 = [[UITableView alloc] init];
        _table2.delegate    = self;
        _table2.dataSource  = self;
        [self addSubview:_table2];
    }
    return _table2;
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
                    
                    
                 //   [self : alert animated:YES completion:nil];
                    
                    
                }
                else{
                    NSLog(@"nooooo");
                    
                    
                    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Please Try Again" message:@"The Internet connection appears to be offline." preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alert addAction:okAction];
                    
                    
                   // [self presentViewController: alert animated:YES completion:nil];
                    
                    
                }
                
                
            }
            
            
            else
            {
                [self.table1 reloadData];
                //                 [self.tableView1 reloadData];
                //                [self.tableView2 reloadData];
                
                [self hideHud];
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}




-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/CompanyApi/companydetails?admin_id=1&Authorization=%@&company_id=%@",self.ss,self.ss1];
    
    
    
    
    
    
    
    
    
    
    
    
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
   // hud =  [MBProgressHUD showHUDAddedTo:self];
    
    hud.frame = CGRectMake(0, 0, 120, 143);
    
    //     hud.mode = MBProgressHUDModeDeterminate;
    hud.detailsLabelText = @"Loading...";
    hud.detailsLabelFont=[UIFont systemFontOfSize:16];
    
  //  [self.view addSubview:hud];
    hud.dimBackground = YES;
    [hud show:YES];
}
-(void)hideHud{
    [hud hide:YES];
}








#pragma -mark <UITableViewDataSource>

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    static NSString *CellIdentifier = @"cel";
    
//
    
    
    cell1=[self.table1 dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell1==nil) {
        
        NSArray*toplevelobject=[[NSBundle mainBundle] loadNibNamed:@"prof_cel" owner:self options:nil];

    
  cell1=[toplevelobject objectAtIndex:0];
}

////NSString *s1=[[Dict objectForKey:@"company_details"]valueForKey:@"company_about"];
//////
//cell1.tit_labl.text=@"About";
//cell1.sub_labl.text=s1;
///cell1.textLabel.text=@"a";


return cell1;
}

#pragma mark <MXPageProtocol>

//- (BOOL)segmentedPager:(MXSegmentedPager *)segmentedPager shouldScrollWithView:(UIView *)view {
//    if (view == self.table2) {
//        return NO;
//    }
//    return YES;
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
