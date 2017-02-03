//
//  calender1.m
//  sample2
//
//  Created by Mac on 23/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "calender1.h"
#import "cmp_profile.h"
#import "calender1_cel.h"

@interface calender1 ()
{
    cmp_profile *ob;


    
    NSMutableDictionary *Dict;
}

@property (nonatomic, strong) NSArray *searchResults;

@end

@implementation calender1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Dict=[[NSMutableDictionary alloc]init];
    
    
    Dict = [[NSMutableDictionary alloc]init];
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    Dict = [def objectForKey:@"CompanyList"];
    NSLog(@"%@",Dict);

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    calender1_cel *cell = [_tabl dequeueReusableCellWithIdentifier:@"cel" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
   ob=[storyboard instantiateViewControllerWithIdentifier:@"prof"];
    
    
//       ob.ss=[[Dict  objectForKey:@"admin_details"]valueForKey:@"authentication_key"];
//  ob.ss1=[[[Dict objectForKey:@"company_list"] valueForKey:@"company_id"]objectAtIndex:indexPath.row];
//   ob.prof=[[[Dict objectForKey:@"company_list"] valueForKey:@"company_logo"]objectAtIndex:indexPath.row];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"Image_Notification" object:nil];


  [self presentViewController:ob animated:YES completion:nil];
    
    //from = [NSString stringWithFormat:@"%@", cell.from.text];


}




//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"SearchResults"]) {
//        NSIndexPath *indexPath = [self.tabl indexPathForSelectedRow];
//         ob = segue.destinationViewController;
//        ob.ss = [[Dict  objectForKey:@"admin_details"]valueForKey:@"authentication_key"];
//        ob.ss1=[[[Dict objectForKey:@"company_list"] valueForKey:@"company_id"]objectAtIndex:indexPath.row];
//
//    }
//}



//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    
//    if ([[segue identifier] isEqualToString:@"SearchResults"]) {
//        
//ob    = [segue destinationViewController];
//        
//        
//        ob.ss=_from;
//       // [ob ss:[self from]];
//    }
//    
//}


//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
//    
//    // extract array from observer
//    self.searchResults = [(NSArray *)object valueForKey:@"results"];
//    [self.tabl reloadData];
//}
//
//
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
