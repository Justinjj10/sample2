//
//  c_expiry_view.m
//  sample2
//
//  Created by Mac on 2/1/17.
//  Copyright © 2017 Machk. All rights reserved.
//

#import "c_expiry_view.h"

@implementation c_expiry_view
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
   self.Dict=  [UserDefaults objectForKey:@"CompanyExpiry"];
    cou= [UserDefaults objectForKey:@"mycount"];
    
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
   //  (self.frame.origin.x+10, (self.frame.size.height/2)-150, self.frame.size.width-20,300)
    
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
    
    
    
    NSArray *aa=[[[_Dict objectForKey:@"company_document_expiring_date_list"] objectAtIndex:cou.intValue]objectForKey:@"Document Expiring Dates" ];
    lithin=[[NSMutableArray alloc]init];
lithin=[aa objectAtIndex:0];
    return lithin.count;
    
//    return [[[[_Dict objectForKey:@"company_document_expiring_date_list"]valueForKey:@"Document Expiring Dates" ]objectAtIndex:_janu] count];
    ;
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
            
    }
    
    
    
    cell.labl1.text=[[lithin objectAtIndex:indexPath.row] objectForKey:@"doc_title"];
    cell.labl2.text=[[lithin objectAtIndex:indexPath.row] objectForKey:@"doc_end_date"];

        
        
            
            
          //  NSArray *arry2=[arry1 objectAtIndex:j];
            
            //NSLog(@"%@",arry2);
            
            
             //cell.labl2.text=ss   ;
            
            
     
        
  
       
        
    //}
    
    
//    NSArray *arry1=[[[[[[self.Dict objectForKey:@"company_document_expiring_date_list"]valueForKey:@"Document Expiring Dates"] objectAtIndex:0] objectAtIndex:0] valueForKey:@"doc_end_date"] objectAtIndex:0];
//
    
    
    
   // cell.labl1.text=str;
    return cell;
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary *cellData = [self.collectionData objectAtIndex:[indexPath row]];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectItemFromCollectionView" object:cellData];
//}
//




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
