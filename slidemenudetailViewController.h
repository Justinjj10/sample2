//
//  slidemenudetailViewController.h
//  spon
//
//  Created by Manesh on 15/12/2016.
//  Copyright © 2016 Manesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface slidemenudetailViewController : UIViewController

@property (weak,nonatomic)IBOutlet UITableView *tabl;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@end
