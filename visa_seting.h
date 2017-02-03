//
//  visa_seting.h
//  sample2
//
//  Created by Mac on 27/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HTHorizontalSelectionList/HTHorizontalSelectionList.h>

@interface visa_seting : UIViewController<HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate>

@property (nonatomic, strong)IBOutlet UICollectionView        *collectionView;
@property (nonatomic, strong)IBOutlet UICollectionView        *collectionView1;

@property (nonatomic, strong)IBOutlet UITableView       * tableView;
@property (nonatomic, strong)IBOutlet UITableView       * tableView1;
@property (nonatomic, strong)IBOutlet UITableView       * tableView3;

@property (nonatomic, strong) HTHorizontalSelectionList *selectionList;
@property (nonatomic, strong) NSArray *shopping;

@property()NSString *ss;

@end
