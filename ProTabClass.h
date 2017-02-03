//
//  ProTabClass.h
//  spon
//
//  Created by Mac on 22/12/16.
//  Copyright © 2016 Manesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface ProTabClass : UIViewController<MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *ProTab;
@property(weak,nonatomic)IBOutlet NSString *strpro;

@end
