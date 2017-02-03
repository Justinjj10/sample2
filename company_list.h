//
//  company_list.h
//  sample2
//
//  Created by Mac on 19/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface company_list : UIViewController
{
    BOOL  isFiltered;
}
@property (weak, nonatomic) IBOutlet UITableView *comptabl;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;



@property (weak, nonatomic) IBOutlet UITableView *tabl;
@property(nonatomic,strong)NSString *ss;




@end
