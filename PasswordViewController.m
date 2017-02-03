//
//  PasswordViewController.m
//  sample2
//
//  Created by lithin james on 11/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "PasswordViewController.h"
#import "page1.h"
@interface PasswordViewController ()

{
    NSMutableDictionary *Dict;
    page1 *objSignin;

}
@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
Dict=[[NSMutableDictionary alloc]init];
    
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    Dict =   [UserDefaults objectForKey:@"LoginData"];
    
    NSLog(@"%@",Dict);
    

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)nLogi:(id)sender
{
    if (self.txtPassword.text.length==0) {
        
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
        
        
    }
    else
    {
    
        if ([self.txtPassword.text isEqualToString:[Dict objectForKey:@"password"]]) {
            
            
            
            
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
            
            
            
            
            [self.navigationController pushViewController:objSignin animated:YES];
            

        }
    else
    {
        
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Password is incorrect" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        
        [self presentViewController: alert animated:YES completion:nil];
    }
    }
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
