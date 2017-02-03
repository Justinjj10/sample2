//
//  slide_new.m
//  sample2
//
//  Created by Mac on 27/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "slide_new.h"
#import "slide_new_cel11.h"

#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "company_list.h"

#import "comp_expiry.h"
#import "cmp_doc_status.h"







@interface slide_new ()
{
    slide_new_cel11 *cell;
       NSMutableDictionary *Dict;
}

@end

@implementation slide_new


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
        
        
        
        cell.labl1.text=@"Company List";
    }
    else if (indexPath.row==1)
    {
        cell.labl1.text=@"Document Expiry";
    }
    else if (indexPath.row==2)
    {
        cell.labl1.text=@"Document Status";
    }
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if (indexPath.row==0) {
        
        
        
        
        
        
        //
        company_list *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"company_list"];
        //        // obj.ss=[myArray objectAtIndex:0];
        obj.ss=[Dict objectForKey:@"authentication_key"];
        
        //
        //        //  [self.navigationController pushViewController:obj animated:YES];
        //
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
    }
    else if (indexPath.row==1)
    {
        comp_expiry *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"expiry"];
        
        obj.ss=[Dict objectForKey:@"authentication_key"];
        
        
        
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
        
    }
    
    else if (indexPath.row==2)
    {
        cmp_doc_status *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"CompDocStaus"];
        
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
@end
