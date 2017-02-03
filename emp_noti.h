//
//  emp_noti.h
//  sample2
//
//  Created by Mac on 9/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HTHorizontalSelectionList/HTHorizontalSelectionList.h>

@interface emp_noti : UIViewController<HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate>
@property (nonatomic, strong) HTHorizontalSelectionList *selectionList;
@property (nonatomic, strong) NSArray *shopping;
@property (weak, nonatomic) IBOutlet UILabel *datelabl;
@property (weak, nonatomic) IBOutlet UITableView *emp_noti_tabl;
@property (weak, nonatomic) IBOutlet UILabel *disp_labl;
@property()NSString *ss;
@end
