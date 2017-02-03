//
//  ViewController.h
//  sample2
//
//  Created by Mac on 8/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pagecontrol.h"

@interface ViewController : UIViewController<UIPageViewControllerDataSource>



@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;





@property(nonatomic,strong)IBOutlet UIImageView *imgview;
@property(nonatomic,strong)IBOutlet UIImageView *imgview2;
@property(nonatomic,strong)IBOutlet UIView *view2;


@end

