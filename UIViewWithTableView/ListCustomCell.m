//
//  ListCustomCell.m
//  UIViewWithTableView
//
//  Created by 张彤 on 3/31/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import "ListCustomCell.h"
#import "Masonry.h"
#import <objc/runtime.h>
#define kAssociateKey @"AssociateKey"

#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kFont16 [UIFont systemFontOfSize:16]
#define kBlackColor [UIColor blackColor]

@implementation ListCustomCell
/*
 
 重写cell初始化方法
 
 **/
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        UILabel *label=[self getLabelWithTextFont:kFont16 AndSize:16 AndColor:kBlackColor AndTextAligment:NSTextAlignmentCenter AndText:@""];
        
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@(0));
            make.centerX.equalTo(@(0));
            make.width.equalTo(@(kMainScreenWidth-40));
        }];
        
        label.numberOfLines=0;
        self.labelAddress=label;
        label.numberOfLines=0;
        
        
        
    }
    
    
    
    return self;
}







/*
 
 根据子控件数据计算行高
 
 */
-(CGFloat)getCellHeight{
    
    
    CGSize labelAddressSize=[self.labelAddress systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    
    return labelAddressSize.height+20;
    
    
    
}


/*
 
 处理事件
 
 **/
-(void)setHandlerForCell:(BLocKClickedHandler)handlerForCell{

    _handlerForCell=handlerForCell;
    /*
     
     可以增加额外的操作
     
     **/

}
-(void)setClickedHandler:(BLocKClickedHandler)handlerForTableView{

    
    objc_setAssociatedObject(self, kAssociateKey, handlerForTableView, OBJC_ASSOCIATION_COPY);
    
    
    
    self.handlerForCell=handlerForTableView;//如果不在这里把setClickedHandler的block参数拿过来赋给cell的block变量属性,tableview的didSelectRow方法就拿不到block,导致不能调用block


}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:YES];
    
    
    
/*
 
 监测cell选中方式二:通过setClickedHandler方法拿到block,利用runTime机制进行动态绑定,在setSelected: animate: 方法中取出block,根据cell的选中状态判断是否调用block
 
 **/
    
    BLocKClickedHandler block=objc_getAssociatedObject(self, kAssociateKey);
    if(selected==YES){
    
        block(self,YES);
    
    }
    


}


#pragma =====PrivateMethod========
-(UILabel *)getLabelWithTextFont:(UIFont*)font AndSize:(int)size AndColor:(UIColor *)color AndTextAligment:(NSTextAlignment)alignment AndText:(NSString *)text{
    UILabel *lbl =[[UILabel alloc]init];
    lbl.font=[UIFont fontWithName:@"STHeiTiSC-Light" size:size];//font;
    lbl.textColor=color;
    lbl.textAlignment=alignment;
    lbl.text=text;
    return lbl;
    
}





@end
