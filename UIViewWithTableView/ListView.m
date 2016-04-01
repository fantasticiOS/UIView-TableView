//
//  ListView.m
//  UIViewWithTableView
//
//  Created by 张彤 on 3/31/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import "ListView.h"
#import "Masonry.h"

@implementation ListView
-(void)setEntityViewController:(ListTableController *)entityViewController{
    
    _entityViewController=entityViewController;
    self.contentView=entityViewController.tableView;
    
    
}

-(void)setContentView:(UIView *)contentView{
    _contentView=contentView;
    _contentView.userInteractionEnabled=YES;
    [self addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
        make.top.equalTo(@(0));
        make.bottom.equalTo(@(0));
    }];
    
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
       /*
        
        这里可以为view增加一些初始化设置,支持自定义
        
        **/
        
        
    }
    
    
    
    return self;
}


@end
