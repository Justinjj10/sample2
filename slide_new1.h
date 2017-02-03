//
//  slide_new1.h
//  sample2
//
//  Created by Mac on 30/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface slide_new1 : UIViewController

@property(nonatomic,strong)IBOutlet UITableView *tabl;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
- (IBAction)back:(id)sender;


@end
