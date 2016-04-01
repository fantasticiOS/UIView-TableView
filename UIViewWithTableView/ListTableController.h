//
//  ListTableController.h
//  UIViewWithTableView
//
//  Created by 张彤 on 3/31/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^BlockGetTableHeight)(CGFloat height);//记录行高,传给cell的创建者

@interface ListTableController : UITableViewController
@property (nonatomic, strong) NSMutableArray *cellArray;//接收创建者传来的实体cell
@property (nonatomic, copy) BlockGetTableHeight blockTotalHeight;//此属性记录行高,参数传给调用者(参数从哪来?答:在拿到cell之后就可以通过
@end
