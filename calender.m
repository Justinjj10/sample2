//
//  calender.m
//  sample2
//
//  Created by Mac on 14/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import "calender.h"

#import "RSDFDatePickerView.h"

#import "RSDFCustomDatePickerView.h"
#import "SlideNavigationController.h"
#import "slidemenudetailViewController.h"

#import "event.h"
#import "GlobalMethods.h"
#import "MBProgressHUD.h"




@interface calender() <RSDFDatePickerViewDelegate, RSDFDatePickerViewDataSource>{
    
    NSMutableDictionary *Dict;
    GlobalMethods *globalMethod;
    MBProgressHUD *hud;
    
    
}


@property (copy, nonatomic) NSMutableArray *datesToMark;
@property (copy, nonatomic) NSDictionary *statesOfTasks;
@property (copy, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) RSDFDatePickerView *datePickerView;
@property (strong, nonatomic) RSDFCustomDatePickerView *customDatePickerView;
@property (copy, nonatomic) UIColor *completedTasksColor;
@property (copy, nonatomic) UIColor *uncompletedTasksColor;
@property (copy, nonatomic) NSDate *today;







@end

@implementation calender




- (void)viewDidLoad {
    [super viewDidLoad];
    
       
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
   self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:17.0f]};
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];
    
    NSDateComponents *todayComponents = [self.calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [self.calendar dateFromComponents:todayComponents];
    [self.datePickerView selectDate:today];
    
  self.customDatePickerView.hidden = YES;
    
    [self.view addSubview:self.customDatePickerView];
    [self.view addSubview:self.datePickerView];

    
    [self fetchData];
            // Do any additional setup after loading the view.

   }




// Returns the mark image for the specified date.

#pragma mark - Custom Accessors

- (void)setCalendar:(NSCalendar *)calendar
{
    if (![_calendar isEqual:calendar]) {
        _calendar = calendar;
        
        self.title = [_calendar.calendarIdentifier capitalizedString];
    }
}

//- (NSMutableArray *)datesToMark
//{
//    if (!_datesToMark) {
//        NSArray *numberOfDaysFromToday = @[@(-8), @(-2), @(-1), @(0), @(2), @(4), @(8), @(13), @(22)];
//        
//        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
//        NSMutableArray *datesToMark = [[NSMutableArray alloc] initWithCapacity:[numberOfDaysFromToday count]];
//        [numberOfDaysFromToday enumerateObjectsUsingBlock:^(NSNumber *numberOfDays, NSUInteger idx, BOOL *stop) {
//            dateComponents.day = [numberOfDays integerValue];
//            NSDate *date = [self.calendar dateByAddingComponents:dateComponents toDate:self.today options:0];
//            [datesToMark addObject:date];
//        }];
//        
//        _datesToMark = [datesToMark copy];
//    }
//    return _datesToMark;
//}

//- (NSDictionary *)statesOfTasks
//{
//    if (!_statesOfTasks) {
//        NSMutableDictionary *statesOfTasks = [[NSMutableDictionary alloc] initWithCapacity:[self.datesToMark count]];
//        [self.datesToMark enumerateObjectsUsingBlock:^(NSDate *date, NSUInteger idx, BOOL *stop) {
//            BOOL isCompletedAllTasks = NO;
//            if ([date compare:self.today] == NSOrderedAscending) {
//                isCompletedAllTasks = YES;
//            }
//            statesOfTasks[date] = @(isCompletedAllTasks);
//        }];
//        
//        _statesOfTasks = [statesOfTasks copy];
//    }
//    return _statesOfTasks;
//}
//
- (NSDate *)today
{
    if (!_today) {
        NSDateComponents *todayComponents = [self.calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
        _today = [self.calendar dateFromComponents:todayComponents];
    }
    return _today;
}

- (UIColor *)completedTasksColor
{
    if (!_completedTasksColor) {
        _completedTasksColor = [UIColor colorWithRed:83/255.0f green:215/255.0f blue:105/255.0f alpha:1.0f];
    }
    return _completedTasksColor;
}

- (UIColor *)uncompletedTasksColor
{
    if (!_uncompletedTasksColor) {
        _uncompletedTasksColor = [UIColor colorWithRed:184/255.0f green:184/255.0f blue:184/255.0f alpha:1.0f];
    }
    return _uncompletedTasksColor;
}

- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setCalendar:self.calendar];
        [_dateFormatter setLocale:[self.calendar locale]];
        [_dateFormatter setDateStyle:NSDateFormatterFullStyle];
    }
    return _dateFormatter;
}

- (RSDFDatePickerView *)datePickerView
{
    if (!_datePickerView) {
        _datePickerView = [[RSDFDatePickerView alloc] initWithFrame:self.view.bounds calendar:self.calendar];
        _datePickerView.delegate = self;
        _datePickerView.dataSource = self;
        _datePickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _datePickerView;
}

- (RSDFCustomDatePickerView *)customDatePickerView
{
    if (!_customDatePickerView) {
        _customDatePickerView = [[RSDFCustomDatePickerView alloc] initWithFrame:self.view.bounds calendar:self.calendar];
        _customDatePickerView.delegate = self;
        _customDatePickerView.dataSource = self;
        _customDatePickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _customDatePickerView.pagingEnabled = YES;
    }
    return _customDatePickerView;
}
//
#pragma mark - Action handling



- (void)onRestyleButtonTouch:(UIBarButtonItem *)sender
{
    if (!self.datePickerView.hidden) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:244/255.0f green:245/255.0f blue:247/255.0f alpha:1.0f];
        self.datePickerView.hidden = YES;
      self.customDatePickerView.hidden = NO;
    } else {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1.0f];
        self.customDatePickerView.hidden = YES;
        self.datePickerView.hidden = NO;
    }
}

#pragma mark - RSDFDatePickerViewDelegate

- (void)datePickerView:(RSDFDatePickerView *)view didSelectDate:(NSDate *)date
{
//    [[[UIAlertView alloc] initWithTitle:@"Picked Date" message:[self.dateFormatter stringFromDate:date] delegate:nil cancelButtonTitle:@":D" otherButtonTitles:nil] show];
}

#pragma mark - RSDFDatePickerViewDataSource

- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldHighlightDate:(NSDate *)date
{
    if (view == self.datePickerView) {
        return YES;
    }
    
    if ([self.today compare:date] == NSOrderedDescending) {
        return NO;
    }
    
    return YES;
}

- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldSelectDate:(NSDate *)date
{
    if (view == self.datePickerView) {
        return YES;
    }
    
    if ([self.today compare:date] == NSOrderedDescending) {
        return NO;
    }
    
    return YES;
}

- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldMarkDate:(NSDate *)date
{
    
    return _datesToMark;
    
  //  return [self.datesToMark containsObject:date];
}

- (UIColor *)datePickerView:(RSDFDatePickerView *)view markImageColorForDate:(NSDate *)date
{
    
    if (!_datesToMark) {
        return self.uncompletedTasksColor;

    }else {
        return self.completedTasksColor;
    }
    
    
//    
//    if (![self.statesOfTasks[date] boolValue]) {
//        return self.uncompletedTasksColor;
//    } else {
//        return self.completedTasksColor;
//    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





-(void)fetchData
{
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^ {
        [self showHud];
        BOOL userexits;
        
        userexits=  [self urlList_Requesttri2  ];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if(!userexits){
                [self hideHud];
                if([globalMethod connected      ]){
                    NSLog(@"coneccttedddd");
                    
                    
                    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Network Problem" message:@"You are connected to slow internet or no network found." preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alert addAction:okAction];
                    
                    
                    [self presentViewController: alert animated:YES completion:nil];
                    
                    
                }
                else{
                    NSLog(@"nooooo");
                    
                    
                    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Please Try Again" message:@"The Internet connection appears to be offline." preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alert addAction:okAction];
                    
                    
                    [self presentViewController: alert animated:YES completion:nil];
                    
                    
                }
                
                
            }
            
            
            else
            {
//                NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
//                [UserDefaults setObject:Dict forKey:@"CompanyList"];
//                [UserDefaults synchronize];
//                
//                
                
                
              //  [self.comptabl reloadData];
                
                [self hideHud];
                
                [self disp];
                
                
                
            }
            
            
            
            
            
            
            
            
            
        });
    });
    
}



-(void)disp
{
    _datesToMark=[[[Dict objectForKey:@"event_list"]objectAtIndex:0]objectForKey:@"date"];
}



-(BOOL)urlList_Requesttri2
{
    
    
    
    
    //  NSString*devicetoken=@"fbkdjbgkjfjfhln";
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://app.sponsormasterqatar.com/index.php/LoginApi/eventlist?admin_id=1&Authorization=%@&start=0&limit=10",self.ss];
    
    
    
    
    
    
    
    
    
    
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = [NSURL URLWithString:urlString];
    
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-type"];
    
    NSHTTPURLResponse *response = nil;
    NSError *error ;
    NSData *returnData =[NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    //    NSString* newStr = [NSString stringWithUTF8String:[returnData bytes]];
    //    NSLog(@"return data %@",newStr);
    
    
    
    if (returnData == nil) {
        
        
        return NO;
    }
    
    else if([returnData length] >0 && error == nil) {
        
        
        
        Dict= [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
        NSLog(@"%@",Dict);
        
       // _results=[[Dict  objectForKey:@"company_list"]valueForKey:@"company_name"];
        
        
        return YES;
        
    }
    return YES;
    
    
}



-(void)showHud{
    hud =  [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    hud.frame = CGRectMake(0, 0, 120, 143);
    
    //     hud.mode = MBProgressHUDModeDeterminate;
    hud.detailsLabelText = @"Loading...";
    hud.detailsLabelFont=[UIFont systemFontOfSize:16];
    
    [self.view addSubview:hud];
    hud.dimBackground = YES;
    [hud show:YES];
}
-(void)hideHud{
    [hud hide:YES];
}










- (IBAction)today:(id)sender {
    
    
    if (!self.datePickerView.hidden) {
        [self.datePickerView scrollToToday:YES];
    } else {
        [self.customDatePickerView scrollToToday:YES];
    }

    
    
}

- (IBAction)add:(id)sender {
    
    event *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"Event"];
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:ob];
    

     [self presentViewController:navigationController animated:YES completion:nil];
}








- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}
- (IBAction)bounceMenu:(id)sender
{
    static Menu menu = MenuLeft;
    
    [[SlideNavigationController sharedInstance] bounceMenu:menu withCompletion:nil];
    
    menu = (menu == MenuLeft) ? MenuRight : MenuLeft;
}

- (IBAction)slideOutAnimationSwitchChanged:(UISwitch *)sender
{
    ((slidemenudetailViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled = sender.isOn;
}

- (IBAction)limitPanGestureSwitchChanged:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].panGestureSideOffset = (sender.isOn) ? 50 : 0;
}

- (IBAction)changeAnimationSelected:(id)sender
{
    [[SlideNavigationController sharedInstance] openMenu:MenuRight withCompletion:nil];
}

- (IBAction)shadowSwitchSelected:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].enableShadow = sender.isOn;
}

- (IBAction)enablePanGestureSelected:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].enableSwipeGesture = sender.isOn;
}







@end
