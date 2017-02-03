//
//  comp_noti.h
//  sample2
//
//  Created by Mac on 7/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HTHorizontalSelectionList/HTHorizontalSelectionList.h>

@interface comp_noti : UIViewController<HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate>
@property (nonatomic, strong) HTHorizontalSelectionList *selectionList;
@property (nonatomic, strong) NSArray *carMakes;
@property (weak, nonatomic) IBOutlet UILabel *datelabl;




@property (weak, nonatomic) IBOutlet UITableView *comp_notitabl;

@property (nonatomic, strong) NSArray *shopping;

@property (weak, nonatomic) IBOutlet UILabel *disp_labl;












@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *date_labl1;
@property (weak, nonatomic) IBOutlet UILabel *date_labl2;
@property (weak, nonatomic) IBOutlet UILabel *date_labl3;
@property (weak, nonatomic) IBOutlet UILabel *date_labl4;

@property()NSString *ss;
@end
