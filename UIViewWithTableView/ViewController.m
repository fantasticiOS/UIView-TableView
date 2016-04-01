//
//  ViewController.m
//  UIViewWithTableView
//
//  Created by 张彤 on 3/31/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import "ViewController.h"
#import "ListView.h"
#import "ListCustomCell.h"

#import "Masonry.h"
#import "TableViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addListView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addListView{


    /*
     
     创建cell数组,必须最先实现,自定义UIView只有得到cell之后才能计算cell的高度,继而得出自定义tableView的高度,作为容器的UIView才能知道有多高
     
     **/
    NSMutableArray *cellArray=[NSMutableArray new];
    ListCustomCell *cell0=[[ListCustomCell alloc]init];
    cell0.labelAddress.text=@"江苏省南京市鼓楼区----北京北京市昌平区北京北京市昌平区北京北京市昌平区北京北京市昌平区北京北京市昌平区北京北京市昌平区";
    [cell0 setClickedHandler:^(ListCustomCell *cell, BOOL selected) {
        [self presentViewController:[[TableViewController alloc]init] animated:YES
                         completion:^{
                             
                         }];

    }];
    
    ListCustomCell *cell1=[[ListCustomCell alloc]init];
    cell1.labelAddress.text=@"江苏省南京市鼓楼区----北京北京市昌平区北京北京市昌平区北京北京市昌平区北京北京市昌平区";
    [cell1 setClickedHandler:^(ListCustomCell *cell, BOOL selected) {
        
        [self presentViewController:[[TableViewController alloc]init] animated:YES
                         completion:^{
                             
                         }];
    }];
    
    
    
    ListCustomCell *cell2=[[ListCustomCell alloc]init];
    cell2.labelAddress.text=@"江苏省南京市鼓楼区----北京北京市昌平区";
    [cell2 setClickedHandler:^(ListCustomCell *cell, BOOL selected) {
        [self presentViewController:[[TableViewController alloc]init] animated:YES
                         completion:^{
                             
                         }];
    }];
    
    cellArray=(NSMutableArray*)@[cell0,cell1,cell2];
    
    
    
    
    ListView *listView=[[ListView alloc]init];
    [self.view addSubview:listView];
    listView.entityViewController=[[ListTableController alloc]init];
    
    
    
    
    /*
     
     注意:必须要先实现ListView的block属性,再给ListView的cellArray属性赋值,
     
     **/
    __weak typeof(ListView)* weakListView=listView;//防止循环引用
    listView.entityViewController.blockTotalHeight=^(CGFloat totalHeight){
        
        [weakListView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(@(100));
            
            //A:表示UIView的高度是动态高度,随tableview的高度变化而变化,不可滚动
            make.height.equalTo(@(totalHeight));
            
            
            
            
        }];
        
    };
    listView.entityViewController.cellArray=cellArray;
    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
