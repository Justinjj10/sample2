//
//  emp_search.m
//  sample2
//
//  Created by Mac on 23/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "emp_search.h"
#import "emp_prof.h"
#import "emp_search_cel.h"

@interface emp_search ()
{
    emp_prof *ob;
    emp_search_cel *cell;
    
    NSMutableDictionary *Dict;
}

@property (nonatomic, strong) NSArray *searchResults;

@end

@implementation emp_search

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Dict=[[NSMutableDictionary alloc]init];
    
    
    Dict = [[NSMutableDictionary alloc]init];
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    Dict = [def objectForKey:@"EmployeeList"];
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
   cell = [_tabl dequeueReusableCellWithIdentifier:@"cel" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    ob=[self.storyboard instantiateViewControllerWithIdentifier:@"prof"];
    
    
    ob.ss=[[Dict  objectForKey:@"admin_details"]valueForKey:@"authentication_key"];
    ob.ss1=[[[Dict objectForKey:@"employee_list"] valueForKey:@"employee_id"]objectAtIndex:indexPath.row];
    
    ob.prof=[[[Dict objectForKey:@"employee_list"] valueForKey:@"profile_picture"]objectAtIndex:indexPath.row];
    
    
    
    [self presentViewController:ob animated:YES completion:nil];
    
;
    //from = [NSString stringWithFormat:@"%@", cell.from.text];
    
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    // extract array from observer
    self.searchResults = [(NSArray *)object valueForKey:@"results"];
    [self.tabl reloadData];
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
