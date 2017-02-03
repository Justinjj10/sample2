//
//  my_prof.h
//  sample2
//
//  Created by Mac on 19/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface my_prof : UIViewController<MFMailComposeViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UITableView *ProTab;
@property(weak,nonatomic) NSString *strpro;
@property (weak, nonatomic) IBOutlet UIImageView *backimg;


@end
