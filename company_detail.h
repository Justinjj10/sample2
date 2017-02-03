//
//  company_detail.h
//  sample2
//
//  Created by Mac on 27/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <HTHorizontalSelectionList/HTHorizontalSelectionList.h>


@interface company_detail : UIViewController<HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate>
@property (nonatomic, strong) HTHorizontalSelectionList *selectionList;
@property (nonatomic, strong) NSArray *shopping;

@property(nonatomic,strong)IBOutlet UITableView *tab1;
@property(nonatomic,strong)IBOutlet UITableView *tab2;
@property(nonatomic,strong)IBOutlet UITableView *tab3;


@property()NSString *ss,*ss1;
@property (weak, nonatomic) IBOutlet UILabel *name_labl;
@property (weak, nonatomic) IBOutlet UIImageView *imag;

@end



