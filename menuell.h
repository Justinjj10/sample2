//
//  menuell.h
//  COCOONNEST
//
//  Created by Lithin on 7/15/16.
//  Copyright © 2016 Websight Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface menuell : UITableViewCell
{
       
                int flag;
                NSString *userEmail;
       
}
@property (strong, nonatomic) IBOutlet UIImageView *imguserIcon;

@property (strong, nonatomic) IBOutlet UIButton *btnContact;
@property (strong, nonatomic) IBOutlet UIButton *btnCrowdfunding;
@property (strong, nonatomic) IBOutlet UIButton *btnEquityFunding;
@property (strong, nonatomic) IBOutlet UIButton *btnCategories;
@property (strong, nonatomic) IBOutlet UIButton *btnPages;
@property (strong, nonatomic) IBOutlet UIButton *btnHowsItWork;
@property (strong, nonatomic) IBOutlet UIButton *btnLatestProjects;
@property (strong, nonatomic) IBOutlet UIButton *btnMostFunded;
@property (strong, nonatomic) IBOutlet UIButton *btnEndingSoon;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UIButton *btnSignup;
@property (strong, nonatomic) IBOutlet UIImageView *imgDash;
@property (strong, nonatomic) IBOutlet UIView *ShowingView;

@property (strong, nonatomic) IBOutlet UIButton *btnHome;
@property (strong, nonatomic) IBOutlet UIButton *btnNewsFeed;

@end
