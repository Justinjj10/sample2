//
//  slide_new.h
//  sample2
//
//  Created by Mac on 27/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface slide_new : UIViewController
@property(nonatomic,strong)IBOutlet UITableView *tabl;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
- (IBAction)back:(id)sender;
@property()NSString *ss;
@end
