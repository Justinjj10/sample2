//
//  menuell.m
//  COCOONNEST
//
//  Created by Lithin on 7/15/16.
//  Copyright © 2016 Websight Technologies. All rights reserved.
//

#import "menuell.h"

@implementation menuell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+(id)viewFromNib {
    
    
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    
    
    
}



- (IBAction)Show:(id)sender {
        
        if(flag==1)
        {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                
                
               self. ShowingView.frame=CGRectMake(0, self. ShowingView.frame.origin.y-91, self. ShowingView.frame.size.width      , self. ShowingView.frame.size.height);
                
                [UIView commitAnimations];
                flag=0;
                
        }
        
        else
        {
                
                
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                
                
              self.  ShowingView.frame=CGRectMake(0,self. ShowingView.frame.origin.y+91,self. ShowingView.frame.size.width      ,self. ShowingView.frame.size.height);
                
                [UIView commitAnimations];
                flag=1;
                
        }
        
        
        
        
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
