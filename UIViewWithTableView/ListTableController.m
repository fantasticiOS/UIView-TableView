//
//  ListTableController.m
//  UIViewWithTableView
//
//  Created by 张彤 on 3/31/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import "ListTableController.h"
#import "Masonry.h"
#import "ListCustomCell.h"


@interface ListTableController ()

@property (nonatomic, strong) NSMutableArray *muteCellHeightArray;

@end

@implementation ListTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.muteCellHeightArray=[NSMutableArray new];
    
}
-(void)setCellArray:(NSMutableArray *)cellArray{
    
    _cellArray=cellArray;//从使用者那里拿到
    CGFloat totalHeight=0;
    for(ListCustomCell *cell in self.cellArray){
        CGFloat height=[cell getCellHeight];
        totalHeight+=height;
        [self.muteCellHeightArray addObject:@(height)];
        
    }
    
    if(self.blockTotalHeight){
        self.blockTotalHeight(totalHeight);
    }
    
    
}
-(NSMutableArray*)initializeCellArray{
    NSMutableArray *cellArray=[NSMutableArray new];
    
    cellArray=self.cellArray;
    
    
    
    return cellArray;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
       NSLog(@"%luself.cellArray.count1",(unsigned long)self.cellArray.count);
    
    return self.cellArray[indexPath.row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    /*
     监测cell选中方式一:需要给cell添加属性,因为cell的创建不可能放在这里,而监测cell的选中事件又必须放在这里,需要在这里调用block传递cell和indexpath
     **/
    ListCustomCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if(cell && [cell isKindOfClass:[ListCustomCell class]]){
        if(cell.handlerForCell){
            
            cell.handlerForCell(cell,indexPath);
        }
        
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSNumber *numHeight=self.muteCellHeightArray[indexPath.row];
    
    
    return  numHeight.floatValue;
    
}

@end
