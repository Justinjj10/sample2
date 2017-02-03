//
//  Progress.h
//  sample2
//
//  Created by Mac on 15/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Progress : UIViewController
@property (strong, nonatomic) IBOutlet UIProgressView *prog;
@property (weak, nonatomic) IBOutlet UIView *vv;


@property (weak, nonatomic) IBOutlet UILabel *labl;
@property (nonatomic, strong) NSTimer *myTimer;

@end
