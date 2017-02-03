//
//  Movies.m
//  new_oberon_Mall
//
//  Created by appzoc on 04/10/16.
//  Copyright © 2016 appzoc. All rights reserved.
//

#import "Movies.h"
#import "XMLReader.h"
#import "Moviecell.h"
#import "Moviedetails.h"
#import "Leftmenu.h"
#import "SlideNavigationController.h"
@interface Movies ()<UICollectionViewDelegate,UICollectionViewDataSource,SlideNavigationControllerDelegate>
{
    NSDictionary *dict;
    NSMutableArray *arr;
    NSData *imgdata;
}

@end

@implementation Movies

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url=[NSURL URLWithString:@"http://oberon.eazyhost.in/api/movies/list"];
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *ses=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task=[ses dataTaskWithURL:url completionHandler:^(NSData *dat,NSURLResponse *res,NSError *err){
        if(err==nil){
            dict=[XMLReader dictionaryForXMLData:dat error:nil];
            arr=[dict retrieveForPath:@"xml.item"];
            
            NSLog(@"%@",arr);
            [self.moviecollview reloadData];
           // _disp=arr;
            
            
        }
        
    }];
    
    
    [task resume];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ss=[[arr  objectAtIndex:indexPath.row]valueForKey:@"id"];
    Moviedetails *ob=[self.storyboard instantiateViewControllerWithIdentifier:@"movieid"];
    ob.str=ss;
    [self.navigationController pushViewController:ob animated:YES];
    
}


//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return arr.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Moviecell *cell=[_moviecollview dequeueReusableCellWithReuseIdentifier:@"moviecel" forIndexPath:indexPath];
    
    cell.movielabl.text =[[arr objectAtIndex:indexPath.row]valueForKey:@"cinemax_movie"];
    NSString *imgpart=[[arr objectAtIndex:indexPath.row]valueForKey:@"cinemax_thumbnail"];
    NSString *imgurl=[NSString stringWithFormat:@"%@%@",@"http://oberon.eazyhost.in/",imgpart];
    NSURL *urlimg=[NSURL URLWithString:imgurl];
    imgdata=[NSData dataWithContentsOfURL:urlimg];
    cell.movieimg.image=[UIImage imageWithData:imgdata];
    
    return cell;
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
    ((Leftmenu *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled = sender.isOn;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
