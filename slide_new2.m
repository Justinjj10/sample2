//
//  slide_new2.m
//  sample2
//
//  Created by Mac on 30/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "slide_new2.h"
#import "SlideNavigationController.h"
#import "slide_new_cel2.h"
#import "new_visa_list.h"
#import "visa_payment.h"
#import "travel_list.h"
#import "visa_seting.h"


@interface slide_new2 ()
{
    slide_new_cel2 *cell;
    NSMutableDictionary *Dict;
}

@end

@implementation slide_new2

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Dict=[[NSMutableDictionary alloc]init];
    
    
    
    
    
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    Dict =   [UserDefaults objectForKey:@"CompanyDetails"];

    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //static NSString *cellIdentifier=@"cel";
    
    
    cell=  [_tabl dequeueReusableCellWithIdentifier:@"cel" forIndexPath:indexPath];
    //if (!cell1) {
    //    cell1 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    //}
    
    if (indexPath.row==0) {
        
        
        
        cell.labl1.text=@"Visa Details";
    }
    
  else  if (indexPath.row==1) {
        
        
        
        cell.labl1.text=@"Payment List";
    }

  else  if (indexPath.row==2) {
      
      
      
      cell.labl1.text=@"Travel Details";
  }
  else  if (indexPath.row==3) {
      
      
      
      cell.labl1.text=@"Setting";
  }

    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if (indexPath.row==0) {
        
        new_visa_list *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaList"];
        
        obj.ss=[Dict objectForKey:@"authentication_key"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
        
         }
    
    else  if (indexPath.row==1) {
        visa_payment *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaPayment"];
        
        obj.ss=[Dict objectForKey:@"authentication_key"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
        
    }
    
    else  if (indexPath.row==2) {
        travel_list *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"TravelList"];
        
        obj.ss=[Dict objectForKey:@"authentication_key"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];


        
        
    }
     else  if (indexPath.row==3) {
         
         visa_seting *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaSetting"];
         
         obj.ss=[Dict objectForKey:@"authentication_key"];
         [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                          andCompletion:nil];
         
     }
    

    

    
    
    
    
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

- (IBAction)back:(id)sender {
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
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
