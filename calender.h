//
//  calender.h
//  sample2
//
//  Created by Mac on 14/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface calender : UIViewController
{
    BOOL isfilter;
}


@property (strong, nonatomic) NSCalendar *calendar;
@property()NSString *ss;
- (IBAction)today:(id)sender;
- (IBAction)add:(id)sender;


@end
