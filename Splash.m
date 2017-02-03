//
//  Splash.m
//  sample2
//
//  Created by lithin james on 10/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "Splash.h"
#import "page1.h"
#import "LoginViewController.h"
@interface Splash ()
{
    page1 *objSignin;
    UIView *viewMain;
    LoginViewController *obj;
    
    UIImageView *spimage,*spimage1;
}
@end

@implementation Splash

- (void)viewDidLoad {
  
    [super viewDidLoad];
    
    [self performSelector:@selector(navigate) withObject:nil afterDelay:1];
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//- (BOOL)prefersStatusBarHidden
//{
//
//    [self.navigationItem setHidesBackButton:YES animated:NO];
//
//    return UIStatusBarStyleLightContent;
//
//}
-(void)navigate
{
    
    
    
    
    [UIView animateWithDuration:3.0f animations:^{
        //Move the image view to 100, 100 over 10 seconds.
        self.splash_imag.frame = CGRectMake(124, 160, _splash_imag.frame.size.width, _splash_imag.frame.size.height);
    }];
    
    [self performSelector:@selector(navNew) withObject:nil afterDelay:4];
}
-(void)navNew
{
    LoginViewController *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    //
    [[self navigationController] pushViewController:ob animated:YES];
    
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
