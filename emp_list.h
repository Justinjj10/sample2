//
//  emp_list.h
//  sample2
//
//  Created by Mac on 21/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface emp_list : UIViewController
{
    BOOL  isFiltered;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property(nonatomic,strong)NSString *ss;
@property (weak, nonatomic) IBOutlet UITableView *emptabl;

@end
