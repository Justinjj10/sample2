//
//  page1.h
//  sample2
//
//  Created by Mac on 10/12/16.
//  Copyright © 2016 Machk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface page1 : UIViewController
@property(nonatomic,strong)IBOutlet UICollectionView *page1tabl;
@property(nonatomic,strong)IBOutlet UIButton    *btn1;
@property(nonatomic,strong)IBOutlet UIButton *btn2;
@property(nonatomic,strong)IBOutlet UIButton    *btn3;
@property(nonatomic,strong)IBOutlet UIButton *btn4;
@property(nonatomic,strong)IBOutlet UIImageView *HomeImg;
@property(nonatomic,strong)IBOutlet UIView *homeView;


@property(nonatomic,strong) IBOutlet UILabel *clabel1;
@property(nonatomic,strong) IBOutlet UILabel *clabel2;
@property(nonatomic,strong) IBOutlet UILabel *elabel1;
@property(nonatomic,strong) IBOutlet UILabel *elabel2;
@property(nonatomic,strong) IBOutlet UILabel *vlabel1;
@property(nonatomic,strong) IBOutlet UILabel *vlabel2;
@property(nonatomic,strong) IBOutlet UILabel *olabel1;
@property(nonatomic,strong) IBOutlet UILabel *olabel2;


@property()    int flag1;



@property(nonatomic,strong)NSString *ssurl;


@end
