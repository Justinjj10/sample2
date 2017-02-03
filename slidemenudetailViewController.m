//
//  slidemenudetailViewController.m
//  spon
//
//  Created by Manesh on 15/12/2016.
//  Copyright © 2016 Manesh. All rights reserved.
//

#import "slidemenudetailViewController.h"
#import "details.h"
#import "menuell.h"
#import "page1.h"
#import "UIImageView+WebCache.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "slide_new_cel.h"
#import "slide_new.h"
#import "slide_new1.h"
#import "slide_new2.h"
#import "slide_new3.h"
#import "my_prof.h"
#import "calender.h"

@interface slidemenudetailViewController ()<UITableViewDelegate,UITableViewDataSource>

{
  // menuell *d1;
    details *d1;
    
    page1 *page1obj;
    NSMutableDictionary *Dict,*Dict1;
    slide_new_cel *cell;
    slide_new *obj;
    NSArray *myArray;
}

@end

@implementation slidemenudetailViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   myArray = @[@1, @2, @3,@4];

    Dict=[[NSMutableDictionary alloc]init];
    
    
    
    
    
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    Dict =   [UserDefaults objectForKey:@"CompanyDetails"];
    
   // NSLog(@"%@",Dict);
    
    
    [self.navigationItem setHidesBackButton:YES];
    
    
    
    Dict1=[[NSMutableDictionary alloc]init];
    
    
//    NSUserDefaults *UserDefaults1 = [NSUserDefaults standardUserDefaults];
//    Dict1 =   [UserDefaults1 objectForKey:@"LoginData"];

   
        
    // Do any additional setup after loading the view.
}


//- (void)viewWillAppear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    [super viewWillAppear:animated];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // If You have only one(1) section, return 1, otherwise you must handle sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    cell = [_tabl dequeueReusableCellWithIdentifier:@"cel" forIndexPath:indexPath];
    
    
    if (indexPath.row==0) {
        cell.img.image=[UIImage imageNamed:@"home1"];
        
        cell.img1.hidden=YES;
        cell.labl.text=@"Home";
    }
    
    else  if (indexPath.row==1) {
        cell.img.image=[UIImage imageNamed:@"company1"];
        cell.labl.text=@"Company";
    }
    else  if (indexPath.row==2) {
        cell.img.image=[UIImage imageNamed:@"employee1"];
        cell.labl.text=@"Employee";
    }
    
    else  if (indexPath.row==3) {
        cell.img.image=[UIImage imageNamed:@"visa1"];
        cell.labl.text=@"Visa";
    }
    
    else  if (indexPath.row==4) {
        cell.img.image=[UIImage imageNamed:@"alarm1"];
        cell.labl.text=@"Notification";
        
    }
    else  if (indexPath.row==5) {
        cell.img.image=[UIImage imageNamed:@"calendar1"];
        
         cell.img1.hidden=YES;
        cell.labl.text=@"Calendar";

        
    }
    else  if (indexPath.row==6) {
        cell.img.image=[UIImage imageNamed:@"profile1"];
        
         cell.img1.hidden=YES;
        cell.labl.text=@"My Profile";
    }
    
    else  if (indexPath.row==7) {
        cell.img.image=[UIImage imageNamed:@"logout1"];
        
         cell.img1.hidden=YES;
        cell.labl.text=@"Log Out";
       
    }
   


    // Configure the cell...
    
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if (indexPath.row==0) {
        
        
        
        
        if (self.view.frame.size.height==480) {
            page1obj=[self.storyboard instantiateViewControllerWithIdentifier:@"Home3.5"];
        }
        
        else   if (self.view.frame.size.height==568) {
            page1obj=[self.storyboard instantiateViewControllerWithIdentifier:@"Home4"];
        }
        
        else   if (self.view.frame.size.height==667) {
            page1obj=[self.storyboard instantiateViewControllerWithIdentifier:@"Home4.7"];
        }
        else
        {
            page1obj=[self.storyboard instantiateViewControllerWithIdentifier:@"Home5"];
        }
        
        page1obj.ssurl=[Dict objectForKey:@"authentication_key"];
        //
        //    [self.navigationController pushViewController:objSignin animated:YES];
        
        
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:page1obj                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
        
        
        
        
    }
    
//
    
        
   
    else if (indexPath.row==1) {
        
        
        obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SlideNew"];
               // obj.ss=[myArray objectAtIndex:0];
        
        
                obj.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        //
                UINavigationController *navigationController =
                [[UINavigationController alloc] initWithRootViewController:obj];
        
        
            [self presentViewController:navigationController animated:YES completion:nil];
            //[self.navigationItem pushViewController:obj animated:YES];

        
        
        
            
            obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SlideNew"];
          obj.ss=[myArray objectAtIndex:1];
        [self.navigationController pushViewController:obj animated:YES];

        
            
        }
    
    else if (indexPath.row==2) {
        
        slide_new1 *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"SlideNew1"];
        // obj.ss=[myArray objectAtIndex:0];
        
        
        obj1.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        //
        UINavigationController *navigationController =
        [[UINavigationController alloc] initWithRootViewController:obj1];
        
        
        [self presentViewController:navigationController animated:YES completion:nil];
        //[self.navigationItem pushViewController:obj animated:YES];
        
        
        

        
        
    }
    
    else if (indexPath.row==3) {
        
        slide_new2 *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"SlideNew2"];
        // obj.ss=[myArray objectAtIndex:0];
        
        
        obj1.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        //
        UINavigationController *navigationController =
        [[UINavigationController alloc] initWithRootViewController:obj1];
        
        
        [self presentViewController:navigationController animated:YES completion:nil];
        //[self.navigationItem pushViewController:obj animated:YES];
        
        
        
    }
    
    else if (indexPath.row==4) {
        
        slide_new3 *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"SlideNew3"];
        // obj.ss=[myArray objectAtIndex:0];
        
        
        obj1.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        //
        UINavigationController *navigationController =
        [[UINavigationController alloc] initWithRootViewController:obj1];
        
        
        [self presentViewController:navigationController animated:YES completion:nil];
        //[self.navigationItem pushViewController:obj animated:YES];
        
        
    }

    else if (indexPath.row==5) {
        
        
       
        
       
        calender *obj2=[self.storyboard instantiateViewControllerWithIdentifier:@"calender"];
        
       obj2.ss=[Dict objectForKey:@"authentication_key"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj2
                                                                 withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
        
    }

    else if (indexPath.row==6) {
        
        
        my_prof *obj2=[self.storyboard instantiateViewControllerWithIdentifier:@"MyProf"];
        
        //obj.ss=[Dict objectForKey:@"authentication_key"];
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:obj2
                                                                 withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
 
        
        
    }
    else if (indexPath.row==7) {
        
        obj=[self.storyboard instantiateViewControllerWithIdentifier:@"SlideNew"];
        obj.ss=[myArray objectAtIndex:3];
        
        
    }


    
}










@end
