//
//  ListCustomCell.h
//  UIViewWithTableView
//
//  Created by 张彤 on 3/31/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  ListCustomCell;
typedef void (^BLocKClickedHandler)(ListCustomCell *cell,BOOL selected);



@interface ListCustomCell : UITableViewCell


@property (nonatomic, strong) UILabel *labelAddress;
-(CGFloat)getCellHeight;


@property (nonatomic, copy) BLocKClickedHandler handlerForCell;
-(void)setClickedHandler:(BLocKClickedHandler)handlerForTableView;
@end
