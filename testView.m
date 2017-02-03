//
//  testView.m
//  sample2
//
//  Created by Mac on 15/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "testView.h"


@implementation testView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//self.backgroundColor = [UIColor blackColor];
        
        NSString* imageName;
       // int aRandomNumber = arc4random() % 10;
        imageName =[NSString stringWithFormat:@"blue.jpg"];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:imageName]]];
      ///  NSLog(@"aRandomNumber is %d", aRandomNumber);
       _lab=[[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width / 1.99) - 71/2.0 , (self.frame.size.height / 1.13) - 45/2.0, 100, 30)];
        [self addSubview:_lab];
        
        _imgg=[[UIImageView alloc]initWithFrame:CGRectMake((self.frame.size.width / 1.82) - 71/2.0 , (self.frame.size.height / 3.3) - 45/2.0, 40, 40)];

        
//        _imgg=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.2 , self.frame.size.height-180, 40, 40)];
        [self addSubview:_imgg];
        
        _lab.textColor=[UIColor whiteColor];
 [[self lab] setFont:[UIFont systemFontOfSize:13]];
        
               
        // Determine our start and stop angles for the arc (in radians)
        startAngle = M_PI * 1.5;
        endAngle = startAngle + (M_PI * 2);
        
    }
    return self;
}



- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


- (void)drawRect:(CGRect)rect
{
    
 
    // Display our percentage as a string
    NSString* textContent = [NSString stringWithFormat: @"%d", self.percent];
//    NSString *per=@"%";
  //  NSString *imgcontent=[NSString stringWithFormat:@"%@",_imgg];
    
    UIBezierPath* bezierPath1 = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [bezierPath1 addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height-125)
                          radius:60
                      startAngle:0
                        endAngle:2*M_PI
                       clockwise:YES];
    
    CGFloat dashes1[] = { bezierPath1.lineWidth, bezierPath1.lineWidth * 3.5 };
    [bezierPath1 setLineDash:dashes1 count:2 phase:0];

       bezierPath1.lineWidth =10;
    [[UIColor whiteColor]setStroke] ;
[bezierPath1 stroke];

    
    
    
    //textContent=[textContent stringByAppendingString:per];
    
  //textContent = [textContent stringByAppendingString:@"rr"];
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height-125)
                          radius:60
                      startAngle:startAngle
                        endAngle:(endAngle - startAngle) * (_percent / 500.0) + startAngle
                       clockwise:YES];
    
    CGFloat dashes[] = { bezierPath.lineWidth, bezierPath.lineWidth * 4};
    [bezierPath setLineDash:dashes count:1 phase:0];
    
    
    // Set the display for the path, and stroke it
    bezierPath.lineWidth =12;

    [[UIColor greenColor] setStroke];
    [bezierPath stroke];
    
    // Text Drawing
    CGRect textRect = CGRectMake((rect.size.width / 2.0) - 71/2.0, (rect.size.height / 1.8) - 45/2.0, 71, 38);
    
    
    
    
  // UIImage *image = [UIImage imageNamed:@"bg.jpg"];
   // CGRect imageRect = CGRectMake((rect.size.width / 2.0) - 71/2.0, (rect.size.height / 1.8) - 45/2.0, 40, 40);
    
    
    
    
    
    
    //[[UIColor whiteColor] setFill];
    
    
   // UIFont *font = [UIFont fontWithName:@"Courier" size:kCellFontSize];
    
    
    
    //CGRect textRect = CGRectMake(x, y, length-x, maxFontSize);
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:30];
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    paragraphStyle.alignment =NSTextAlignmentCenter;
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle,
                                  NSForegroundColorAttributeName: [UIColor whiteColor]};
    [textContent drawInRect:textRect withAttributes:attributes];
    
   // [_imgg drawInRect:imageRect];
    
//    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 42.5] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter];
    
//    CGRect textPer =CGRectMake((rect.size.width / 2.0) - 95/8.0, (rect.size.height / 2.0) - 45/2.20, 71, 35);
//    
//    UIFont *font1= [UIFont fontWithName:@"Helvetica" size:32.5];
//    NSMutableParagraphStyle *paragraphStyle1 = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    paragraphStyle1.lineBreakMode = NSLineBreakByWordWrapping;
//    
//    
//    paragraphStyle1.alignment =NSTextAlignmentRight;
//    NSDictionary *attributes1 = @{ NSFontAttributeName: font1,
//                                  NSParagraphStyleAttributeName: paragraphStyle1,
//                                  NSForegroundColorAttributeName: [UIColor whiteColor]};
//    [per drawInRect:textPer withAttributes:attributes1];
    

    
//
//    [per drawInRect: textPer withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 38.5] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
