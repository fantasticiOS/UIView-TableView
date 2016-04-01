//
//  ListView.h
//  UIViewWithTableView
//
//  Created by 张彤 on 3/31/16.
//  Copyright © 2016 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableController.h"

@interface ListView : UIView

@property (nonatomic, strong) UIView   *contentView;
@property (nonatomic, strong) ListTableController *entityViewController;

@end
