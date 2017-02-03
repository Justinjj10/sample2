//
//  slide_new3.m
//  sample2
//
//  Created by Mac on 30/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "slide_new3.h"
#import "SlideNavigationController.h"
#import "slide_new_cel3.h"
#import "comp_noti.h"
#import "emp_noti.h"
#import "visa_noti.h"

@interface slide_new3 ()
{
    slide_new_cel3 *cell;
    
    NSMutableDictionary *Dict;

}

@end

@implementation slide_new3

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
    
}

- (void)viewDidLoad {
    
      Dict=[[NSMutableDictionary alloc]init];
    
    
    
    
    
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    Dict =   [UserDefaults objectForKey:@"CompanyDetails"];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //static NSString *cellIdentifier=@"cel";
    
    
    cell=  [_tabl dequeueReusableCellWithIdentifier:@"cel" forIndexPath:indexPath];
    //if (!cell1) {
    //    cell1 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    //}
    
    if (indexPath.row==0) {
        
        
        
        cell.labl1.text=@"Company";
    }
    
    else  if (indexPath.row==1) {
        
        
        
        cell.labl1.text=@"Employee";
    }
    
    else  if (indexPath.row==2) {
        
        
        
        cell.labl1.text=@"Visa";
    }
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if (indexPath.row==0) {
        
        comp_noti *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"CompNoti"];
        
        obj.ss=[Dict objectForKey:@"authentication_key"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];

    }
    
    else  if (indexPath.row==1) {
        emp_noti *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"EmpNoti"];
        
        obj.ss=[Dict objectForKey:@"authentication_key"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
    }
    
    else  if (indexPath.row==2) {
        visa_noti *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"VisaNoti"];
        
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
