//
//  emp_doc_exp_view.m
//  sample2
//
//  Created by Mac on 3/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "emp_doc_exp_view.h"
#import "c_expiry_collcellCollectionViewCell.h"

@implementation emp_doc_exp_view
{
    NSMutableArray *lithin;
    NSString *cou;
    NSArray *imgar;

}


- (void)awakeFromNib {
    
    
    imgar=[NSArray arrayWithObjects:[UIImage imageNamed:@"card1"],
           [UIImage imageNamed:@"card2"],
           [UIImage imageNamed:@"card3"],
           [UIImage imageNamed:@"card4"],
           [UIImage imageNamed:@"card5"],
           [UIImage imageNamed:@"card6"],
           [UIImage imageNamed:@"card7"],
           [UIImage imageNamed:@"card8"],
           [UIImage imageNamed:@"card9"], nil];
    

    self.Dict=[[NSMutableDictionary alloc]init];
    
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    self.Dict=  [UserDefaults objectForKey:@"EmpExpiry"];
     cou= [UserDefaults objectForKey:@"empcount"];
    
    NSLog(@"%@",self.Dict);
    
    
    //    self.collectionView.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(self.frame.size.width,160);
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    // Register the colleciton cell
    [_collectionView registerNib:[UINib nibWithNibName:@"c_expiry_collcellCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"coll_cell"];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(self.frame.size.width,160);
    // (self.view.frame.origin.x+10, (self.view.frame.size.height/2)-150, self.view.frame.size.width-20,300)
    
    return size;
    
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return -4.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return -4.0;
}

#pragma mark - Getter/Setter overrides
- (void)setCollectionData:(NSArray *)collectionData {
    _collectionData = collectionData;
    [_collectionView setContentOffset:CGPointZero animated:NO];
    [_collectionView reloadData];
}


#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *aa=[[[_Dict objectForKey:@"employee_document_expiring_date_list"] objectAtIndex:cou.intValue]objectForKey:@"doc_exp_date" ];
    lithin=[[NSMutableArray alloc]init];
    lithin=[aa objectAtIndex:0];
    return lithin.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    c_expiry_collcellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coll_cell" forIndexPath:indexPath];
    
    int frequency = indexPath.row %10;
    switch (frequency) {
        case 0:
            cell.img.image=[imgar objectAtIndex:frequency];
            break;
        case 1:
            cell.img.image=[imgar objectAtIndex:frequency];
            break;
        case 2:
         cell.img.image=[imgar objectAtIndex:frequency];
            break;
        case 3:
         cell.img.image=[imgar objectAtIndex:frequency];
            break;
        case 4:
            cell.img.image=[imgar objectAtIndex:frequency];
            break;
        case 5:
            cell.img.image=[imgar objectAtIndex:frequency];
            break;
        case 6:
            cell.img.image=[imgar objectAtIndex:frequency];
            break;
        case 7:
            cell.img.image=[imgar objectAtIndex:frequency];
            break;
        case 8:
            cell.img.image=[imgar objectAtIndex:frequency];
            break;




            //up to case 9
        default:
            break;
    }
    
    
    cell.labl1.text=[[lithin objectAtIndex:indexPath.row] objectForKey:@"document_title"];
    cell.labl2.text=[[lithin objectAtIndex:indexPath.row] objectForKey:@"document_end_date"];

    
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
